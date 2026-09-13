{
  description = "OMEN-HUB: HP Laptop manager for Linux";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = rec {
          omen-hub = pkgs.rustPlatform.buildRustPackage {
            pname = "omen-hub";
            version = "2.0.3";

            src = ./.;

            cargoLock = {
              lockFile = ./Cargo.lock;
            };

            nativeBuildInputs = with pkgs; [
              pkg-config
            ];

            buildInputs = with pkgs; [
              dbus
              glib
              gtk4
              libadwaita
            ];

            buildPhase = ''
              for crate in src/omen-space-daemon src/omen-cli src/omen-tray src/omen-gui; do
                cargo build --release --manifest-path $crate/Cargo.toml
              done
            '';

            installPhase = ''
              mkdir -p $out/libexec/omen-hub
              mkdir -p $out/libexec/omen-space
              mkdir -p $out/bin
              mkdir -p $out/lib/systemd/system
              mkdir -p $out/lib/sysusers.d
              mkdir -p $out/lib/udev/rules.d
              mkdir -p $out/share/dbus-1/system.d
              mkdir -p $out/share/dbus-1/services
              mkdir -p $out/share/applications
              mkdir -p $out/share/pixmaps
              mkdir -p $out/share/omen-hub/assets
              mkdir -p $out/share/omen-space/assets

              cp target/*/release/omen-hub-daemon $out/libexec/omen-hub/omen-hub-daemon || cp target/release/omen-hub-daemon $out/libexec/omen-hub/omen-hub-daemon
              ln -sf $out/libexec/omen-hub/omen-hub-daemon $out/libexec/omen-space/omen-space-daemon

              cp target/*/release/omen-hub-cli $out/bin/ || cp target/release/omen-hub-cli $out/bin/
              ln -sf $out/bin/omen-hub-cli $out/bin/omen-cli

              cp target/*/release/omen-hub-tray $out/bin/ || cp target/release/omen-hub-tray $out/bin/
              ln -sf $out/bin/omen-hub-tray $out/bin/omen-tray

              cp target/*/release/omen-hub-gui $out/bin/ || cp target/release/omen-hub-gui $out/bin/
              ln -sf $out/bin/omen-hub-gui $out/bin/omen-gui

              cp data/omen-hub-daemon.service $out/lib/systemd/system/
              ln -sf $out/lib/systemd/system/omen-hub-daemon.service $out/lib/systemd/system/omen-space-daemon.service
              cp data/sysusers.d/omen-hub.conf $out/lib/sysusers.d/
              cp data/sysusers.d/omen-space.conf $out/lib/sysusers.d/
              cp data/99-omen-hub.rules $out/lib/udev/rules.d/
              cp data/99-omen-space.rules $out/lib/udev/rules.d/
              cp data/org.hp.omen.conf $out/share/dbus-1/system.d/
              cp data/org.hp.OmenSpace.desktop $out/share/applications/
              cp data/omen-hub.desktop $out/share/applications/
              cp data/org.hp.OmenSpace.service $out/share/dbus-1/services/
              cp src/omen-gui/assets/omenspace.png $out/share/pixmaps/
              cp src/omen-gui/assets/omen-hub.png $out/share/pixmaps/
              cp -r src/omen-gui/assets/* $out/share/omen-hub/assets/
              cp -r src/omen-gui/assets/* $out/share/omen-space/assets/

              # Fix systemd paths
              find $out/lib/systemd/system -type f -exec sed -i "s|/usr/libexec|$out/libexec|g" {} +
            '';
          };

          omen-space = omen-hub;
          default = omen-hub;
        };
      }) // {
      nixosModules.default = { config, lib, pkgs, ... }:
        with lib;
        let
          cfg = config.programs.omen-hub;
          cfgLegacy = config.programs.omen-space;
          enabled = cfg.enable || cfgLegacy.enable;
        in {
          options.programs.omen-hub = {
            enable = lib.mkEnableOption "OMEN-HUB: HP Laptop manager for Linux";
          };
          options.programs.omen-space = {
            enable = lib.mkEnableOption "OMEN-HUB (Legacy compatibility option)";
          };

          config = mkIf enabled {
            environment.systemPackages = [ self.packages.${pkgs.system}.omen-hub ];
            services.dbus.packages = [ self.packages.${pkgs.system}.omen-hub ];
            systemd.packages = [ self.packages.${pkgs.system}.omen-hub ];
            
            systemd.services.omen-hub-daemon.wantedBy = [ "multi-user.target" ];
            
            users.groups.omen-hw = {};

            boot.kernelModules = [ "hp-wmi" "hp-omen-extra" ];

            boot.extraModulePackages = [
              (pkgs.linuxPackages.callPackage ({ stdenv, kernel }: stdenv.mkDerivation {
                pname = "omen-space-driver";
                version = "2.0.3";
                src = "${self.packages.${pkgs.system}.omen-space.src}/driver";
                nativeBuildInputs = kernel.moduleBuildDependencies;
                makeFlags = [
                  "KERNELRELEASE=${kernel.modDirVersion}"
                  "KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
                  "INSTALL_MOD_PATH=$(out)"
                ];
                installPhase = ''
                  make -C ${kernel.dev}/lib/modules/${kernel.modDirVersion}/build M=$(pwd) INSTALL_MOD_PATH=$out modules_install
                '';
              }) { kernel = config.boot.kernelPackages.kernel; })
            ];
          };
        };
    };
}
