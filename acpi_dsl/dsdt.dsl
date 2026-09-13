/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20260408 (64-bit version)
 * Copyright (c) 2000 - 2026 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of dsdt.dat
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0000C5FE (50686)
 *     Revision         0x02
 *     Checksum         0x2E
 *     OEM ID           "HPQOEM"
 *     OEM Table ID     "SLIC-MPC"
 *     OEM Revision     0x00000002 (2)
 *     Compiler ID      "HP  "
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("", "DSDT", 2, "HPQOEM", "SLIC-MPC", 0x00000002)
{
    External (_PR_.C000, UnknownObj)
    External (_PR_.C000._PPC, IntObj)
    External (_PR_.C000.PPCV, IntObj)
    External (_PR_.C001, UnknownObj)
    External (_PR_.C001._PPC, IntObj)
    External (_PR_.C001.PPCV, IntObj)
    External (_PR_.C002, UnknownObj)
    External (_PR_.C002._PPC, IntObj)
    External (_PR_.C002.PPCV, IntObj)
    External (_PR_.C003, UnknownObj)
    External (_PR_.C003._PPC, IntObj)
    External (_PR_.C003.PPCV, IntObj)
    External (_PR_.C004, UnknownObj)
    External (_PR_.C004.PPCV, IntObj)
    External (_PR_.C005, UnknownObj)
    External (_PR_.C005.PPCV, IntObj)
    External (_PR_.C006, UnknownObj)
    External (_PR_.C006.PPCV, IntObj)
    External (_PR_.C007, UnknownObj)
    External (_PR_.C007.PPCV, IntObj)
    External (_SB_.ALIB, MethodObj)    // 2 Arguments
    External (_SB_.APTS, MethodObj)    // 1 Arguments
    External (_SB_.AWAK, MethodObj)    // 1 Arguments
    External (_SB_.NPCF, UnknownObj)
    External (_SB_.NPCF.DTGP, IntObj)
    External (_SB_.PCI0.GFX0.VGA_.LCD_, DeviceObj)
    External (_SB_.PCI0.GPP0.PEGP, DeviceObj)
    External (_SB_.PCI0.GPP0.PEGP.LCD0, DeviceObj)
    External (_SB_.PCI0.GPP0.VGA_.AFN2, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.GPPX, DeviceObj)
    External (_SB_.PCI0.GPPX._ADR, IntObj)
    External (_SB_.PCI0.LPC0.EC0_.ESMB, UnknownObj)
    External (_SB_.PCI0.LPC0.EC0_.ESMS, UnknownObj)
    External (_SB_.PCI0.LPC0.RTC_.STSL, UnknownObj)
    External (_SB_.PCI0.VGA_.LCD_, DeviceObj)
    External (_SB_.PEP_, DeviceObj)
    External (_SB_.TPM2.PTS_, MethodObj)    // 1 Arguments
    External (_SB_.UCEV, MethodObj)    // 0 Arguments
    External (_SB_.WMID, UnknownObj)
    External (_SB_.WMID.BRTE, FieldUnitObj)
    External (_SB_.WMID.WED1, IntObj)
    External (_SB_.WMID.WEI1, IntObj)
    External (AFN4, MethodObj)    // 1 Arguments
    External (AFN7, MethodObj)    // 1 Arguments
    External (ESMB, IntObj)
    External (ESMS, IntObj)
    External (GPHM, IntObj)
    External (M000, MethodObj)    // 1 Arguments
    External (M017, MethodObj)    // 6 Arguments
    External (M019, MethodObj)    // 4 Arguments
    External (M020, MethodObj)    // 5 Arguments
    External (M037, DeviceObj)
    External (M046, IntObj)
    External (M047, IntObj)
    External (M050, DeviceObj)
    External (M051, DeviceObj)
    External (M052, DeviceObj)
    External (M053, DeviceObj)
    External (M054, DeviceObj)
    External (M055, DeviceObj)
    External (M056, DeviceObj)
    External (M057, DeviceObj)
    External (M058, DeviceObj)
    External (M059, DeviceObj)
    External (M062, DeviceObj)
    External (M068, DeviceObj)
    External (M069, DeviceObj)
    External (M070, DeviceObj)
    External (M071, DeviceObj)
    External (M072, DeviceObj)
    External (M074, DeviceObj)
    External (M075, DeviceObj)
    External (M076, DeviceObj)
    External (M077, DeviceObj)
    External (M078, DeviceObj)
    External (M079, DeviceObj)
    External (M080, DeviceObj)
    External (M081, DeviceObj)
    External (M082, FieldUnitObj)
    External (M083, FieldUnitObj)
    External (M084, FieldUnitObj)
    External (M085, FieldUnitObj)
    External (M086, FieldUnitObj)
    External (M087, FieldUnitObj)
    External (M088, FieldUnitObj)
    External (M089, FieldUnitObj)
    External (M090, FieldUnitObj)
    External (M091, FieldUnitObj)
    External (M092, FieldUnitObj)
    External (M093, FieldUnitObj)
    External (M094, FieldUnitObj)
    External (M095, FieldUnitObj)
    External (M096, FieldUnitObj)
    External (M097, FieldUnitObj)
    External (M098, FieldUnitObj)
    External (M099, FieldUnitObj)
    External (M100, FieldUnitObj)
    External (M101, FieldUnitObj)
    External (M102, FieldUnitObj)
    External (M103, FieldUnitObj)
    External (M104, FieldUnitObj)
    External (M105, FieldUnitObj)
    External (M106, FieldUnitObj)
    External (M107, FieldUnitObj)
    External (M108, FieldUnitObj)
    External (M109, FieldUnitObj)
    External (M110, FieldUnitObj)
    External (M115, BuffObj)
    External (M116, BuffFieldObj)
    External (M117, BuffFieldObj)
    External (M118, BuffFieldObj)
    External (M119, BuffFieldObj)
    External (M120, BuffFieldObj)
    External (M122, FieldUnitObj)
    External (M127, DeviceObj)
    External (M128, FieldUnitObj)
    External (M131, FieldUnitObj)
    External (M132, FieldUnitObj)
    External (M133, FieldUnitObj)
    External (M134, FieldUnitObj)
    External (M135, FieldUnitObj)
    External (M136, FieldUnitObj)
    External (M220, FieldUnitObj)
    External (M221, FieldUnitObj)
    External (M226, FieldUnitObj)
    External (M227, DeviceObj)
    External (M229, FieldUnitObj)
    External (M231, FieldUnitObj)
    External (M233, FieldUnitObj)
    External (M235, FieldUnitObj)
    External (M23A, FieldUnitObj)
    External (M251, FieldUnitObj)
    External (M280, FieldUnitObj)
    External (M290, FieldUnitObj)
    External (M29A, FieldUnitObj)
    External (M310, FieldUnitObj)
    External (M31C, FieldUnitObj)
    External (M320, FieldUnitObj)
    External (M321, FieldUnitObj)
    External (M322, FieldUnitObj)
    External (M323, FieldUnitObj)
    External (M324, FieldUnitObj)
    External (M325, FieldUnitObj)
    External (M326, FieldUnitObj)
    External (M327, FieldUnitObj)
    External (M328, FieldUnitObj)
    External (M329, DeviceObj)
    External (M32A, DeviceObj)
    External (M32B, DeviceObj)
    External (M330, DeviceObj)
    External (M331, FieldUnitObj)
    External (M378, FieldUnitObj)
    External (M379, FieldUnitObj)
    External (M380, FieldUnitObj)
    External (M381, FieldUnitObj)
    External (M382, FieldUnitObj)
    External (M383, FieldUnitObj)
    External (M384, FieldUnitObj)
    External (M385, FieldUnitObj)
    External (M386, FieldUnitObj)
    External (M387, FieldUnitObj)
    External (M388, FieldUnitObj)
    External (M389, FieldUnitObj)
    External (M390, FieldUnitObj)
    External (M391, FieldUnitObj)
    External (M392, FieldUnitObj)
    External (M404, BuffObj)
    External (M408, MutexObj)
    External (M414, FieldUnitObj)
    External (M444, FieldUnitObj)
    External (M449, FieldUnitObj)
    External (M453, FieldUnitObj)
    External (M454, FieldUnitObj)
    External (M455, FieldUnitObj)
    External (M456, FieldUnitObj)
    External (M457, FieldUnitObj)
    External (M460, MethodObj)    // 7 Arguments
    External (M4C0, FieldUnitObj)
    External (M4F0, FieldUnitObj)
    External (M600, MethodObj)    // 2 Arguments
    External (M601, MethodObj)    // 6 Arguments
    External (M610, FieldUnitObj)
    External (M620, FieldUnitObj)
    External (M631, FieldUnitObj)
    External (M652, FieldUnitObj)
    External (MPTS, MethodObj)    // 1 Arguments
    External (MWAK, MethodObj)    // 1 Arguments

    OperationRegion (PCB0, SystemIO, 0x70, 0x02)
    Field (PCB0, ByteAcc, NoLock, Preserve)
    {
        PCI0,   8, 
        PCD0,   8
    }

    IndexField (PCI0, PCD0, ByteAcc, NoLock, Preserve)
    {
    }

    OperationRegion (PCB1, SystemIO, 0x72, 0x02)
    Field (PCB1, ByteAcc, NoLock, Preserve)
    {
        PCI1,   8, 
        PCD1,   8
    }

    IndexField (PCI1, PCD1, ByteAcc, NoLock, Preserve)
    {
        Offset (0x42), 
        OA01,   8, 
        Offset (0x52), 
        TPID,   8, 
        Offset (0x8C), 
        S3PT,   8, 
        S3CB,   8, 
        S4PT,   8, 
        S4CB,   8, 
        Offset (0xCA), 
        EIBF,   1, 
        Offset (0xCF), 
        ECSF,   1, 
        Offset (0xE2), 
        QE49,   8, 
        Offset (0xFC), 
        CMST,   8, 
        WA3F,   8, 
        FFAL,   1, 
        THSD,   1, 
        PDPN,   1
    }

    OperationRegion (SPRT, SystemIO, 0xB0, 0x02)
    Field (SPRT, ByteAcc, Lock, Preserve)
    {
        SSMP,   8
    }

    OperationRegion (DBG0, SystemIO, 0x80, One)
    Field (DBG0, ByteAcc, NoLock, Preserve)
    {
        IO80,   8
    }

    OperationRegion (DBG1, SystemIO, 0x80, 0x02)
    Field (DBG1, WordAcc, NoLock, Preserve)
    {
        P80H,   16
    }

    OperationRegion (ACMS, SystemIO, 0x72, 0x02)
    Field (ACMS, ByteAcc, NoLock, Preserve)
    {
        ACMX,   8, 
        ACMA,   8
    }

    IndexField (ACMX, ACMA, ByteAcc, NoLock, Preserve)
    {
        Offset (0xB9), 
        IMEN,   8
    }

    OperationRegion (PSMI, SystemIO, 0xB0, 0x02)
    Field (PSMI, ByteAcc, NoLock, Preserve)
    {
        APMC,   8, 
        APMD,   8
    }

    OperationRegion (PMRG, SystemIO, 0x0CD6, 0x02)
    Field (PMRG, ByteAcc, NoLock, Preserve)
    {
        PMRI,   8, 
        PMRD,   8
    }

    IndexField (PMRI, PMRD, ByteAcc, NoLock, Preserve)
    {
            ,   6, 
        HPEN,   1, 
        Offset (0x60), 
        P1EB,   16, 
        Offset (0xF0), 
            ,   3, 
        RSTU,   1
    }

    OperationRegion (GSMG, SystemMemory, 0xFED81500, 0x03FF)
    Field (GSMG, AnyAcc, NoLock, Preserve)
    {
        Offset (0x5C), 
        Offset (0x5E), 
        GS23,   1, 
            ,   5, 
        GV23,   1, 
        GE23,   1, 
        Offset (0xA0), 
        Offset (0xA2), 
        GS40,   1, 
            ,   5, 
        GV40,   1, 
        GE40,   1
    }

    OperationRegion (GSMM, SystemMemory, 0xFED80000, 0x1000)
    Field (GSMM, AnyAcc, NoLock, Preserve)
    {
        Offset (0x288), 
            ,   1, 
        CLPS,   1, 
        Offset (0x2B0), 
            ,   2, 
        SLPS,   2, 
        Offset (0x3BB), 
            ,   6, 
        PWDE,   1
    }

    OperationRegion (P1E0, SystemIO, P1EB, 0x04)
    Field (P1E0, ByteAcc, NoLock, Preserve)
    {
            ,   14, 
        PEWS,   1, 
        WSTA,   1, 
            ,   14, 
        PEWD,   1
    }

    OperationRegion (IOCC, SystemIO, 0x0400, 0x80)
    Field (IOCC, ByteAcc, NoLock, Preserve)
    {
        Offset (0x01), 
            ,   2, 
        RTCS,   1
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        PRWP [Zero] = Arg0
        PRWP [One] = Arg1
        If ((DAS3 == Zero))
        {
            If ((Arg1 <= 0x03))
            {
                PRWP [One] = Zero
            }
        }

        Return (PRWP) /* \PRWP */
    }

    Method (SPTS, 1, NotSerialized)
    {
        If ((Arg0 == 0x03))
        {
            RSTU = Zero
        }

        CLPS = One
        SLPS = One
        PEWS = PEWS /* \PEWS */
    }

    Method (SWAK, 1, NotSerialized)
    {
        If ((Arg0 == 0x03))
        {
            RSTU = One
        }

        PEWS = PEWS /* \PEWS */
        PEWD = Zero
        If (((Arg0 == 0x03) || (Arg0 == 0x04)))
        {
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }
    }

    Method (TPST, 1, Serialized)
    {
        M000 (Arg0)
    }

    OperationRegion (GNVS, SystemMemory, 0x5AF78998, 0x00000196)
    Field (GNVS, AnyAcc, NoLock, Preserve)
    {
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        BRTL,   8, 
        TLST,   8, 
        IGDS,   8, 
        LCDA,   16, 
        CSTE,   16, 
        NSTE,   16, 
        CADL,   16, 
        PADL,   16, 
        LIDS,   8, 
        PWRS,   8, 
        BVAL,   32, 
        ADDL,   16, 
        BCMD,   8, 
        SBFN,   8, 
        DID,    32, 
        INFO,   2048, 
        TOML,   8, 
        TOMH,   8, 
        CEBP,   8, 
        C0LS,   8, 
        C1LS,   8, 
        C0HS,   8, 
        C1HS,   8, 
        ROMS,   32, 
        MUXF,   8, 
        PDDN,   8, 
        CNSB,   8, 
        RDHW,   8, 
        DAS3,   8, 
        TNBH,   8, 
        TCP0,   8, 
        TCP1,   8, 
        ATNB,   8, 
        PCP0,   8, 
        PCP1,   8, 
        PWMN,   8, 
        LPTY,   8, 
        M92D,   8, 
        WKPM,   8, 
        ALST,   8, 
        AFUC,   8, 
        EXUS,   8, 
        GV0E,   8, 
        WLSH,   8, 
        TSSS,   8, 
        AOZP,   8, 
        TZFG,   8, 
        BPS0,   8, 
        NAPC,   8, 
        PCBA,   32, 
        PCBL,   32, 
        WLAN,   8, 
        BLTH,   8, 
        GPSS,   8, 
        NFCS,   8, 
        SBTY,   8, 
        BDID,   16, 
        MWTT,   8, 
        ACPM,   8, 
        KBCS,   8, 
        ACEC,   8, 
        DPTC,   8, 
        ECTL,   8, 
        MM64,   8, 
        HMB1,   64, 
        HMB2,   64, 
        HMM1,   64, 
        HMM2,   64, 
        HML1,   64, 
        HML2,   64, 
        WOVS,   8, 
        TCNT,   8, 
        TOPM,   32, 
        MB32,   32, 
        ML32,   32
    }

    OperationRegion (OGNS, SystemMemory, 0x5AF3CE98, 0x00000085)
    Field (OGNS, AnyAcc, Lock, Preserve)
    {
        OG00,   8, 
        OG01,   8, 
        M2WL,   8, 
        THPN,   8, 
        PBAR,   8, 
        THPD,   8, 
        DTEN,   8, 
        SDMO,   8, 
        TBEN,   8, 
        TBNH,   8, 
        RV2I,   8, 
        ISDS,   8, 
        PSEL,   8, 
        TPPL,   16, 
        TRCF,   16, 
        STXE,   8, 
        STX0,   8, 
        STX1,   8, 
        STX2,   8, 
        STX3,   8, 
        STX4,   8, 
        STX5,   8, 
        STX6,   8, 
        STX7,   8, 
        STX8,   8, 
        STX9,   8, 
        WRFE,   8, 
        WRC1,   8, 
        WRC2,   8, 
        WRC3,   8, 
        WRC4,   8, 
        RTXE,   8, 
        RTX1,   8, 
        RTX2,   8, 
        RTX3,   8, 
        RTX4,   8, 
        RTX5,   8, 
        RTX6,   8, 
        RTX7,   8, 
        RTX8,   8, 
        RTX9,   8, 
        RX10,   8, 
        RX11,   8, 
        RX12,   8, 
        RX13,   8, 
        RX14,   8, 
        RX15,   8, 
        RX16,   8, 
        RX17,   8, 
        RX18,   8, 
        RX19,   8, 
        RX20,   8, 
        W10S,   8, 
        STSL,   8, 
        HROL,   8, 
        HW6B,   8, 
        HW6S,   32, 
        WOAS,   8, 
        DHVC,   8, 
        DAVC,   8, 
        NHAD,   32, 
        DAV1,   8, 
        DVP9,   8, 
        ECON,   8, 
        OSYS,   16, 
        PSSP,   8, 
        WCVD,   8, 
        STDE,   8, 
        STRS,   8, 
        ST20,   8, 
        ST21,   8, 
        ST22,   8, 
        ST23,   8, 
        ST24,   8, 
        ST25,   8, 
        ST26,   8, 
        ST27,   8, 
        ST28,   8, 
        ST29,   8, 
        ST30,   8, 
        ST31,   8, 
        ST32,   8, 
        ST33,   8, 
        ST34,   8, 
        ST35,   8, 
        ST36,   8, 
        ST37,   8, 
        ST38,   8, 
        ST39,   8, 
        ST40,   8, 
        ST41,   8, 
        ST42,   8, 
        ST43,   8, 
        ST44,   8, 
        ST45,   8, 
        ST46,   8, 
        ST47,   8, 
        ST48,   8, 
        ST49,   8, 
        SD11,   8, 
        SD12,   8, 
        SD13,   8, 
        SD14,   8, 
        SD15,   8, 
        SD16,   8, 
        SD21,   8, 
        SD22,   8, 
        SD23,   8, 
        SD24,   8, 
        SD25,   8, 
        SD26,   8, 
        SD31,   8, 
        SD32,   8, 
        SD33,   8, 
        SD34,   8, 
        SD35,   8, 
        SD36,   8, 
        MPMS,   8, 
        UBCB,   32, 
        GPUW,   8, 
        GPHM,   8
    }

    Method (SCMP, 2, NotSerialized)
    {
        Name (STG1, Buffer (0x50){})
        Name (STG2, Buffer (0x50){})
        STG1 = Arg0
        STG2 = Arg1
        If ((SizeOf (Arg0) != SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Local0 = Zero
        While ((Local0 < SizeOf (Arg0)))
        {
            If ((DerefOf (STG1 [Local0]) != DerefOf (STG2 [Local0]
                )))
            {
                Return (Zero)
            }

            Local0++
        }

        Return (One)
    }

    Name (WNOS, Zero)
    Name (MYOS, Zero)
    Name (HTTS, Zero)
    Name (OSTB, Ones)
    Name (TPOS, Zero)
    Name (LINX, Zero)
    Name (OSSP, Zero)
    Method (SEQL, 2, Serialized)
    {
        Local0 = SizeOf (Arg0)
        Local1 = SizeOf (Arg1)
        If ((Local0 != Local1))
        {
            Return (Zero)
        }

        Name (BUF0, Buffer (Local0){})
        BUF0 = Arg0
        Name (BUF1, Buffer (Local0){})
        BUF1 = Arg1
        Local2 = Zero
        While ((Local2 < Local0))
        {
            Local3 = DerefOf (BUF0 [Local2])
            Local4 = DerefOf (BUF1 [Local2])
            If ((Local3 != Local4))
            {
                Return (Zero)
            }

            Local2++
        }

        Return (One)
    }

    Method (OSTP, 0, NotSerialized)
    {
        If ((OSTB == Ones))
        {
            If (CondRefOf (\_OSI, Local0))
            {
                M460 ("PLA-ASL-\\OSTP \\_OSI exist\n", Zero, Zero, Zero, Zero, Zero, Zero)
                OSTB = 0x70
                TPOS = 0x70
                OSYS = 0x07DD
                If (_OSI ("Windows 2001"))
                {
                    M460 ("PLA-ASL-\\OSTP Call _OSI(%S) = TRUE\n", "Windows 2001", Zero, Zero, Zero, Zero, Zero)
                    OSTB = 0x08
                    TPOS = 0x08
                    OSYS = 0x07D1
                }

                If (_OSI ("Windows 2001.1"))
                {
                    M460 ("PLA-ASL-\\OSTP Call _OSI(%S) = TRUE\n", "Windows 2001.1", Zero, Zero, Zero, Zero, Zero)
                    OSTB = 0x20
                    TPOS = 0x20
                    OSYS = 0x07D3
                }

                If (_OSI ("Windows 2001 SP1"))
                {
                    M460 ("PLA-ASL-\\OSTP Call _OSI(%S) = TRUE\n", "Windows 2001 SP1", Zero, Zero, Zero, Zero, Zero)
                    OSTB = 0x10
                    TPOS = 0x10
                    OSYS = 0x07D1
                }

                If (_OSI ("Windows 2001 SP2"))
                {
                    M460 ("PLA-ASL-\\OSTP Call _OSI(%S) = TRUE\n", "Windows 2001 SP2", Zero, Zero, Zero, Zero, Zero)
                    OSTB = 0x11
                    TPOS = 0x11
                    OSYS = 0x07D2
                }

                If (_OSI ("Windows 2001 SP3"))
                {
                    M460 ("PLA-ASL-\\OSTP Call _OSI(%S) = TRUE\n", "Windows 2001 SP3", Zero, Zero, Zero, Zero, Zero)
                    OSTB = 0x12
                    TPOS = 0x12
                    OSYS = 0x07D2
                }

                If (_OSI ("Windows 2006"))
                {
                    M460 ("PLA-ASL-\\OSTP Call _OSI(%S) = TRUE\n", "Windows 2006", Zero, Zero, Zero, Zero, Zero)
                    OSTB = 0x40
                    TPOS = 0x40
                    OSYS = 0x07D6
                }

                If (_OSI ("Windows 2006 SP1"))
                {
                    M460 ("PLA-ASL-\\OSTP Call _OSI(%S) = TRUE\n", "Windows 2006 SP1", Zero, Zero, Zero, Zero, Zero)
                    OSTB = 0x41
                    TPOS = 0x41
                    OSSP = One
                    OSYS = 0x07D6
                }

                If (_OSI ("Windows 2009"))
                {
                    M460 ("PLA-ASL-\\OSTP Call _OSI(%S) = TRUE\n", "Windows 2009", Zero, Zero, Zero, Zero, Zero)
                    OSSP = One
                    OSTB = 0x50
                    TPOS = 0x50
                    OSYS = 0x07D9
                }

                If (_OSI ("Windows 2012"))
                {
                    M460 ("PLA-ASL-\\OSTP Call _OSI(%S) = TRUE\n", "Windows 2012", Zero, Zero, Zero, Zero, Zero)
                    OSSP = One
                    OSTB = 0x60
                    TPOS = 0x60
                    OSYS = 0x07DC
                }

                If (_OSI ("Windows 2013"))
                {
                    M460 ("PLA-ASL-\\OSTP Call _OSI(%S) = TRUE\n", "Windows 2013", Zero, Zero, Zero, Zero, Zero)
                    OSSP = One
                    OSTB = 0x61
                    TPOS = 0x61
                    OSYS = 0x07DD
                }

                If (_OSI ("Windows 2015"))
                {
                    M460 ("PLA-ASL-\\OSTP Call _OSI(%S) = TRUE\n", "Windows 2015", Zero, Zero, Zero, Zero, Zero)
                    OSSP = One
                    OSTB = 0x70
                    TPOS = 0x70
                    OSYS = 0x07DF
                }
            }
            Else
            {
                M460 ("PLA-ASL-\\OSTP \\_OSI does NOT exist\n", Zero, Zero, Zero, Zero, Zero, Zero)
                If (CondRefOf (\_OS, Local0))
                {
                    M460 ("PLA-ASL-\\OSTP \\_OS exist\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    If (SEQL (_OS, "Microsoft Windows"))
                    {
                        M460 ("PLA-ASL-\\OSTP Call SEQL \\_OS == (%S)\n", "Microsoft Windows", Zero, Zero, Zero, Zero, Zero)
                        OSTB = One
                        TPOS = One
                    }
                    ElseIf (SEQL (_OS, "Microsoft WindowsME: Millennium Edition"))
                    {
                        M460 ("PLA-ASL-\\OSTP Call SEQL \\_OS == (%S)\n", "Microsoft WindowsME: Millennium Edition", Zero, Zero, Zero, Zero, Zero)
                        OSTB = 0x02
                        TPOS = 0x02
                    }
                    ElseIf (SEQL (_OS, "Microsoft Windows NT"))
                    {
                        M460 ("PLA-ASL-\\OSTP Call SEQL \\_OS == (%S)\n", "Microsoft Windows NT", Zero, Zero, Zero, Zero, Zero)
                        OSTB = 0x04
                        TPOS = 0x04
                    }
                    Else
                    {
                        M460 ("PLA-ASL-\\OSTP Call SEQL \\_OS != (%S)\n", "Microsoft Windows", Zero, Zero, Zero, Zero, Zero)
                        OSTB = Zero
                        TPOS = Zero
                    }
                }
                Else
                {
                    M460 ("PLA-ASL-\\OSTP \\_OS does NOT exist\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    OSTB = Zero
                    TPOS = Zero
                }
            }
        }

        M460 ("PLA-ASL-\\OSTP TPOS = 0x%X, Return OSTB = 0x%X\n", TPOS, OSTB, Zero, Zero, Zero, Zero)
        Return (OSTB) /* \OSTB */
    }

    Name (BUFN, Zero)
    Name (MBUF, Buffer (0x1000){})
    OperationRegion (MDBG, SystemMemory, 0x5AEAE018, 0x00001004)
    Field (MDBG, AnyAcc, Lock, Preserve)
    {
        MDG0,   32768
    }

    Method (DB2H, 1, Serialized)
    {
        SHOW (Arg0)
        MDGC (0x20)
        MDG0 = MBUF /* \MBUF */
    }

    Method (DW2H, 1, Serialized)
    {
        Local0 = Arg0
        Local1 = (Arg0 >> 0x08)
        Local0 &= 0xFF
        Local1 &= 0xFF
        DB2H (Local1)
        BUFN--
        DB2H (Local0)
    }

    Method (DD2H, 1, Serialized)
    {
        Local0 = Arg0
        Local1 = (Arg0 >> 0x10)
        Local0 &= 0xFFFF
        Local1 &= 0xFFFF
        DW2H (Local1)
        BUFN--
        DW2H (Local0)
    }

    Method (MBGS, 1, Serialized)
    {
        Local0 = SizeOf (Arg0)
        Name (BUFS, Buffer (Local0){})
        BUFS = Arg0
        MDGC (0x20)
        While (Local0)
        {
            MDGC (DerefOf (BUFS [(SizeOf (Arg0) - Local0)]))
            Local0--
        }

        MDG0 = MBUF /* \MBUF */
    }

    Method (SHOW, 1, Serialized)
    {
        MDGC (NTOC ((Arg0 >> 0x04)))
        MDGC (NTOC (Arg0))
    }

    Method (LINE, 0, Serialized)
    {
        Local0 = BUFN /* \BUFN */
        Local0 &= 0x0F
        While (Local0)
        {
            MDGC (Zero)
            Local0++
            Local0 &= 0x0F
        }
    }

    Method (MDGC, 1, Serialized)
    {
        MBUF [BUFN] = Arg0
        BUFN += One
        If ((BUFN > 0x0FFF))
        {
            BUFN &= 0x0FFF
            UP_L (One)
        }
    }

    Method (UP_L, 1, Serialized)
    {
        Local2 = Arg0
        Local2 <<= 0x04
        MOVE (Local2)
        Local3 = (0x1000 - Local2)
        While (Local2)
        {
            MBUF [Local3] = Zero
            Local3++
            Local2--
        }
    }

    Method (MOVE, 1, Serialized)
    {
        Local4 = Arg0
        BUFN = Zero
        Local5 = (0x1000 - Local4)
        While (Local5)
        {
            Local5--
            MBUF [BUFN] = DerefOf (MBUF [Local4])
            BUFN++
            Local4++
        }
    }

    Method (NTOC, 1, Serialized)
    {
        Local0 = (Arg0 & 0x0F)
        If ((Local0 < 0x0A))
        {
            Local0 += 0x30
        }
        Else
        {
            Local0 += 0x37
        }

        Return (Local0)
    }

    Scope (_SB)
    {
        Device (PLTF)
        {
            Name (_HID, "ACPI0010" /* Processor Container Device */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A05") /* Generic Container Device */)  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Device (C000)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, Zero)  // _UID: Unique ID
            }

            Device (C001)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, One)  // _UID: Unique ID
            }

            Device (C002)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x02)  // _UID: Unique ID
            }

            Device (C003)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x03)  // _UID: Unique ID
            }

            Device (C004)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x04)  // _UID: Unique ID
            }

            Device (C005)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x05)  // _UID: Unique ID
            }

            Device (C006)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x06)  // _UID: Unique ID
            }

            Device (C007)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x07)  // _UID: Unique ID
            }

            Device (C008)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x08)  // _UID: Unique ID
            }

            Device (C009)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x09)  // _UID: Unique ID
            }

            Device (C00A)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0A)  // _UID: Unique ID
            }

            Device (C00B)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0B)  // _UID: Unique ID
            }

            Device (C00C)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0C)  // _UID: Unique ID
            }

            Device (C00D)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0D)  // _UID: Unique ID
            }

            Device (C00E)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0E)  // _UID: Unique ID
            }

            Device (C00F)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0F)  // _UID: Unique ID
            }
        }
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If ((CNSB == Zero))
    {
        If ((DAS3 == One))
        {
            Name (_S3, Package (0x04)  // _S3_: S3 System State
            {
                0x03, 
                0x03, 
                Zero, 
                Zero
            })
        }
    }

    Name (_S4, Package (0x04)  // _S4_: S4 System State
    {
        0x04, 
        0x04, 
        Zero, 
        Zero
    })
    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x05, 
        0x05, 
        Zero, 
        Zero
    })
    Scope (_GPE)
    {
        Method (_L04, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            Notify (\_SB.PCI0.GPP0.PEGP, 0x81) // Information Change
        }

        Method (_L0F, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            Notify (\_SB.PCI0.GPP2, 0x02) // Device Wake
        }
    }

    Name (PICM, Zero)
    Name (GPIC, Zero)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        PICM = Arg0
        GPIC = Arg0
        M460 ("PLA-ASL-\\_PIC Arg0 = 0x%X\n", ToInteger (Arg0), Zero, Zero, Zero, Zero, Zero)
        If (PICM)
        {
            \_SB.DSPI ()
            If (NAPC)
            {
                \_SB.PCI0.NAPE ()
            }
        }
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        SPTS (Arg0)
        M460 ("PLA-ASL-\\_PTS Start Arg0 = 0x%X\n", ToInteger (Arg0), Zero, Zero, Zero, Zero, Zero)
        If ((Arg0 == One))
        {
            \_SB.S80H (0x51)
        }

        If ((Arg0 == 0x03))
        {
            \_SB.S80H (0x53)
            SLPS = One
            \_SB.PCI0.LPC0.EC0.S3ST = One
            \_SB.PCI0.LPC0.EC0.UWAK = One
        }

        If ((Arg0 == 0x04))
        {
            \_SB.S80H (0x54)
            SLPS = One
            RSTU = One
            \_SB.PCI0.LPC0.EC0.S4ST = One
        }

        If ((Arg0 == 0x05))
        {
            \_SB.S80H (0x55)
            If ((WKPM == One))
            {
                PWDE = One
            }

            BCMD = 0x90
            M460 ("PLA-ASL-\\_PTS call \\_SB.BSMI(0x0)\n", Zero, Zero, Zero, Zero, Zero, Zero)
            \_SB.BSMI (Zero)
            M460 ("PLA-ASL-\\_PTS call \\_SB.GSMI(0x3)\n", Zero, Zero, Zero, Zero, Zero, Zero)
            \_SB.GSMI (0x03)
            \_SB.PCI0.LPC0.EC0.S5ST = One
        }

        If (CondRefOf (\_SB.TPM2.PTS))
        {
            M460 ("PLA-ASL-\\_PTS call \\_SB.TPM2.PTS\n", Zero, Zero, Zero, Zero, Zero, Zero)
            \_SB.TPM2.PTS (Arg0)
        }

        M460 ("PLA-ASL-\\_PTS call \\_SB.APTS\n", Zero, Zero, Zero, Zero, Zero, Zero)
        \_SB.APTS (Arg0)
        M460 ("PLA-ASL-\\_PTS call MPTS\n", Zero, Zero, Zero, Zero, Zero, Zero)
        MPTS (Arg0)
        M460 ("PLA-ASL-\\_PTS End\n", Zero, Zero, Zero, Zero, Zero, Zero)
    }

    OperationRegion (ECMP, SystemMemory, 0xFC7E0000, 0x1000)
    Field (ECMP, AnyAcc, Lock, Preserve)
    {
        Offset (0x24E), 
        BATP,   8, 
        Offset (0x250), 
        VER1,   8, 
        VER2,   8, 
        RSV1,   8, 
        RSV2,   8, 
        CCI0,   8, 
        CCI1,   8, 
        CCI2,   8, 
        CCI3,   8, 
        CTL0,   8, 
        CTL1,   8, 
        CTL2,   8, 
        CTL3,   8, 
        CTL4,   8, 
        CTL5,   8, 
        CTL6,   8, 
        CTL7,   8, 
        MGI0,   8, 
        MGI1,   8, 
        MGI2,   8, 
        MGI3,   8, 
        MGI4,   8, 
        MGI5,   8, 
        MGI6,   8, 
        MGI7,   8, 
        MGI8,   8, 
        MGI9,   8, 
        MGIA,   8, 
        MGIB,   8, 
        MGIC,   8, 
        MGID,   8, 
        MGIE,   8, 
        MGIF,   8, 
        MGO0,   8, 
        MGO1,   8, 
        MGO2,   8, 
        MGO3,   8, 
        MGO4,   8, 
        MGO5,   8, 
        MGO6,   8, 
        MGO7,   8, 
        MGO8,   8, 
        MGO9,   8, 
        MGOA,   8, 
        MGOB,   8, 
        MGOC,   8, 
        MGOD,   8, 
        MGOE,   8, 
        MGOF,   8, 
        Offset (0x6F8), 
            ,   2, 
        PWDR,   1, 
            ,   3, 
        INBG,   1, 
        Offset (0x6F9), 
        Offset (0x800), 
        REC1,   8, 
        REC2,   8, 
        WEC1,   8, 
        WEC2,   8, 
        WMIM,   8, 
        ACKM,   1, 
        Offset (0x806), 
            ,   1, 
            ,   1, 
        NGPS,   1, 
        DGPE,   1, 
        ENG6,   1, 
        RG12,   1, 
        Offset (0x807), 
        Offset (0x808), 
        Z01R,   8, 
        Z01G,   8, 
        Z01B,   8, 
        Z02R,   8, 
        Z02G,   8, 
        Z02B,   8, 
        SADP,   8, 
        FANE,   1, 
        CPUO,   1, 
        M4GO,   1, 
        FNSW,   1, 
        SBTC,   1, 
        VGAP,   1, 
        WPFM,   1, 
        EHP1,   1, 
        SAD2,   8, 
        FRPM,   8, 
        FNMX,   8, 
        FNMN,   8, 
        FWPM,   8, 
        RSTV,   8, 
        CPTV,   8, 
        GPTV,   8, 
        PHTV,   8, 
        FNTV,   8, 
        BTTV,   8, 
        HDTV,   8, 
            ,   3, 
        SK6U,   1, 
            ,   2, 
        FNHK,   1, 
        Offset (0x81D), 
        Z04R,   8, 
        Z04G,   8, 
        Offset (0x821), 
        BTNO,   8, 
        Offset (0x823), 
        DTCL,   3, 
        Offset (0x825), 
        CFBE,   1, 
        EPCF,   1, 
        Offset (0x826), 
        Z03R,   8, 
        TCAS,   2, 
        TCS2,   2, 
        Offset (0x828), 
        Z03G,   8, 
        Z03B,   8, 
        PBSM,   2, 
        SBSM,   2, 
        Offset (0x82B), 
            ,   2, 
            ,   1, 
        LCDR,   1, 
        EDPW,   1, 
            ,   1, 
            ,   1, 
        Offset (0x82C), 
        PRIC,   8, 
        BCTL,   128, 
        Offset (0x84D), 
        PENS,   72, 
        Offset (0x857), 
        Z04B,   8, 
        Offset (0x85C), 
        WACL,   1, 
        AADT,   1, 
        Offset (0x85D), 
        ENSI,   8, 
        ENSB,   8, 
        ENSD,   8, 
        SMBP,   8, 
        SMBS,   5, 
            ,   1, 
        SMAL,   1, 
        SMDN,   1, 
        SMAR,   8, 
        SMCD,   8, 
        SMDA,   256, 
        SMBC,   8, 
        SALA,   8, 
        SAD0,   8, 
        SAD1,   8, 
        SBNS,   8, 
        STPM,   8, 
        FPPT,   8, 
        SPPT,   8, 
        SAPU,   8, 
        ASTG,   8, 
        Offset (0x88F), 
            ,   1, 
            ,   1, 
        OGHM,   1, 
        Offset (0x8AE), 
        CPTR,   8, 
        Offset (0x8B4), 
        GPTP,   8, 
        PHTP,   8, 
        Offset (0x8D7), 
        BTTP,   8, 
        Offset (0x8DC), 
            ,   2, 
        SBIS,   1, 
        Offset (0x8FA), 
        PP3T,   8, 
        Offset (0x8FF), 
        SUPL,   8, 
        Offset (0xAC3), 
            ,   3, 
        GBTC,   1, 
        Offset (0xBB0), 
        Offset (0xBBC), 
        Offset (0xBC0), 
        Offset (0xBC2), 
        PRTM,   16, 
        Offset (0xD82), 
        ECPC,   1, 
        ECST,   1, 
        Offset (0xD8B), 
        ECMB,   8, 
        EDTB,   8, 
        Offset (0xD8E)
    }

    OperationRegion (ECMM, SystemMemory, 0xFC7E0000, 0x1000)
    Field (ECMM, AnyAcc, Lock, Preserve)
    {
        Offset (0x800), 
        Offset (0x81F), 
            ,   2, 
        MPMU,   1, 
        Offset (0x820), 
        Offset (0x827), 
        DGPW,   1, 
        Offset (0x845), 
        ATTE,   16, 
        RTTE,   16, 
        BTDC,   32, 
        MXER,   8, 
        ATTF,   16, 
        BTVI,   16, 
        NMMD,   1, 
        BLMD,   1, 
        PTMD,   1, 
        Offset (0x853), 
        Offset (0x857), 
        Offset (0x858), 
        ABES,   1, 
        ABEA,   1, 
        SNST,   1, 
        MSSA,   1, 
        MSST,   1, 
        Offset (0x859), 
        BMNE,   16, 
        Offset (0x88E), 
        HSPS,   8, 
        WAAC,   1, 
        WADC,   1, 
            ,   5, 
        F6FL,   1, 
        BMFN,   72, 
        BATD,   56, 
        AATL,   1, 
        AACL,   1, 
        AAST,   1, 
        AARW,   1, 
        AAEN,   1, 
            ,   1, 
        WKRN,   1, 
        Offset (0x8A1), 
            ,   1, 
        VIDO,   1, 
        TOUP,   1, 
        Offset (0x8A2), 
        ODTS,   8, 
        OSTY,   4, 
        WMIS,   1, 
            ,   1, 
        ECRD,   1, 
        ADPT,   1, 
        PWAK,   1, 
        MDWK,   1, 
        LWAK,   1, 
        RWAK,   1, 
        WWAK,   1, 
        UWAK,   1, 
        KWAK,   1, 
        TPWK,   1, 
        CCAC,   1, 
        AOAC,   1, 
        BLAC,   1, 
        PSRC,   1, 
        BOAC,   1, 
        LCAC,   1, 
        AAAC,   1, 
        ACAC,   1, 
        S3ST,   1, 
        S3RM,   1, 
        S4ST,   1, 
        S4RM,   1, 
        S5ST,   1, 
        S5RM,   1, 
        CSST,   1, 
        CSRM,   1, 
        CATT,   8, 
        VATT,   8, 
        THLT,   8, 
        TCNL,   8, 
        MODE,   1, 
            ,   2, 
        INIT,   1, 
        FAN1,   1, 
        FAN2,   1, 
        FANT,   1, 
        SKNM,   1, 
        SDTM,   8, 
        FSSN,   4, 
        FANU,   4, 
        PCVL,   6, 
        SWTO,   1, 
        TTHR,   1, 
        TTHM,   1, 
        THTL,   1, 
        CTDP,   1, 
        NPST,   5, 
        CTMP,   8, 
        CTML,   8, 
        EST3,   8, 
        SKTB,   8, 
        SKTC,   8, 
        Offset (0x8B6), 
        EST1,   8, 
        EST2,   8, 
            ,   1, 
        LIDF,   1, 
        PMEE,   1, 
        PWBE,   1, 
        RNGE,   1, 
        BTWE,   1, 
        Offset (0x8B9), 
        BRTS,   8, 
        S35M,   1, 
        S35S,   1, 
            ,   2, 
        FFEN,   1, 
        FFST,   1, 
        Offset (0x8BB), 
        WLAT,   1, 
        BTAT,   1, 
        WLEX,   1, 
        BTEX,   1, 
        KLSW,   1, 
        WLOK,   1, 
        AT3G,   1, 
        EX3G,   1, 
        PJID,   8, 
        CPUJ,   3, 
        CPNM,   3, 
        GATY,   2, 
        BOL0,   1, 
        BOL1,   1, 
            ,   2, 
        BCC0,   1, 
        BCC1,   1, 
        Offset (0x8BF), 
        BPU0,   1, 
        BPU1,   1, 
            ,   2, 
        BOS0,   1, 
        BOS1,   1, 
        Offset (0x8C0), 
        BTY0,   1, 
        BAM0,   1, 
        BAL0,   1, 
            ,   1, 
        BMF0,   4, 
        BST0,   8, 
        BRC0,   16, 
        BSN0,   16, 
        BPV0,   16, 
        BDV0,   16, 
        BDC0,   16, 
        BFC0,   16, 
        GAU0,   8, 
        BAT0,   8, 
        BPC0,   16, 
        BAC0,   16, 
        BCG0,   16, 
        BFCB,   16, 
        BTPP,   16, 
        BCT0,   8, 
        BCI0,   8, 
        BCM0,   8, 
        BOT0,   8, 
        BSSB,   16, 
        BOV0,   8, 
        BCF0,   8, 
        BAD0,   8, 
        BCV1,   16, 
        BCV2,   16, 
        BCV3,   16, 
        BCV4,   16, 
        Offset (0x8F1), 
            ,   6, 
        ORRF,   1, 
        Offset (0x8F6), 
        BACV,   16, 
        BDN0,   8, 
        Offset (0x8FB), 
        BMD0,   16, 
        CYC0,   8, 
        CYC1,   8, 
        Offset (0x900)
    }

    OperationRegion (ERAM, EmbeddedControl, Zero, 0xFF)
    Field (ERAM, ByteAcc, Lock, Preserve)
    {
        Offset (0x01), 
        Offset (0x02), 
        Offset (0x03), 
        Offset (0x60), 
        SMPR,   8, 
        SMST,   8, 
        SMAD,   8, 
        SMCM,   8, 
        SMD0,   256, 
        BCNT,   8, 
        SMAA,   24, 
        SMBN,   8, 
        Offset (0x8A)
    }

    OperationRegion (ECPR, EmbeddedControl, Zero, 0xFF)
    Field (ECPR, ByteAcc, Lock, Preserve)
    {
        Offset (0x1C), 
        CPBC,   8, 
        Offset (0x2A), 
            ,   6, 
        BMNC,   1, 
        BCLC,   1, 
        Offset (0x2D), 
        Offset (0x5A), 
        BMN9,   16, 
        Offset (0x64), 
        SMDR,   8, 
        Offset (0x90), 
        BMNN,   72, 
        BDVN,   56, 
        Offset (0xEB), 
        MUAC,   16, 
        Offset (0xF1), 
            ,   6, 
        OSRF,   1
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        M460 ("PLA-ASL-\\_WAK Start Arg0 = 0x%X\n", ToInteger (Arg0), Zero, Zero, Zero, Zero, Zero)
        M460 ("PLA-ASL-\\_WAK call SWAK\n", Zero, Zero, Zero, Zero, Zero, Zero)
        SWAK (Arg0)
        M460 ("PLA-ASL-\\_WAK call \\_SB.AWAK\n", Zero, Zero, Zero, Zero, Zero, Zero)
        \_SB.AWAK (Arg0)
        If (((Arg0 == 0x03) || (Arg0 == 0x04)))
        {
            If ((GPIC != Zero))
            {
                M460 ("PLA-ASL-\\_WAK call \\_SB.DSPI\n", Zero, Zero, Zero, Zero, Zero, Zero)
                \_SB.DSPI ()
                If (NAPC)
                {
                    M460 ("PLA-ASL-\\_WAK call \\_SB.PCI0.NAPE\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    \_SB.PCI0.NAPE ()
                }
            }
        }

        If ((Arg0 == 0x03))
        {
            \_SB.S80H (0xE3)
            Notify (\_SB.PWRB, 0x02) // Device Wake
            \_SB.PCI0.LPC0.EC0.S3RM = One
            \_SB.PCI0.LPC0.EC0.UWAK = Zero
        }

        If ((Arg0 == 0x04))
        {
            \_SB.S80H (0xE4)
            Notify (\_SB.PWRB, 0x02) // Device Wake
            \_SB.PCI0.LPC0.EC0.S4RM = One
        }

        If ((Arg0 == 0x05))
        {
            \_SB.PCI0.LPC0.EC0.S5RM = One
        }

        \_SB.PCI0.LPC0.ACAD.ACDC = 0xFF
        If ((((Arg0 == 0x03) || (Arg0 == 0x04)) || (Arg0 == 0x05)))
        {
            \_SB.PCI0.LPC0.EC0.WADC = Zero
            \_SB.PCI0.LPC0.EC0.WAAC = Zero
            \_SB.PCI0.LPC0.EC0.ECRD = One
            \_SB.PCI0.LPC0.EC0.NPST = 0x03
            \_SB.PCI0.LPC0.EC0.CSST = Zero
        }

        M460 ("PLA-ASL-\\_WAK call MWAK\n", Zero, Zero, Zero, Zero, Zero, Zero)
        MWAK (Arg0)
        M460 ("PLA-ASL-\\_WAK End\n", Zero, Zero, Zero, Zero, Zero, Zero)
        Return (Zero)
    }

    Scope (_SB)
    {
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                M460 ("PLA-ASL-\\_SB.PWRB._STA = 0xB\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Return (0x0B)
            }
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_BBN, Zero)  // _BBN: BIOS Bus Number
            Name (_ADR, Zero)  // _ADR: Address
            Name (NBRI, Zero)
            Name (NBAR, Zero)
            Name (NCMD, Zero)
            Name (PXDC, Zero)
            Name (PXLC, Zero)
            Name (PXD2, Zero)
            Name (BRI2, Zero)
            Name (BAR2, Zero)
            Name (CMD2, Zero)
            Name (XDC2, Zero)
            Name (XLC2, Zero)
            Name (XD22, Zero)
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                M460 ("PLA-ASL-\\_SB.PCI0._INI Start\n", Zero, Zero, Zero, Zero, Zero, Zero)
                If ((GPIC != Zero))
                {
                    M460 ("PLA-ASL-\\_SB.PCI0._INI call \\_SB.DSPI\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    DSPI ()
                    If (NAPC)
                    {
                        M460 ("PLA-ASL-\\_SB.PCI0._INI call \\_SB.PCI0.NAPE\n", Zero, Zero, Zero, Zero, Zero, Zero)
                        NAPE ()
                    }
                }

                M460 ("PLA-ASL-\\_SB.PCI0._INI call \\OSTP\n", Zero, Zero, Zero, Zero, Zero, Zero)
                OSTP ()
                BRTN ()
                M460 ("PLA-ASL-\\_SB.PCI0._INI End\n", Zero, Zero, Zero, Zero, Zero, Zero)
            }

            Name (SUPP, Zero)
            Name (CTRL, Zero)
            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                CreateDWordField (Arg0, Zero, UID0)
                CreateDWordField (Arg3, Zero, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                If ((Arg2 == One))
                {
                    M460 ("PLA-ASL-\\_SB.PCI0._OSC UUID 0x%X Start  CDW1 = 0x%X\n", UID0, CDW1, Zero, Zero, Zero, Zero)
                }
                ElseIf ((Arg2 == 0x02))
                {
                    Local2 = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
                    M460 ("PLA-ASL-\\_SB.PCI0._OSC UUID 0x%X Start  CDW1 = 0x%X CDW2 = 0x%X\n", UID0, CDW1, CDW2, Zero, Zero, Zero)
                }
                Else
                {
                    Local3 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
                    M460 ("PLA-ASL-\\_SB.PCI0._OSC UUID 0x%X Start  CDW1 = 0x%X CDW2 = 0x%X CDW3 = 0x%X\n", UID0, CDW1, CDW2, CDW3, Zero, Zero)
                }

                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                {
                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
                    If ((TBEN == One))
                    {
                        If ((TBNH != Zero))
                        {
                            CTRL &= 0xFFFFFFF5
                        }
                        Else
                        {
                            CTRL &= 0xFFFFFFF4
                        }
                    }

                    If (((SUPP & 0x16) != 0x16))
                    {
                        CTRL &= 0xFFFFFFFE
                    }

                    CTRL &= 0xFFFFFFF5
                    If (~(CDW1 & One))
                    {
                        If ((CTRL & One)){}
                        If ((CTRL & 0x04)){}
                        If ((CTRL & 0x10)){}
                    }

                    If ((Arg1 != One))
                    {
                        CDW1 |= 0x08
                    }

                    If ((CDW3 != CTRL))
                    {
                        CDW1 |= 0x10
                    }

                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
                }
                Else
                {
                    CDW1 |= 0x04
                }

                If ((Arg2 == One))
                {
                    M460 ("PLA-ASL-\\_SB.PCI0._OSC UUID 0x%X Return CDW1 = 0x%X\n", UID0, CDW1, Zero, Zero, Zero, Zero)
                }
                ElseIf ((Arg2 == 0x02))
                {
                    M460 ("PLA-ASL-\\_SB.PCI0._OSC UUID 0x%X Return CDW1 = 0x%X CDW2 = 0x%X\n", UID0, CDW1, CDW2, Zero, Zero, Zero)
                }
                Else
                {
                    M460 ("PLA-ASL-\\_SB.PCI0._OSC UUID 0x%X Return CDW1 = 0x%X CDW2 = 0x%X CDW3 = 0x%X\n", UID0, CDW1, CDW2, CDW3, Zero, Zero)
                }

                Return (Arg3)
            }

            Method (TOM, 0, NotSerialized)
            {
                Local0 = (TOML * 0x00010000)
                Local1 = (TOMH * 0x01000000)
                Local0 += Local1
                Return (Local0)
            }

            Name (CRES, Buffer (0x0299)
            {
                /* 0000 */  0x88, 0x0E, 0x00, 0x02, 0x0E, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x01,  // ........
                /* 0010 */  0x00, 0x88, 0x0E, 0x00, 0x01, 0x0C, 0x03, 0x00,  // ........
                /* 0018 */  0x00, 0x00, 0x00, 0xF7, 0x0C, 0x00, 0x00, 0xF8,  // ........
                /* 0020 */  0x0C, 0x00, 0x88, 0x0D, 0x00, 0x01, 0x0C, 0x03,  // ........
                /* 0028 */  0x00, 0x00, 0x00, 0x0D, 0xFF, 0xFF, 0x00, 0x00,  // ........
                /* 0030 */  0x00, 0xF3, 0x87, 0x18, 0x00, 0x00, 0x0E, 0x01,  // ........
                /* 0038 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00,  // ........
                /* 0040 */  0xFF, 0xFF, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0048 */  0x00, 0x00, 0x02, 0x00, 0x00, 0x87, 0x18, 0x00,  // ........
                /* 0050 */  0x00, 0x0E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0058 */  0x00, 0x0C, 0x00, 0xFF, 0x3F, 0x0C, 0x00, 0x00,  // ....?...
                /* 0060 */  0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00,  // ....@...
                /* 0068 */  0x87, 0x18, 0x00, 0x00, 0x0E, 0x02, 0x00, 0x00,  // ........
                /* 0070 */  0x00, 0x00, 0x00, 0x40, 0x0C, 0x00, 0xFF, 0x7F,  // ...@....
                /* 0078 */  0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40,  // .......@
                /* 0080 */  0x00, 0x00, 0x00, 0x87, 0x18, 0x00, 0x00, 0x0E,  // ........
                /* 0088 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0C,  // ........
                /* 0090 */  0x00, 0xFF, 0xBF, 0x0C, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0098 */  0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x87, 0x18,  // ..@.....
                /* 00A0 */  0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00A8 */  0x00, 0xC0, 0x0C, 0x00, 0xFF, 0xFF, 0x0C, 0x00,  // ........
                /* 00B0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00,  // .....@..
                /* 00B8 */  0x00, 0x87, 0x18, 0x00, 0x00, 0x0E, 0x01, 0x00,  // ........
                /* 00C0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x00, 0xFF,  // ........
                /* 00C8 */  0x3F, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ?.......
                /* 00D0 */  0x40, 0x00, 0x00, 0x00, 0x87, 0x18, 0x00, 0x00,  // @.......
                /* 00D8 */  0x0E, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40,  // .......@
                /* 00E0 */  0x0D, 0x00, 0xFF, 0x7F, 0x0D, 0x00, 0x00, 0x00,  // ........
                /* 00E8 */  0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x87,  // ...@....
                /* 00F0 */  0x18, 0x00, 0x00, 0x0E, 0x01, 0x00, 0x00, 0x00,  // ........
                /* 00F8 */  0x00, 0x00, 0x80, 0x0D, 0x00, 0xFF, 0xBF, 0x0D,  // ........
                /* 0100 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00,  // ......@.
                /* 0108 */  0x00, 0x00, 0x87, 0x18, 0x00, 0x00, 0x0E, 0x01,  // ........
                /* 0110 */  0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x0D, 0x00,  // ........
                /* 0118 */  0xFF, 0xFF, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0120 */  0x00, 0x40, 0x00, 0x00, 0x00, 0x87, 0x18, 0x00,  // .@......
                /* 0128 */  0x00, 0x0E, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0130 */  0x00, 0x0E, 0x00, 0xFF, 0x3F, 0x0E, 0x00, 0x00,  // ....?...
                /* 0138 */  0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00,  // ....@...
                /* 0140 */  0x87, 0x18, 0x00, 0x00, 0x0E, 0x03, 0x00, 0x00,  // ........
                /* 0148 */  0x00, 0x00, 0x00, 0x40, 0x0E, 0x00, 0xFF, 0x7F,  // ...@....
                /* 0150 */  0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40,  // .......@
                /* 0158 */  0x00, 0x00, 0x00, 0x87, 0x18, 0x00, 0x00, 0x0E,  // ........
                /* 0160 */  0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0E,  // ........
                /* 0168 */  0x00, 0xFF, 0xBF, 0x0E, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0170 */  0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x87, 0x18,  // ..@.....
                /* 0178 */  0x00, 0x00, 0x0E, 0x03, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0180 */  0x00, 0xC0, 0x0E, 0x00, 0xFF, 0xFF, 0x0E, 0x00,  // ........
                /* 0188 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00,  // .....@..
                /* 0190 */  0x00, 0x87, 0x18, 0x00, 0x00, 0x0E, 0x01, 0x00,  // ........
                /* 0198 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xFF,  // ........
                /* 01A0 */  0xFF, 0xFF, 0xF7, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 01A8 */  0x00, 0x00, 0x78, 0x00, 0x87, 0x18, 0x00, 0x00,  // ..x.....
                /* 01B0 */  0x0E, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 01B8 */  0x00, 0xFC, 0xFF, 0xFF, 0xAF, 0xFE, 0x00, 0x00,  // ........
                /* 01C0 */  0x00, 0x00, 0x00, 0x00, 0xB0, 0x02, 0x00, 0x87,  // ........
                /* 01C8 */  0x18, 0x00, 0x00, 0x0E, 0x01, 0x00, 0x00, 0x00,  // ........
                /* 01D0 */  0x00, 0x00, 0x50, 0xD4, 0xFE, 0xFF, 0x14, 0xD8,  // ..P.....
                /* 01D8 */  0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC5, 0x03,  // ........
                /* 01E0 */  0x00, 0x00, 0x87, 0x18, 0x00, 0x00, 0x0E, 0x01,  // ........
                /* 01E8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x19, 0xD8, 0xFE,  // ........
                /* 01F0 */  0xFF, 0x1F, 0xD8, 0xFE, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 01F8 */  0x00, 0x07, 0x00, 0x00, 0x00, 0x87, 0x18, 0x00,  // ........
                /* 0200 */  0x00, 0x0E, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0208 */  0x00, 0xDC, 0xFE, 0xFF, 0x0F, 0xDC, 0xFE, 0x00,  // ........
                /* 0210 */  0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00,  // ........
                /* 0218 */  0x87, 0x18, 0x00, 0x00, 0x0E, 0x01, 0x00, 0x00,  // ........
                /* 0220 */  0x00, 0x00, 0x00, 0x60, 0xDC, 0xFE, 0xFF, 0x6F,  // ...`...o
                /* 0228 */  0xDC, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10,  // ........
                /* 0230 */  0x00, 0x00, 0x00, 0x47, 0x01, 0xF8, 0x0C, 0xF8,  // ...G....
                /* 0238 */  0x0C, 0x01, 0x08, 0x8A, 0x2B, 0x00, 0x00, 0x0C,  // ....+...
                /* 0240 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0248 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0250 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0258 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0260 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0268 */  0x00, 0x8A, 0x2B, 0x00, 0x00, 0x0C, 0x01, 0x00,  // ..+.....
                /* 0270 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0278 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0280 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0288 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0290 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0298 */  0x00                                             // .
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.PCI0._CRS Start\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateDWordField (CRES, 0x019B, BTMN)
                CreateDWordField (CRES, 0x019F, BTMX)
                CreateDWordField (CRES, 0x01A7, BTLN)
                CreateDWordField (CRES, 0x01B6, BTN1)
                CreateDWordField (CRES, 0x01BA, BTX1)
                CreateDWordField (CRES, 0x01C2, BTL1)
                BTMN = MB32 /* \MB32 */
                BTMX = ((MB32 + ML32) - One)
                BTLN = ML32 /* \ML32 */
                If ((TOPM != Zero))
                {
                    BTX1 = TOPM /* \TOPM */
                }

                BTN1 = (PCBL + One)
                BTL1 = (BTX1 - BTN1) /* \_SB_.PCI0._CRS.BTN1 */
                BTL1 += One
                If ((MM64 == One))
                {
                    CreateQWordField (CRES, 0x0249, M1MN)
                    CreateQWordField (CRES, 0x0251, M1MX)
                    CreateQWordField (CRES, 0x0261, M1LN)
                    M1MN = HMB1 /* \HMB1 */
                    M1MX = HMM1 /* \HMM1 */
                    M1LN = HML1 /* \HML1 */
                    CreateQWordField (CRES, 0x0277, M2MN)
                    CreateQWordField (CRES, 0x027F, M2MX)
                    CreateQWordField (CRES, 0x028F, M2LN)
                    M2MN = HMB2 /* \HMB2 */
                    M2MX = HMM2 /* \HMM2 */
                    M2LN = HML2 /* \HML2 */
                }

                M460 ("PLA-ASL-\\_SB.PCI0._CRS End\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Return (CRES) /* \_SB_.PCI0.CRES */
            }

            Device (MEMR)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (MEM1, Buffer (0x26)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                    /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0018 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x79, 0x00               // ....y.
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    M460 ("PLA-ASL-\\_SB.PCI0.MEMR._CRS Start\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    CreateDWordField (MEM1, 0x04, MB01)
                    CreateDWordField (MEM1, 0x08, ML01)
                    CreateDWordField (MEM1, 0x10, MB02)
                    CreateDWordField (MEM1, 0x14, ML02)
                    If (GPIC)
                    {
                        MB01 = 0xFEC00000
                        MB02 = 0xFEE00000
                        ML01 = 0x1000
                        If (NAPC)
                        {
                            ML01 += 0x1000
                        }

                        ML02 = 0x1000
                    }

                    M460 ("PLA-ASL-\\_SB.PCI0.MEMR._CRS End\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (MEM1) /* \_SB_.PCI0.MEMR.MEM1 */
                }
            }

            Mutex (NAPM, 0x00)
            Method (NAPE, 0, NotSerialized)
            {
                Acquire (NAPM, 0xFFFF)
                Local0 = (PCBA + 0xB8)
                OperationRegion (VARM, SystemMemory, Local0, 0x08)
                Field (VARM, DWordAcc, NoLock, Preserve)
                {
                    NAPX,   32, 
                    NAPD,   32
                }

                Local1 = NAPX /* \_SB_.PCI0.NAPE.NAPX */
                NAPX = 0x14300000
                Local0 = NAPD /* \_SB_.PCI0.NAPE.NAPD */
                Local0 &= 0xFFFFFFEF
                NAPD = Local0
                NAPX = Local1
                Release (NAPM)
            }

            Method (PXCR, 3, Serialized)
            {
                M460 ("PLA-ASL-_SB.PCI0.GPPX.PXCR\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Local0 = Zero
                Local1 = M017 (Arg0, Arg1, Arg2, 0x34, Zero, 0x08)
                While ((Local1 != Zero))
                {
                    Local2 = M017 (Arg0, Arg1, Arg2, Local1, Zero, 0x08)
                    If (((Local2 == Zero) || (Local2 == 0xFF)))
                    {
                        Break
                    }

                    If ((Local2 == 0x10))
                    {
                        Local0 = Local1
                        Break
                    }

                    Local1 = M017 (Arg0, Arg1, Arg2, (Local1 + One), Zero, 0x08)
                }

                Return (Local0)
            }

            Method (SPCF, 1, Serialized)
            {
                M460 ("PLA-ASL-_SB.PCI0.GPPX.SPCF\n", Zero, Zero, Zero, Zero, Zero, Zero)
                If ((Arg0 == 0x00020004))
                {
                    M460 ("PLA-ASL-_SB.PCI0.GPPX.SPCF NVMe 1\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Local0 = M019 (Zero, (Arg0 >> 0x10), (Arg0 & 0xFF), 
                        0x18)
                    NBRI = ((Local0 & 0xFF00) >> 0x08)
                    NCMD = M019 (NBRI, Zero, Zero, 0x04)
                    NBAR = M019 (NBRI, Zero, Zero, 0x10)
                    Local1 = PXCR (NBRI, Zero, Zero)
                    PXDC = M019 (NBRI, Zero, Zero, (Local1 + 0x08))
                    PXLC = M019 (NBRI, Zero, Zero, (Local1 + 0x10))
                    PXD2 = M019 (NBRI, Zero, Zero, (Local1 + 0x28))
                }
                Else
                {
                    M460 ("PLA-ASL-_SB.PCI0.GPPX.SPCF NVMe 2\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Local0 = M019 (Zero, (Arg0 >> 0x10), (Arg0 & 0xFF), 
                        0x18)
                    BRI2 = ((Local0 & 0xFF00) >> 0x08)
                    CMD2 = M019 (BRI2, Zero, Zero, 0x04)
                    BAR2 = M019 (BRI2, Zero, Zero, 0x10)
                    Local1 = PXCR (BRI2, Zero, Zero)
                    XDC2 = M019 (BRI2, Zero, Zero, (Local1 + 0x08))
                    XLC2 = M019 (BRI2, Zero, Zero, (Local1 + 0x10))
                    XD22 = M019 (BRI2, Zero, Zero, (Local1 + 0x28))
                }
            }

            Method (RPCF, 1, Serialized)
            {
                M460 ("PLA-ASL-_SB.PCI0.GPPX.RPCF\n", Zero, Zero, Zero, Zero, Zero, Zero)
                If ((Arg0 == 0x00020004))
                {
                    M460 ("PLA-ASL-_SB.PCI0.GPPX.RPCF NVMe 1\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Local1 = PXCR (NBRI, Zero, Zero)
                    M020 (NBRI, Zero, Zero, (Local1 + 0x08), PXDC)
                    M020 (NBRI, Zero, Zero, (Local1 + 0x10), (PXLC & 0xFFFFFEFC))
                    M020 (NBRI, Zero, Zero, (Local1 + 0x28), PXD2)
                    M020 (NBRI, Zero, Zero, 0x10, NBAR)
                    M020 (NBRI, Zero, Zero, 0x04, 0x06)
                }
                Else
                {
                    M460 ("PLA-ASL-_SB.PCI0.GPPX.RPCF NVMe 2\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Local1 = PXCR (BRI2, Zero, Zero)
                    M020 (BRI2, Zero, Zero, (Local1 + 0x08), XDC2)
                    M020 (BRI2, Zero, Zero, (Local1 + 0x10), (XLC2 & 0xFFFFFEFC))
                    M020 (BRI2, Zero, Zero, (Local1 + 0x28), XD22)
                    M020 (BRI2, Zero, Zero, 0x10, BAR2)
                    M020 (BRI2, Zero, Zero, 0x04, 0x06)
                }
            }

            Method (UPWD, 0, Serialized)
            {
                M460 ("PLA-ASL-_SB.PCI0.UPWD\n", Zero, Zero, Zero, Zero, Zero, Zero)
                OperationRegion (PSMI, SystemIO, 0xB0, 0x02)
                Field (PSMI, ByteAcc, NoLock, Preserve)
                {
                    SMIC,   8, 
                    SMID,   8
                }

                SMIC = 0x03
            }

            Name (PRB0, Package (0x14)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    LNKA, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    LNKB, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    LNKC, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    LNKD, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    Zero, 
                    LNKE, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    LNKF, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    LNKG, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    LNKH, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0003FFFF, 
                    Zero, 
                    LNKA, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0003FFFF, 
                    One, 
                    LNKB, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0003FFFF, 
                    0x02, 
                    LNKC, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0003FFFF, 
                    0x03, 
                    LNKD, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    Zero, 
                    LNKE, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    LNKA, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    LNKB, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x02, 
                    LNKC, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    LNKA, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    LNKB, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    LNKC, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    LNKD, , 
                    Zero
                }
            })
            Name (ARB0, Package (0x14)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    Zero, 
                    Zero, 
                    0x14
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    Zero, 
                    0x15
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    Zero, 
                    0x16
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    Zero, 
                    0x17
                }, 

                Package (0x04)
                {
                    0x0003FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0003FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0003FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0003FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    Zero, 
                    Zero, 
                    0x14
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }
            })
            Name (NRB0, Package (0x14)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    Zero, 
                    0x18
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    Zero, 
                    0x19
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    Zero, 
                    0x1A
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    Zero, 
                    0x1B
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    Zero, 
                    Zero, 
                    0x1C
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    Zero, 
                    0x1D
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    Zero, 
                    0x1E
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    Zero, 
                    0x1F
                }, 

                Package (0x04)
                {
                    0x0003FFFF, 
                    Zero, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0003FFFF, 
                    One, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0003FFFF, 
                    0x02, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0003FFFF, 
                    0x03, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    Zero, 
                    Zero, 
                    0x24
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    Zero, 
                    0x28
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    Zero, 
                    0x29
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x02, 
                    Zero, 
                    0x2A
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }
            })
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (PICM)
                {
                    If (NAPC)
                    {
                        Return (NRB0) /* \_SB_.PCI0.NRB0 */
                    }
                    Else
                    {
                        Return (ARB0) /* \_SB_.PCI0.ARB0 */
                    }
                }
                Else
                {
                    Return (PRB0) /* \_SB_.PCI0.PRB0 */
                }
            }

            Device (GPP0)
            {
                Name (_ADR, 0x00010001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        M460 ("PLA-ASL-\\_SB.PCI0.GPP0.RHRW Return GPRW (0x8, 0x4)\n", Zero, Zero, Zero, Zero, Zero, Zero)
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        M460 ("PLA-ASL-\\_SB.PCI0.GPP0.RHRW Return GPRW (0x8, 0x0)\n", Zero, Zero, Zero, Zero, Zero, Zero)
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR00, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, , 
                        Zero
                    }
                })
                Name (AR00, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Name (NR00, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x18
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x19
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x1A
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x1B
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR00) /* \_SB_.PCI0.GPP0.NR00 */
                        }
                        Else
                        {
                            Return (AR00) /* \_SB_.PCI0.GPP0.AR00 */
                        }
                    }
                    Else
                    {
                        Return (PR00) /* \_SB_.PCI0.GPP0.PR00 */
                    }
                }
            }

            Device (GPP1)
            {
                Name (_ADR, 0x00010002)  // _ADR: Address
                Name (PR01, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKE, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKF, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKG, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKH, , 
                        Zero
                    }
                })
                Name (AR01, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x15
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x17
                    }
                })
                Name (NR01, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x1C
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x1D
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x1E
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x1F
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR01) /* \_SB_.PCI0.GPP1.NR01 */
                        }
                        Else
                        {
                            Return (AR01) /* \_SB_.PCI0.GPP1.AR01 */
                        }
                    }
                    Else
                    {
                        Return (PR01) /* \_SB_.PCI0.GPP1.PR01 */
                    }
                }
            }

            Device (GPP2)
            {
                Name (_ADR, 0x00010003)  // _ADR: Address
                Method (RHRW, 0, NotSerialized)
                {
                    Return (GPRW (0x0F, Zero))
                }

                Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
                Name (_DEP, Package (0x01)  // _DEP: Dependencies
                {
                    PEP, 
                })
                Device (PCRD)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (Zero)
                    }

                    Name (D0U1, One)
                    Name (D3U1, One)
                    PowerResource (P0U1, 0x00, 0x0000)
                    {
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            TPST (0x3205)
                            Return (D0U1) /* \_SB_.PCI0.GPP2.PCRD.D0U1 */
                        }

                        Method (_ON, 0, NotSerialized)  // _ON_: Power On
                        {
                            TPST (0x3206)
                            D0U1 = One
                        }

                        Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                        {
                            TPST (0x3208)
                            D0U1 = Zero
                        }
                    }

                    PowerResource (P3U1, 0x00, 0x0000)
                    {
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            TPST (0x320A)
                            Return (D3U1) /* \_SB_.PCI0.GPP2.PCRD.D3U1 */
                        }

                        Method (_ON, 0, NotSerialized)  // _ON_: Power On
                        {
                            TPST (0x320B)
                            D3U1 = One
                        }

                        Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                        {
                            TPST (0x320D)
                            D3U1 = Zero
                        }
                    }

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        TPST (0x3201)
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                        TPST (0x3203)
                    }

                    Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
                    {
                        P0U1, 
                    })
                    Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
                    {
                        P3U1, 
                    })
                    Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
                    {
                        Return (0x04)
                    }
                }

                Name (PR02, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, , 
                        Zero
                    }
                })
                Name (AR02, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Name (NR02, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x20
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x21
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x22
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x23
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR02) /* \_SB_.PCI0.GPP2.NR02 */
                        }
                        Else
                        {
                            Return (AR02) /* \_SB_.PCI0.GPP2.AR02 */
                        }
                    }
                    Else
                    {
                        Return (PR02) /* \_SB_.PCI0.GPP2.PR02 */
                    }
                }
            }

            Device (GPP3)
            {
                Name (_ADR, 0x00010004)  // _ADR: Address
                Name (PR03, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKE, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKF, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKG, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKH, , 
                        Zero
                    }
                })
                Name (AR03, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x15
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x17
                    }
                })
                Name (NR03, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x24
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x25
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x26
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x27
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR03) /* \_SB_.PCI0.GPP3.NR03 */
                        }
                        Else
                        {
                            Return (AR03) /* \_SB_.PCI0.GPP3.AR03 */
                        }
                    }
                    Else
                    {
                        Return (PR03) /* \_SB_.PCI0.GPP3.PR03 */
                    }
                }
            }

            Device (GPP4)
            {
                Name (_ADR, 0x00010005)  // _ADR: Address
                Name (PR04, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, , 
                        Zero
                    }
                })
                Name (AR04, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Name (NR04, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x28
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x29
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x2A
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x2B
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR04) /* \_SB_.PCI0.GPP4.NR04 */
                        }
                        Else
                        {
                            Return (AR04) /* \_SB_.PCI0.GPP4.AR04 */
                        }
                    }
                    Else
                    {
                        Return (PR04) /* \_SB_.PCI0.GPP4.PR04 */
                    }
                }
            }

            Device (GPP5)
            {
                Name (_ADR, 0x00020001)  // _ADR: Address
                Name (PR06, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKE, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKF, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKG, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKH, , 
                        Zero
                    }
                })
                Name (AR06, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x15
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x17
                    }
                })
                Name (NR06, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x2C
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x2D
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x2E
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x2F
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR06) /* \_SB_.PCI0.GPP5.NR06 */
                        }
                        Else
                        {
                            Return (AR06) /* \_SB_.PCI0.GPP5.AR06 */
                        }
                    }
                    Else
                    {
                        Return (PR06) /* \_SB_.PCI0.GPP5.PR06 */
                    }
                }
            }

            Device (GPP6)
            {
                Name (_ADR, 0x00020002)  // _ADR: Address
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (RBUF, Buffer (0x25)
                    {
                        /* 0000 */  0x8C, 0x20, 0x00, 0x01, 0x00, 0x01, 0x00, 0x13,  // . ......
                        /* 0008 */  0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00,  // ........
                        /* 0010 */  0x00, 0x19, 0x00, 0x23, 0x00, 0x00, 0x00, 0x12,  // ...#....
                        /* 0018 */  0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x47, 0x50,  // .\_SB.GP
                        /* 0020 */  0x49, 0x4F, 0x00, 0x79, 0x00                     // IO.y.
                    })
                    Return (RBUF) /* \_SB_.PCI0.GPP6._CRS.RBUF */
                }

                Device (WLAN)
                {
                    Name (_DEP, Package (0x01)  // _DEP: Dependencies
                    {
                        PEP, 
                    })
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
                    Name (WRDY, Package (0x02)
                    {
                        Zero, 
                        Package (0x0C)
                        {
                            0x07, 
                            0x80, 
                            0x80, 
                            0x80, 
                            0x80, 
                            0x80, 
                            0x80, 
                            0x80, 
                            0x80, 
                            0x80, 
                            0x80, 
                            0x80
                        }
                    })
                    Method (WRDS, 0, Serialized)
                    {
                        If ((STXE == One))
                        {
                            DerefOf (WRDY [One]) [One] = STXE /* \STXE */
                            DerefOf (WRDY [One]) [0x02] = STX0 /* \STX0 */
                            DerefOf (WRDY [One]) [0x03] = STX1 /* \STX1 */
                            DerefOf (WRDY [One]) [0x04] = STX2 /* \STX2 */
                            DerefOf (WRDY [One]) [0x05] = STX3 /* \STX3 */
                            DerefOf (WRDY [One]) [0x06] = STX4 /* \STX4 */
                            DerefOf (WRDY [One]) [0x07] = STX5 /* \STX5 */
                            DerefOf (WRDY [One]) [0x08] = STX6 /* \STX6 */
                            DerefOf (WRDY [One]) [0x09] = STX7 /* \STX7 */
                            DerefOf (WRDY [One]) [0x0A] = STX8 /* \STX8 */
                            DerefOf (WRDY [One]) [0x0B] = STX9 /* \STX9 */
                            Return (WRDY) /* \_SB_.PCI0.GPP6.WLAN.WRDY */
                        }
                    }

                    Method (EWRD, 0, Serialized)
                    {
                        Name (EWRY, Package (0x02)
                        {
                            Zero, 
                            Package (0x21)
                            {
                                0x07, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80, 
                                0x80
                            }
                        })
                        Return (EWRY) /* \_SB_.PCI0.GPP6.WLAN.EWRD.EWRY */
                    }

                    Name (WRDR, Package (0x17)
                    {
                        0x48, 
                        0x50, 
                        0x01, 
                        0x0E, 
                        0x0C, 
                        0x0C, 
                        0x0C, 
                        0x0C, 
                        0x0E, 
                        0x0C, 
                        0x0C, 
                        0x0C, 
                        0x0C, 
                        0x0E, 
                        0x0C, 
                        0x0C, 
                        0x0C, 
                        0x0C, 
                        0x12, 
                        0x10, 
                        0x10, 
                        0x12, 
                        0x12
                    })
                    Method (RWRD, 0, Serialized)
                    {
                        Name (RWRY, Package (0x7C)
                        {
                            0x48, 
                            0x50, 
                            Zero, 
                            0x06, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x14, 
                            0x12, 
                            0x12, 
                            0x12, 
                            0x12
                        })
                        Return (RWRY) /* \_SB_.PCI0.GPP6.WLAN.RWRD.RWRY */
                    }

                    Method (RWSI, 0, Serialized)
                    {
                        Name (RWS1, Package (0x04)
                        {
                            One, 
                            One, 
                            One, 
                            One
                        })
                        Name (RWS2, Package (0x04)
                        {
                            0x02, 
                            0x02, 
                            One, 
                            0x02
                        })
                        Name (RWS3, Package (0x04)
                        {
                            0x03, 
                            0x03, 
                            One, 
                            0x03
                        })
                        Name (RWS4, Package (0x04)
                        {
                            0x04, 
                            0x04, 
                            One, 
                            0x04
                        })
                        Name (RWS5, Package (0x04)
                        {
                            0x05, 
                            0x05, 
                            One, 
                            0x05
                        })
                        Name (RWS6, Package (0x04)
                        {
                            0x06, 
                            0x06, 
                            One, 
                            0x06
                        })
                    }

                    Method (MTCL, 0, Serialized)
                    {
                        Name (MTCY, Package (0x13)
                        {
                            0x4D, 
                            0x54, 
                            0x43, 
                            0x4C, 
                            0x02, 
                            One, 
                            0x50, 
                            0xCC, 
                            0x41, 
                            0x18, 
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x08, 
                            Zero, 
                            Zero
                        })
                        Return (MTCY) /* \_SB_.PCI0.GPP6.WLAN.MTCL.MTCY */
                    }

                    Method (MTCC, 0, Serialized)
                    {
                        Name (MTCZ, Package (0x07)
                        {
                            0x4D, 
                            0x54, 
                            0x43, 
                            0x43, 
                            Zero, 
                            0x30, 
                            0x30
                        })
                        Return (MTCZ) /* \_SB_.PCI0.GPP6.WLAN.MTCC.MTCZ */
                    }

                    Method (MTAG, 0, Serialized)
                    {
                        Name (MASB, Package (0x17)
                        {
                            0x4D, 
                            0x54, 
                            0x41, 
                            0x47, 
                            One, 
                            Zero, 
                            One, 
                            0xC0, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x06, 
                            0x06, 
                            0x06, 
                            0x06, 
                            0x06, 
                            0x06, 
                            0x06, 
                            0x06, 
                            0x06
                        })
                        Return (MASB) /* \_SB_.PCI0.GPP6.WLAN.MTAG.MASB */
                    }

                    Name (WTSY, Package (0x02)
                    {
                        Zero, 
                        Package (0x13)
                        {
                            0x07, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        }
                    })
                    Method (WTAS, 0, Serialized)
                    {
                        Return (WTSY) /* \_SB_.PCI0.GPP6.WLAN.WTSY */
                    }

                    Method (EFUN, 4, Serialized)
                    {
                        If ((Arg2 == Zero))
                        {
                            If ((Arg1 == Zero))
                            {
                                Return (Buffer (0x02)
                                {
                                     0x04, 0x00                                       // ..
                                })
                            }
                            Else
                            {
                                Return (Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }
                        }

                        If ((Arg2 == 0x02))
                        {
                            Return (One)
                        }

                        If ((Arg2 == 0x03))
                        {
                            If ((HW6B == One))
                            {
                                Local0 = HW6S /* \HW6S */
                                Return (Local0)
                            }
                            Else
                            {
                                Return (Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }
                        }

                        Return (Zero)
                    }

                    Method (RFUN, 4, Serialized)
                    {
                        If ((Arg2 == Zero))
                        {
                            If ((Arg1 == Zero))
                            {
                                Return (0x59)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        If ((Arg2 == One))
                        {
                            Return (Zero)
                        }

                        If ((Arg2 == 0x02))
                        {
                            Return (One)
                        }

                        If ((Arg2 == 0x03))
                        {
                            Return (Zero)
                        }

                        If ((Arg2 == 0x04))
                        {
                            Return (Buffer (0x1A)
                            {
                                /* 0000 */  0x00, 0xE0, 0x4C, 0x00, 0x01, 0x0A, 0x45, 0x55,  // ..L...EU
                                /* 0008 */  0x41, 0x55, 0x43, 0x4C, 0x43, 0x41, 0x47, 0x42,  // AUCLCAGB
                                /* 0010 */  0x4A, 0x50, 0x4B, 0x52, 0x4D, 0x59, 0x4E, 0x5A,  // JPKRMYNZ
                                /* 0018 */  0x55, 0x53                                       // US
                            })
                        }

                        If ((Arg2 == 0x05))
                        {
                            Return (Zero)
                        }

                        If ((Arg2 == 0x06))
                        {
                            Return (One)
                        }
                    }

                    Method (EDSM, 1, Serialized)
                    {
                        If ((Arg0 == ToUUID ("f21202bf-8f78-4dc6-a5b3-1f738e285ade") /* Unknown UUID */))
                        {
                            Return (One)
                        }

                        Return (Zero)
                    }

                    Method (RDSM, 1, Serialized)
                    {
                        If ((Arg0 == ToUUID ("d2a8c3e8-4b69-4f00-82bd-fe8607803aa7") /* Unknown UUID */))
                        {
                            Return (One)
                        }

                        Return (Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        If (EDSM (Arg0))
                        {
                            Return (EFUN (Arg0, Arg1, Arg2, Arg3))
                        }

                        If (RDSM (Arg0))
                        {
                            Return (RFUN (Arg0, Arg1, Arg2, Arg3))
                        }

                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }

                Name (PR07, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKG, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKH, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKE, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKF, , 
                        Zero
                    }
                })
                Name (AR07, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x17
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x15
                    }
                })
                Name (NR07, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x2E
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x2F
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x2C
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x2D
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR07) /* \_SB_.PCI0.GPP6.NR07 */
                        }
                        Else
                        {
                            Return (AR07) /* \_SB_.PCI0.GPP6.AR07 */
                        }
                    }
                    Else
                    {
                        Return (PR07) /* \_SB_.PCI0.GPP6.PR07 */
                    }
                }
            }

            Device (GPP7)
            {
                Name (_ADR, 0x00020003)  // _ADR: Address
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (RBUF, Buffer (0x25)
                    {
                        /* 0000 */  0x8C, 0x20, 0x00, 0x01, 0x00, 0x01, 0x00, 0x13,  // . ......
                        /* 0008 */  0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00,  // ........
                        /* 0010 */  0x00, 0x19, 0x00, 0x23, 0x00, 0x00, 0x00, 0x02,  // ...#....
                        /* 0018 */  0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x47, 0x50,  // .\_SB.GP
                        /* 0020 */  0x49, 0x4F, 0x00, 0x79, 0x00                     // IO.y.
                    })
                    Return (RBUF) /* \_SB_.PCI0.GPP7._CRS.RBUF */
                }

                Name (PR08, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKG, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKH, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKE, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKF, , 
                        Zero
                    }
                })
                Name (AR08, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x17
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x15
                    }
                })
                Name (NR08, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x2E
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x2F
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x2C
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x2D
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR08) /* \_SB_.PCI0.GPP7.NR08 */
                        }
                        Else
                        {
                            Return (AR08) /* \_SB_.PCI0.GPP7.AR08 */
                        }
                    }
                    Else
                    {
                        Return (PR08) /* \_SB_.PCI0.GPP7.PR08 */
                    }
                }

                Device (RTL8)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }

            Device (GPP8)
            {
                Name (_ADR, 0x00020004)  // _ADR: Address
                Name (PR09, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKC, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKD, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKA, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKB, , 
                        Zero
                    }
                })
                Name (AR09, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x11
                    }
                })
                Name (NR09, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x2A
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x2B
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x28
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x29
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR09) /* \_SB_.PCI0.GPP8.NR09 */
                        }
                        Else
                        {
                            Return (AR09) /* \_SB_.PCI0.GPP8.AR09 */
                        }
                    }
                    Else
                    {
                        Return (PR09) /* \_SB_.PCI0.GPP8.PR09 */
                    }
                }
            }

            Device (GPP9)
            {
                Name (_ADR, 0x00020005)  // _ADR: Address
                Name (PR10, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKG, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKH, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKE, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKF, , 
                        Zero
                    }
                })
                Name (AR10, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x17
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x15
                    }
                })
                Name (NR10, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x26
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x27
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x24
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x25
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR10) /* \_SB_.PCI0.GPP9.NR10 */
                        }
                        Else
                        {
                            Return (AR10) /* \_SB_.PCI0.GPP9.AR10 */
                        }
                    }
                    Else
                    {
                        Return (PR10) /* \_SB_.PCI0.GPP9.PR10 */
                    }
                }
            }

            Device (GPPA)
            {
                Name (_ADR, 0x00020006)  // _ADR: Address
                Name (PR11, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKC, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKD, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKA, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKB, , 
                        Zero
                    }
                })
                Name (AR11, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x11
                    }
                })
                Name (NR11, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x22
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x23
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x20
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x21
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR11) /* \_SB_.PCI0.GPPA.NR11 */
                        }
                        Else
                        {
                            Return (AR11) /* \_SB_.PCI0.GPPA.AR11 */
                        }
                    }
                    Else
                    {
                        Return (PR11) /* \_SB_.PCI0.GPPA.PR11 */
                    }
                }
            }

            Device (GP11)
            {
                Name (_ADR, 0x00030001)  // _ADR: Address
                Name (PR12, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKG, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKH, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKE, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKF, , 
                        Zero
                    }
                })
                Name (AR12, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x17
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x15
                    }
                })
                Name (NR12, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x1E
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x1F
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x1C
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x1D
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR12) /* \_SB_.PCI0.GP11.NR12 */
                        }
                        Else
                        {
                            Return (AR12) /* \_SB_.PCI0.GP11.AR12 */
                        }
                    }
                    Else
                    {
                        Return (PR12) /* \_SB_.PCI0.GP11.PR12 */
                    }
                }
            }

            Device (GP12)
            {
                Name (_ADR, 0x00040001)  // _ADR: Address
                Name (PR16, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKC, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKD, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKA, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKB, , 
                        Zero
                    }
                })
                Name (AR16, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x11
                    }
                })
                Name (NR16, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x22
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x23
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x20
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x21
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR16) /* \_SB_.PCI0.GP12.NR16 */
                        }
                        Else
                        {
                            Return (AR16) /* \_SB_.PCI0.GP12.AR16 */
                        }
                    }
                    Else
                    {
                        Return (PR16) /* \_SB_.PCI0.GP12.PR16 */
                    }
                }
            }

            Device (GP17)
            {
                Name (_ADR, 0x00080001)  // _ADR: Address
                Name (PR17, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKG, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKH, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKE, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKF, , 
                        Zero
                    }
                })
                Name (AR17, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x17
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x15
                    }
                })
                Name (NR17, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x26
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x27
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x24
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x25
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR17) /* \_SB_.PCI0.GP17.NR17 */
                        }
                        Else
                        {
                            Return (AR17) /* \_SB_.PCI0.GP17.AR17 */
                        }
                    }
                    Else
                    {
                        Return (PR17) /* \_SB_.PCI0.GP17.PR17 */
                    }
                }

                Device (VGA)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (DOSA, Zero)
                    Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                    {
                        DOSA = Arg0
                    }

                    Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                    {
                        M460 ("PLA-ASL-\\_SB.PCI0.GP17.VGA._DOD\n", Zero, Zero, Zero, Zero, Zero, Zero)
                        Return (Package (0x07)
                        {
                            0x00010110, 
                            0x00010210, 
                            0x00010220, 
                            0x00010230, 
                            0x00010240, 
                            0x00031000, 
                            0x00032000
                        })
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)  // _ADR: Address
                        Name (BCLB, Package (0x34)
                        {
                            0x5A, 
                            0x3C, 
                            0x02, 
                            0x04, 
                            0x06, 
                            0x08, 
                            0x0A, 
                            0x0C, 
                            0x0E, 
                            0x10, 
                            0x12, 
                            0x14, 
                            0x16, 
                            0x18, 
                            0x1A, 
                            0x1C, 
                            0x1E, 
                            0x20, 
                            0x22, 
                            0x24, 
                            0x26, 
                            0x28, 
                            0x2A, 
                            0x2C, 
                            0x2E, 
                            0x30, 
                            0x32, 
                            0x34, 
                            0x36, 
                            0x38, 
                            0x3A, 
                            0x3C, 
                            0x3E, 
                            0x40, 
                            0x42, 
                            0x44, 
                            0x46, 
                            0x48, 
                            0x4A, 
                            0x4C, 
                            0x4E, 
                            0x50, 
                            0x52, 
                            0x54, 
                            0x56, 
                            0x58, 
                            0x5A, 
                            0x5C, 
                            0x5E, 
                            0x60, 
                            0x62, 
                            0x64
                        })
                        Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                        {
                            M460 ("PLA-ASL-\\_SB.PCI0.GP17.VGA.LCD._BCL\n", Zero, Zero, Zero, Zero, Zero, Zero)
                            BRTN ()
                            Return (BCLB) /* \_SB_.PCI0.GP17.VGA_.LCD_.BCLB */
                        }

                        Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                        {
                            M460 ("PLA-ASL-\\_SB.PCI0.GP17.VGA.LCD._BCM Arg0 = 0x%X\n", ToInteger (Arg0), Zero, Zero, Zero, Zero, Zero)
                            Divide ((Arg0 * 0xFF), 0x64, Local1, Local0)
                            AFN7 (Local0)
                            BRTL = Arg0
                        }
                    }
                }

                Device (PSP)
                {
                    Name (_ADR, 0x02)  // _ADR: Address
                }

                Device (ACP)
                {
                    Name (_ADR, 0x05)  // _ADR: Address
                }

                Device (AZAL)
                {
                    Name (_ADR, 0x06)  // _ADR: Address
                }

                Device (HDAU)
                {
                    Name (_ADR, One)  // _ADR: Address
                }

                Device (XHC0)
                {
                    Name (_ADR, 0x03)  // _ADR: Address
                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Device (PRT1)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT1._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT1.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x91, 0x0C, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT1_PLD\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT1.PLD1 */
                            }
                        }

                        Device (PRT2)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT2._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT2.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x91, 0x0C, 0x00, 0x02, 0x01, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT2._PLD\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT2.PLD1 */
                            }
                        }

                        Device (PRT3)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                Zero, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT3._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT3.UPC1 */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT3._PLD\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (M601 (0x02, Zero, 0x03, 0x03, 0x0112, Zero))
                            }
                        }

                        Device (PRT4)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                Zero, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT4._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT4.UPC1 */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT4._PLD\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (M601 (0x02, Zero, 0x04, 0x03, 0x0112, Zero))
                            }
                        }

                        Device (PRT5)
                        {
                            Name (_ADR, 0x05)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT5._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT5.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x10, 0x0C, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT5._PLD\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT5.PLD1 */
                            }
                        }

                        Device (PRT6)
                        {
                            Name (_ADR, 0x06)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT6._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT6.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x91, 0x0C, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT6._PLD\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT6.PLD1 */
                            }
                        }

                        Device (PRT7)
                        {
                            Name (_ADR, 0x07)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT7._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT7.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x91, 0x0C, 0x00, 0x02, 0x01, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT7._PLD\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT7.PLD1 */
                            }
                        }
                    }
                }

                Device (XHC1)
                {
                    Name (_ADR, 0x04)  // _ADR: Address
                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Device (PRT1)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x10, 0x0C, 0x80, 0x04, 0x01, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT1.UPC1 */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT1.PLD1 */
                            }

                            Device (WCAM)
                            {
                                Name (_ADR, One)  // _ADR: Address
                                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                                {
                                    0xFF, 
                                    0xFF, 
                                    Zero, 
                                    Zero
                                })
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x14)
                                    {
                                        /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x05, 0x00, 0x05, 0x00,  // ........
                                        /* 0008 */  0x24, 0x09, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00,  // $.......
                                        /* 0010 */  0x2C, 0x01, 0xBE, 0xFF                           // ,...
                                    }
                                })
                                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                                {
                                    Return (PLDP) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT1.WCAM.PLDP */
                                }
                            }

                            Device (CAMI)
                            {
                                Name (_ADR, 0x06)  // _ADR: Address
                                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                                {
                                    0xFF, 
                                    0xFF, 
                                    Zero, 
                                    Zero
                                })
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x14)
                                    {
                                        /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x05, 0x00, 0x05, 0x00,  // ........
                                        /* 0008 */  0x24, 0x09, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00,  // $.......
                                        /* 0010 */  0x2C, 0x01, 0xBE, 0xFF                           // ,...
                                    }
                                })
                                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                                {
                                    Return (PLDP) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT1.CAMI.PLDP */
                                }
                            }
                        }

                        Device (PRT2)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                Zero, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x01, 0x00, 0x00, 0x03, 0x03, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0x00, 0x00, 0x00, 0x00                           // ....
                                }
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT2.UPC1 */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT2.PLD1 */
                            }
                        }
                    }
                }

                Device (MP2C)
                {
                    Name (_ADR, 0x07)  // _ADR: Address
                }
            }

            Device (GP18)
            {
                Name (_ADR, 0x00080002)  // _ADR: Address
                Name (PR18, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKC, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKD, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKA, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKB, , 
                        Zero
                    }
                })
                Name (AR18, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x11
                    }
                })
                Name (NR18, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x2A
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x2B
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x28
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x29
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR18) /* \_SB_.PCI0.GP18.NR18 */
                        }
                        Else
                        {
                            Return (AR18) /* \_SB_.PCI0.GP18.AR18 */
                        }
                    }
                    Else
                    {
                        Return (PR18) /* \_SB_.PCI0.GP18.PR18 */
                    }
                }

                Device (IPU)
                {
                    Name (_ADR, One)  // _ADR: Address
                }
            }

            Device (GP19)
            {
                Name (_ADR, 0x00080003)  // _ADR: Address
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Return (Buffer (One)
                                {
                                     0xFF                                             // .
                                })
                            }
                            Case (0x05)
                            {
                                Return (Zero)
                            }
                            Default
                            {
                                Return (Zero)
                            }

                        }
                    }
                    Else
                    {
                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }

                Name (PR19, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKG, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKH, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKE, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKF, , 
                        Zero
                    }
                })
                Name (AR19, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x17
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x15
                    }
                })
                Name (NR19, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x2E
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x2F
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x2C
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x2D
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR19) /* \_SB_.PCI0.GP19.NR19 */
                        }
                        Else
                        {
                            Return (AR19) /* \_SB_.PCI0.GP19.AR19 */
                        }
                    }
                    Else
                    {
                        Return (PR19) /* \_SB_.PCI0.GP19.PR19 */
                    }
                }

                Device (XHC2)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Device (PRT1)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP19.XHC2.RHUB.PRT1._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (M600 (One, Zero))
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP19.XHC2.RHUB.PRT1._PLD\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (M601 (0x02, Zero, 0x08, Zero, 0x0104, Zero))
                            }
                        }

                        Device (PRT2)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP19.XHC2.RHUB.PRT2._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (M600 (Zero, Zero))
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP19.XHC2.RHUB.PRT2._PLD\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (M601 (0x02, Zero, 0x08, Zero, 0x0104, Zero))
                            }
                        }
                    }
                }

                Device (NHI0)
                {
                    Name (_ADR, 0x05)  // _ADR: Address
                }

                Device (XHC3)
                {
                    Name (_ADR, 0x03)  // _ADR: Address
                    Name (_S4W, 0x02)  // _S4W: S4 Device Wake State
                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Device (PRT1)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0x09, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC1) /* \_SB_.PCI0.GP19.XHC3.RHUB.PRT1.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x11, 0x0C, 0x80, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP19.XHC3.RHUB.PRT1.PLD1 */
                            }
                        }

                        Device (PRT2)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0x09, 
                                Zero, 
                                Zero
                            })
                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x11, 0x0C, 0x80, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC1) /* \_SB_.PCI0.GP19.XHC3.RHUB.PRT2.UPC1 */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP19.XHC3.RHUB.PRT2.PLD1 */
                            }
                        }
                    }
                }

                Device (NHI1)
                {
                    Name (_ADR, 0x06)  // _ADR: Address
                }

                Device (XHC4)
                {
                    Name (_ADR, 0x04)  // _ADR: Address
                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Device (PRT1)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC1) /* \_SB_.PCI0.GP19.XHC4.RHUB.PRT1.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x91, 0x0C, 0x80, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP19.XHC4.RHUB.PRT1.PLD1 */
                            }
                        }

                        Device (PRT2)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                Zero, 
                                Zero
                            })
                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x91, 0x0C, 0x80, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC1) /* \_SB_.PCI0.GP19.XHC4.RHUB.PRT2.UPC1 */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP19.XHC4.RHUB.PRT2.PLD1 */
                            }
                        }
                    }
                }
            }

            Device (HPET)
            {
                Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((HPEN == One))
                    {
                        If ((OSTB >= 0x40))
                        {
                            M460 ("PLA-ASL-\\_SB.PCI0.HPET._STA = 0xF\n", Zero, Zero, Zero, Zero, Zero, Zero)
                            Return (0x0F)
                        }

                        HPEN = Zero
                        M460 ("PLA-ASL-\\_SB.PCI0.HPET._STA = 0x1\n", Zero, Zero, Zero, Zero, Zero, Zero)
                        Return (One)
                    }

                    M460 ("PLA-ASL-\\_SB.PCI0.HPET._STA 1 = 0x1\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (One)
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    M460 ("PLA-ASL-\\_SB.PCI0.HPET._CRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Name (BUF0, Buffer (0x14)
                    {
                        /* 0000 */  0x22, 0x01, 0x00, 0x22, 0x00, 0x01, 0x86, 0x09,  // ".."....
                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0xD0, 0xFE, 0x00, 0x04,  // ........
                        /* 0010 */  0x00, 0x00, 0x79, 0x00                           // ..y.
                    })
                    CreateDWordField (BUF0, 0x0A, HPEB)
                    Local0 = 0xFED00000
                    HPEB = (Local0 & 0xFFFFFC00)
                    Return (BUF0) /* \_SB_.PCI0.HPET._CRS.BUF0 */
                }
            }

            Device (SMBS)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
            }

            Device (LPC0)
            {
                Name (_ADR, 0x00140003)  // _ADR: Address
                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                    Name (_CRS, Buffer (0x1D)  // _CRS: Current Resource Settings
                    {
                        /* 0000 */  0x47, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x10,  // G.......
                        /* 0008 */  0x47, 0x01, 0x81, 0x00, 0x81, 0x00, 0x01, 0x0F,  // G.......
                        /* 0010 */  0x47, 0x01, 0xC0, 0x00, 0xC0, 0x00, 0x01, 0x20,  // G...... 
                        /* 0018 */  0x2A, 0x10, 0x01, 0x79, 0x00                     // *..y.
                    })
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04") /* x87-compatible Floating Point Processing Unit */)  // _HID: Hardware ID
                    Name (_CRS, Buffer (0x0D)  // _CRS: Current Resource Settings
                    {
                        /* 0000 */  0x47, 0x01, 0xF0, 0x00, 0xF0, 0x00, 0x01, 0x0F,  // G.......
                        /* 0008 */  0x22, 0x00, 0x20, 0x79, 0x00                     // ". y.
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
                    Name (_CRS, Buffer (0x15)  // _CRS: Current Resource Settings
                    {
                        /* 0000 */  0x47, 0x01, 0x20, 0x00, 0x20, 0x00, 0x01, 0x02,  // G. . ...
                        /* 0008 */  0x47, 0x01, 0xA0, 0x00, 0xA0, 0x00, 0x01, 0x02,  // G.......
                        /* 0010 */  0x22, 0x04, 0x00, 0x79, 0x00                     // "..y.
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
                    Name (BUF0, Buffer (0x0A)
                    {
                        /* 0000 */  0x47, 0x01, 0x70, 0x00, 0x70, 0x00, 0x01, 0x02,  // G.p.p...
                        /* 0008 */  0x79, 0x00                                       // y.
                    })
                    Name (BUF1, Buffer (0x0D)
                    {
                        /* 0000 */  0x47, 0x01, 0x70, 0x00, 0x70, 0x00, 0x01, 0x02,  // G.p.p...
                        /* 0008 */  0x22, 0x00, 0x01, 0x79, 0x00                     // "..y.
                    })
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((STSL == One))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        If ((HPEN == One))
                        {
                            Return (BUF0) /* \_SB_.PCI0.LPC0.RTC_.BUF0 */
                        }

                        Return (BUF1) /* \_SB_.PCI0.LPC0.RTC_.BUF1 */
                    }
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800") /* Microsoft Sound System Compatible Device */)  // _HID: Hardware ID
                    Name (_CRS, Buffer (0x0A)  // _CRS: Current Resource Settings
                    {
                        /* 0000 */  0x47, 0x01, 0x61, 0x00, 0x61, 0x00, 0x01, 0x01,  // G.a.a...
                        /* 0008 */  0x79, 0x00                                       // y.
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID
                    Name (BUF0, Buffer (0x0A)
                    {
                        /* 0000 */  0x47, 0x01, 0x40, 0x00, 0x40, 0x00, 0x01, 0x04,  // G.@.@...
                        /* 0008 */  0x79, 0x00                                       // y.
                    })
                    Name (BUF1, Buffer (0x0D)
                    {
                        /* 0000 */  0x47, 0x01, 0x40, 0x00, 0x40, 0x00, 0x01, 0x04,  // G.@.@...
                        /* 0008 */  0x22, 0x01, 0x00, 0x79, 0x00                     // "..y.
                    })
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        If ((HPEN == One))
                        {
                            Return (BUF0) /* \_SB_.PCI0.LPC0.TMR_.BUF0 */
                        }

                        Return (BUF1) /* \_SB_.PCI0.LPC0.TMR_.BUF1 */
                    }
                }

                Device (KBC0)
                {
                    Name (_HID, EisaId ("HPQ8001"))  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _CID: Compatible ID
                    Name (_CRS, Buffer (0x1B)  // _CRS: Current Resource Settings
                    {
                        /* 0000 */  0x47, 0x01, 0x60, 0x00, 0x60, 0x00, 0x01, 0x01,  // G.`.`...
                        /* 0008 */  0x47, 0x01, 0x64, 0x00, 0x64, 0x00, 0x01, 0x01,  // G.d.d...
                        /* 0010 */  0x89, 0x06, 0x00, 0x0F, 0x01, 0x01, 0x00, 0x00,  // ........
                        /* 0018 */  0x00, 0x79, 0x00                                 // .y.
                    })
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Name (_CRS, Buffer (0x72)  // _CRS: Current Resource Settings
                    {
                        /* 0000 */  0x47, 0x01, 0x10, 0x00, 0x10, 0x00, 0x01, 0x10,  // G.......
                        /* 0008 */  0x47, 0x01, 0x72, 0x00, 0x72, 0x00, 0x01, 0x02,  // G.r.r...
                        /* 0010 */  0x47, 0x01, 0x80, 0x00, 0x80, 0x00, 0x01, 0x01,  // G.......
                        /* 0018 */  0x47, 0x01, 0xB0, 0x00, 0xB0, 0x00, 0x01, 0x02,  // G.......
                        /* 0020 */  0x47, 0x01, 0x92, 0x00, 0x92, 0x00, 0x01, 0x01,  // G.......
                        /* 0028 */  0x47, 0x01, 0x00, 0x04, 0x00, 0x04, 0x01, 0xD0,  // G.......
                        /* 0030 */  0x47, 0x01, 0xD0, 0x04, 0xD0, 0x04, 0x01, 0x02,  // G.......
                        /* 0038 */  0x47, 0x01, 0xD6, 0x04, 0xD6, 0x04, 0x01, 0x01,  // G.......
                        /* 0040 */  0x47, 0x01, 0x00, 0x0C, 0x00, 0x0C, 0x01, 0x02,  // G.......
                        /* 0048 */  0x47, 0x01, 0x14, 0x0C, 0x14, 0x0C, 0x01, 0x01,  // G.......
                        /* 0050 */  0x47, 0x01, 0x50, 0x0C, 0x50, 0x0C, 0x01, 0x03,  // G.P.P...
                        /* 0058 */  0x47, 0x01, 0x6C, 0x0C, 0x6C, 0x0C, 0x01, 0x01,  // G.l.l...
                        /* 0060 */  0x47, 0x01, 0x6F, 0x0C, 0x6F, 0x0C, 0x01, 0x01,  // G.o.o...
                        /* 0068 */  0x47, 0x01, 0xD0, 0x0C, 0xD0, 0x0C, 0x01, 0x0C,  // G.......
                        /* 0070 */  0x79, 0x00                                       // y.
                    })
                }

                Device (MEM)
                {
                    Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
                    Name (MSRC, Buffer (0x1A)
                    {
                        /* 0000 */  0x86, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00,  // ........
                        /* 0008 */  0x00, 0x00, 0x02, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                        /* 0010 */  0x00, 0x00, 0xF0, 0xFF, 0x00, 0x00, 0x10, 0x00,  // ........
                        /* 0018 */  0x79, 0x00                                       // y.
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (MSRC, 0x14, PSIZ)
                        CreateDWordField (MSRC, 0x10, PBAS)
                        PSIZ = ROMS /* \ROMS */
                        Local0 = (ROMS - One)
                        PBAS = (0xFFFFFFFF - Local0)
                        Return (MSRC) /* \_SB_.PCI0.LPC0.MEM_.MSRC */
                    }
                }

                Mutex (PSMX, 0x00)
            }

            Method (DPTC, 2, NotSerialized)
            {
                Name (XX11, Buffer (0x07){})
                CreateWordField (XX11, Zero, SSZE)
                CreateByteField (XX11, 0x02, SMUF)
                CreateDWordField (XX11, 0x03, SMUD)
                SSZE = 0x07
                P80H = 0x55
                SMUF = Arg0
                SMUD = Arg1
                ALIB (0x0C, XX11)
            }

            Method (DPTP, 3, NotSerialized)
            {
                Name (XX11, Buffer (0x0B){})
                CreateWordField (XX11, Zero, SSZE)
                CreateByteField (XX11, 0x02, SMUF)
                CreateDWordField (XX11, 0x03, SMUD)
                CreateDWordField (XX11, 0x07, SMU2)
                SSZE = 0x0B
                P80H = 0x56
                SMUF = Arg0
                SMUD = Arg1
                SMU2 = Arg2
                ALIB (0x0C, XX11)
            }
        }

        OperationRegion (PIRQ, SystemIO, 0x0C00, 0x02)
        Field (PIRQ, ByteAcc, NoLock, Preserve)
        {
            PIDX,   8, 
            PDAT,   8
        }

        IndexField (PIDX, PDAT, ByteAcc, NoLock, Preserve)
        {
            PIRA,   8, 
            PIRB,   8, 
            PIRC,   8, 
            PIRD,   8, 
            PIRE,   8, 
            PIRF,   8, 
            PIRG,   8, 
            PIRH,   8, 
            Offset (0x0C), 
            SIRA,   8, 
            SIRB,   8, 
            SIRC,   8, 
            SIRD,   8, 
            PIRS,   8, 
            Offset (0x13), 
            HDAD,   8, 
            Offset (0x17), 
            SDCL,   8, 
            Offset (0x1A), 
            SDIO,   8, 
            Offset (0x30), 
            USB1,   8, 
            Offset (0x34), 
            USB3,   8, 
            Offset (0x41), 
            SATA,   8, 
            Offset (0x62), 
            GIOC,   8, 
            Offset (0x70), 
            I2C0,   8, 
            I2C1,   8, 
            I2C2,   8, 
            I2C3,   8, 
            URT0,   8, 
            URT1,   8
        }

        OperationRegion (KBDD, SystemIO, 0x64, One)
        Field (KBDD, ByteAcc, NoLock, Preserve)
        {
            PD64,   8
        }

        Method (DSPI, 0, NotSerialized)
        {
            M460 ("PLA-ASL-\\_SB.DSPI\n", Zero, Zero, Zero, Zero, Zero, Zero)
            INTA (0x1F)
            INTB (0x1F)
            INTC (0x1F)
            INTD (0x1F)
            Local1 = PD64 /* \_SB_.PD64 */
            PIRE = 0x1F
            PIRF = 0x1F
            PIRG = 0x1F
            PIRH = 0x1F
        }

        Method (INTA, 1, NotSerialized)
        {
            M460 ("PLA-ASL-\\_SB.INTA Arg0 = 0x%X\n", ToInteger (Arg0), Zero, Zero, Zero, Zero, Zero)
            PIRA = Arg0
            If (PICM)
            {
                HDAD = Arg0
                SDCL = Arg0
            }
        }

        Method (INTB, 1, NotSerialized)
        {
            M460 ("PLA-ASL-\\_SB.INTB Arg0 = 0x%X\n", ToInteger (Arg0), Zero, Zero, Zero, Zero, Zero)
            PIRB = Arg0
        }

        Method (INTC, 1, NotSerialized)
        {
            M460 ("PLA-ASL-\\_SB.INTC Arg0 = 0x%X\n", ToInteger (Arg0), Zero, Zero, Zero, Zero, Zero)
            PIRC = Arg0
            If (PICM)
            {
                USB1 = Arg0
                USB3 = Arg0
            }
        }

        Method (INTD, 1, NotSerialized)
        {
            M460 ("PLA-ASL-\\_SB.INTD Arg0 = 0x%X\n", ToInteger (Arg0), Zero, Zero, Zero, Zero, Zero)
            PIRD = Arg0
            If (PICM)
            {
                SATA = Arg0
            }
        }

        Name (PRS1, Buffer (0x06)
        {
             0x23, 0x68, 0x0C, 0x18, 0x79, 0x00               // #h..y.
        })
        Name (BUFA, Buffer (0x06)
        {
             0x23, 0x00, 0x80, 0x18, 0x79, 0x00               // #...y.
        })
        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRA && (PIRA != 0x1F)))
                {
                    M460 ("PLA-ASL-\\_SB.LNKA._STA = 0xB\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x0B)
                }
                Else
                {
                    M460 ("PLA-ASL-\\_SB.LNKA._STA = 0x9\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKA._PRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                M460 ("PLA-ASL-\\_SB.LNKA._DIS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                INTA (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKA._CRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRA) /* \_SB_.PIRA */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKA._SRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRA = Local0
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRB && (PIRB != 0x1F)))
                {
                    M460 ("PLA-ASL-\\_SB.LNKB._STA = 0xB\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x0B)
                }
                Else
                {
                    M460 ("PLA-ASL-\\_SB.LNKB._STA = 0x9\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKB._PRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                M460 ("PLA-ASL-\\_SB.LNKB._DIS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                INTB (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKB._CRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRB) /* \_SB_.PIRB */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKB._SRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRB = Local0
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRC && (PIRC != 0x1F)))
                {
                    M460 ("PLA-ASL-\\_SB.LNKC._STA = 0xB\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x0B)
                }
                Else
                {
                    M460 ("PLA-ASL-\\_SB.LNKC._STA = 0x9\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKC._PRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                M460 ("PLA-ASL-\\_SB.LNKC._DIS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                INTC (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKC._CRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRC) /* \_SB_.PIRC */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKC._SRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRC = Local0
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRD && (PIRD != 0x1F)))
                {
                    M460 ("PLA-ASL-\\_SB.LNKD._STA = 0xB\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x0B)
                }
                Else
                {
                    M460 ("PLA-ASL-\\_SB.LNKD._STA = 0x9\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKD._PRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                M460 ("PLA-ASL-\\_SB.LNKD._DIS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                INTD (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKD._CRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRD) /* \_SB_.PIRD */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKD._SRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRD = Local0
            }
        }

        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRE && (PIRE != 0x1F)))
                {
                    M460 ("PLA-ASL-\\_SB.LNKE._STA = 0xB\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x0B)
                }
                Else
                {
                    M460 ("PLA-ASL-\\_SB.LNKE._STA = 0x9\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKE._PRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                M460 ("PLA-ASL-\\_SB.LNKE._DIS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                PIRE = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKE._CRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRE) /* \_SB_.PIRE */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKE._SRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRE = Local0
            }
        }

        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x06)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRF && (PIRF != 0x1F)))
                {
                    M460 ("PLA-ASL-\\_SB.LNKF._STA = 0xB\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x0B)
                }
                Else
                {
                    M460 ("PLA-ASL-\\_SB.LNKF._STA = 0x9\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKF._PRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                M460 ("PLA-ASL-\\_SB.LNKF._DIS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                PIRF = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKF._CRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRF) /* \_SB_.PIRF */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKF._SRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRF = Local0
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x07)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRG && (PIRG != 0x1F)))
                {
                    M460 ("PLA-ASL-\\_SB.LNKG._STA = 0xB\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x0B)
                }
                Else
                {
                    M460 ("PLA-ASL-\\_SB.LNKG._STA = 0x9\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKG._PRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                M460 ("PLA-ASL-\\_SB.LNKG._DIS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                PIRG = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKG._CRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRG) /* \_SB_.PIRG */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKG._SRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRG = Local0
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x08)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRH && (PIRH != 0x1F)))
                {
                    M460 ("PLA-ASL-\\_SB.LNKH._STA = 0xB\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x0B)
                }
                Else
                {
                    M460 ("PLA-ASL-\\_SB.LNKH._STA = 0x9\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKH._PRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                M460 ("PLA-ASL-\\_SB.LNKH._DIS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                PIRH = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKH._CRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRH) /* \_SB_.PIRH */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKH._SRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRH = Local0
            }
        }

        Method (GSMI, 1, NotSerialized)
        {
            APMD = Arg0
            APMC = 0xE4
            Sleep (0x02)
        }

        Method (S80H, 1, NotSerialized)
        {
            P80H = Arg0
        }

        Method (BSMI, 1, NotSerialized)
        {
            APMD = Arg0
            APMC = 0xBE
            Sleep (One)
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D") /* Lid Device */)  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
            {
                Local0 = ^^PCI0.LPC0.EC0.LIDF /* \_SB_.PCI0.LPC0.EC0_.LIDF */
                If (Local0)
                {
                    Return (Zero)
                }

                M460 ("PLA-ASL-\\_SB.LID._LID Return 1 (1)\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Return (One)
            }
        }
    }

    Name (TSOS, 0x75)
    Name (UR0I, 0x03)
    Name (UR1I, 0x0E)
    Name (UR2I, 0x05)
    Name (UR3I, 0x0F)
    Name (UR4I, 0x0D)
    Name (IC0I, 0x0A)
    Name (IC1I, 0x0B)
    Name (IC2I, 0x04)
    Name (IC3I, 0x06)
    Name (IC4I, 0x0E)
    Name (HPTI, 0x00)
    Name (HCOR, 0x00)
    If (CondRefOf (\_OSI))
    {
        If (_OSI ("Windows 2009"))
        {
            TSOS = 0x50
        }

        If (_OSI ("Windows 2015"))
        {
            TSOS = 0x70
        }
    }

    Scope (_SB)
    {
        OperationRegion (SMIC, SystemMemory, 0xFED80000, 0x00800000)
        Field (SMIC, ByteAcc, NoLock, Preserve)
        {
            Offset (0x36A), 
            SMIB,   8
        }

        OperationRegion (SSMI, SystemIO, SMIB, 0x02)
        Field (SSMI, AnyAcc, NoLock, Preserve)
        {
            SMIW,   16
        }

        OperationRegion (ECMC, SystemIO, 0x72, 0x02)
        Field (ECMC, AnyAcc, NoLock, Preserve)
        {
            ECMI,   8, 
            ECMD,   8
        }

        IndexField (ECMI, ECMD, ByteAcc, NoLock, Preserve)
        {
            Offset (0x08), 
            FRTB,   32
        }

        OperationRegion (FRTP, SystemMemory, FRTB, 0x0100)
        Field (FRTP, AnyAcc, NoLock, Preserve)
        {
            PEBA,   32, 
                ,   5, 
            IC0E,   1, 
            IC1E,   1, 
            IC2E,   1, 
            IC3E,   1, 
            IC4E,   1, 
            IC5E,   1, 
            UT0E,   1, 
            UT1E,   1, 
            I31E,   1, 
            I32E,   1, 
            I33E,   1, 
            UT2E,   1, 
                ,   1, 
            EMMD,   2, 
            UT4E,   1, 
            I30E,   1, 
                ,   1, 
            XHCE,   1, 
                ,   1, 
                ,   1, 
            UT3E,   1, 
            ESPI,   1, 
            EMME,   1, 
            HFPE,   1, 
            HD0E,   1, 
            HD2E,   1, 
            PCEF,   1, 
                ,   4, 
            IC0D,   1, 
            IC1D,   1, 
            IC2D,   1, 
            IC3D,   1, 
            IC4D,   1, 
            IC5D,   1, 
            UT0D,   1, 
            UT1D,   1, 
            I31D,   1, 
            I32D,   1, 
            I33D,   1, 
            UT2D,   1, 
                ,   1, 
            EHCD,   1, 
                ,   1, 
            UT4D,   1, 
            I30D,   1, 
                ,   1, 
            XHCD,   1, 
            SD_D,   1, 
                ,   1, 
            UT3D,   1, 
                ,   1, 
            EMD3,   1, 
                ,   1, 
            US4D,   1, 
            S03D,   1, 
            UT0O,   1, 
            UT1O,   1, 
            UT2O,   1, 
            UT3O,   1, 
            Offset (0x1C), 
            I30M,   1, 
            I31M,   1, 
            I32M,   1, 
            I33M,   1, 
            Offset (0x2D), 
            UT0I,   1, 
            UT1I,   1, 
            UT2I,   1, 
            UT3I,   1, 
            UT4I,   1, 
            Offset (0x2E), 
            UL0I,   1, 
            UL1I,   1, 
            UL2I,   1, 
            UL3I,   1
        }

        OperationRegion (FCFG, SystemMemory, PEBA, 0x01000000)
        Field (FCFG, DWordAcc, NoLock, Preserve)
        {
            Offset (0xA3078), 
                ,   2, 
            LDQ0,   1, 
            Offset (0xA30CB), 
                ,   7, 
            AUSS,   1
        }

        OperationRegion (IOMX, SystemMemory, 0xFED80D00, 0x0100)
        Field (IOMX, AnyAcc, NoLock, Preserve)
        {
            Offset (0x15), 
            IM15,   8, 
            IM16,   8, 
            Offset (0x1F), 
            IM1F,   8, 
            IM20,   8, 
            Offset (0x44), 
            IM44,   8, 
            Offset (0x46), 
            IM46,   8, 
            Offset (0x4A), 
            IM4A,   8, 
            IM4B,   8, 
            Offset (0x57), 
            IM57,   8, 
            IM58,   8, 
            Offset (0x68), 
            IM68,   8, 
            IM69,   8, 
            IM6A,   8, 
            IM6B,   8, 
            Offset (0x6D), 
            IM6D,   8
        }

        OperationRegion (FACR, SystemMemory, 0xFED81E00, 0x0100)
        Field (FACR, AnyAcc, NoLock, Preserve)
        {
            Offset (0x80), 
                ,   28, 
            RD28,   1, 
                ,   1, 
            RQTY,   1, 
            Offset (0x84), 
                ,   28, 
            SD28,   1, 
                ,   1, 
            Offset (0xA0), 
            PG1A,   1
        }

        OperationRegion (LUIE, SystemMemory, 0xFEDC0020, 0x04)
        Field (LUIE, AnyAcc, NoLock, Preserve)
        {
            IER0,   1, 
            IER1,   1, 
            IER2,   1, 
            IER3,   1, 
            UOL0,   1, 
            UOL1,   1, 
            UOL2,   1, 
            UOL3,   1, 
            WUR0,   2, 
            WUR1,   2, 
            WUR2,   2, 
            WUR3,   2
        }

        Method (FRUI, 1, Serialized)
        {
            If ((Arg0 == Zero))
            {
                Return (IUA0) /* \_SB_.IUA0 */
            }
            ElseIf ((Arg0 == One))
            {
                Return (IUA1) /* \_SB_.IUA1 */
            }
            ElseIf ((Arg0 == 0x02))
            {
                Return (IUA2) /* \_SB_.IUA2 */
            }
            ElseIf ((Arg0 == 0x03))
            {
                Return (IUA3) /* \_SB_.IUA3 */
            }
            Else
            {
                Return (0x03)
            }
        }

        Method (FUIO, 1, Serialized)
        {
            If ((IER0 == One))
            {
                If ((WUR0 == Arg0))
                {
                    Return (Zero)
                }
            }

            If ((IER1 == One))
            {
                If ((WUR1 == Arg0))
                {
                    Return (One)
                }
            }

            If ((IER2 == One))
            {
                If ((WUR2 == Arg0))
                {
                    Return (0x02)
                }
            }

            If ((IER3 == One))
            {
                If ((WUR3 == Arg0))
                {
                    Return (0x03)
                }
            }

            Return (0x0F)
        }

        Method (SRAD, 2, Serialized)
        {
            Local0 = (Arg0 << One)
            Local0 += 0xFED81E40
            OperationRegion (ADCR, SystemMemory, Local0, 0x02)
            Field (ADCR, ByteAcc, NoLock, Preserve)
            {
                ADTD,   2, 
                ADPS,   1, 
                ADPD,   1, 
                ADSO,   1, 
                ADSC,   1, 
                ADSR,   1, 
                ADIS,   1, 
                ADDS,   3
            }

            ADIS = One
            ADSR = Zero
            Stall (Arg1)
            ADSR = One
            ADIS = Zero
            Stall (Arg1)
        }

        Method (DSAD, 2, Serialized)
        {
            Local0 = (Arg0 << One)
            Local0 += 0xFED81E40
            OperationRegion (ADCR, SystemMemory, Local0, 0x02)
            Field (ADCR, ByteAcc, NoLock, Preserve)
            {
                ADTD,   2, 
                ADPS,   1, 
                ADPD,   1, 
                ADSO,   1, 
                ADSC,   1, 
                ADSR,   1, 
                ADIS,   1, 
                ADDS,   3
            }

            If ((Arg1 != ADTD))
            {
                If ((Arg1 == Zero))
                {
                    ADTD = Zero
                    ADPD = One
                    Local0 = ADDS /* \_SB_.DSAD.ADDS */
                    While ((Local0 != 0x07))
                    {
                        Local0 = ADDS /* \_SB_.DSAD.ADDS */
                    }
                }

                If ((Arg1 == 0x03))
                {
                    ADPD = Zero
                    Local0 = ADDS /* \_SB_.DSAD.ADDS */
                    While ((Local0 != Zero))
                    {
                        Local0 = ADDS /* \_SB_.DSAD.ADDS */
                    }

                    ADTD = 0x03
                }
            }
        }

        Method (HSAD, 2, Serialized)
        {
            Local3 = (One << Arg0)
            Local0 = (Arg0 << One)
            Local0 += 0xFED81E40
            OperationRegion (ADCR, SystemMemory, Local0, 0x02)
            Field (ADCR, ByteAcc, NoLock, Preserve)
            {
                ADTD,   2, 
                ADPS,   1, 
                ADPD,   1, 
                ADSO,   1, 
                ADSC,   1, 
                ADSR,   1, 
                ADIS,   1, 
                ADDS,   3
            }

            If ((Arg1 != ADTD))
            {
                If ((Arg1 == Zero))
                {
                    PG1A = One
                    ADTD = Zero
                    ADPD = One
                    Local0 = ADDS /* \_SB_.HSAD.ADDS */
                    While ((Local0 != 0x07))
                    {
                        Local0 = ADDS /* \_SB_.HSAD.ADDS */
                    }

                    RQTY = One
                    RD28 = One
                    Local0 = SD28 /* \_SB_.SD28 */
                    While (!Local0)
                    {
                        Local0 = SD28 /* \_SB_.SD28 */
                    }
                }

                If ((Arg1 == 0x03))
                {
                    RQTY = Zero
                    RD28 = One
                    Local0 = SD28 /* \_SB_.SD28 */
                    While (Local0)
                    {
                        Local0 = SD28 /* \_SB_.SD28 */
                    }

                    ADPD = Zero
                    Local0 = ADDS /* \_SB_.HSAD.ADDS */
                    While ((Local0 != Zero))
                    {
                        Local0 = ADDS /* \_SB_.HSAD.ADDS */
                    }

                    ADTD = 0x03
                    PG1A = Zero
                }
            }
        }

        OperationRegion (FPIC, SystemIO, 0x0C00, 0x02)
        Field (FPIC, AnyAcc, NoLock, Preserve)
        {
            FPII,   8, 
            FPID,   8
        }

        IndexField (FPII, FPID, ByteAcc, NoLock, Preserve)
        {
            Offset (0xF4), 
            IUA0,   8, 
            IUA1,   8, 
            IIF6,   8, 
            IIF7,   8, 
            IUA2,   8, 
            IUA3,   8
        }

        Device (HFP1)
        {
            Name (_HID, "AMDI0060")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (HFPE)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x0E)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x10, 0xC1, 0xFE,  // ........
                    /* 0008 */  0x00, 0x01, 0x00, 0x00, 0x79, 0x00               // ....y.
                })
                Return (RBUF) /* \_SB_.HFP1._CRS.RBUF */
            }
        }

        Device (HID0)
        {
            Name (_HID, "AMDI0063")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (HD0E)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x31)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x30, 0xC1, 0xFE,  // .....0..
                    /* 0008 */  0x00, 0x02, 0x00, 0x00, 0x8C, 0x20, 0x00, 0x01,  // ..... ..
                    /* 0010 */  0x00, 0x01, 0x00, 0x19, 0x00, 0x03, 0x00, 0x00,  // ........
                    /* 0018 */  0x00, 0x00, 0x17, 0x00, 0x00, 0x19, 0x00, 0x23,  // .......#
                    /* 0020 */  0x00, 0x00, 0x00, 0xAB, 0x00, 0x5C, 0x5F, 0x53,  // .....\_S
                    /* 0028 */  0x42, 0x2E, 0x47, 0x50, 0x49, 0x4F, 0x00, 0x79,  // B.GPIO.y
                    /* 0030 */  0x00                                             // .
                })
                Return (RBUF) /* \_SB_.HID0._CRS.RBUF */
            }
        }

        Device (HID2)
        {
            Name (_HID, "AMDI0063")  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (HD2E)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x31)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x20, 0xC1, 0xFE,  // ..... ..
                    /* 0008 */  0x00, 0x02, 0x00, 0x00, 0x8C, 0x20, 0x00, 0x01,  // ..... ..
                    /* 0010 */  0x00, 0x01, 0x00, 0x19, 0x00, 0x03, 0x00, 0x00,  // ........
                    /* 0018 */  0x00, 0x00, 0x17, 0x00, 0x00, 0x19, 0x00, 0x23,  // .......#
                    /* 0020 */  0x00, 0x00, 0x00, 0xAB, 0x00, 0x5C, 0x5F, 0x53,  // .....\_S
                    /* 0028 */  0x42, 0x2E, 0x47, 0x50, 0x49, 0x4F, 0x00, 0x79,  // B.GPIO.y
                    /* 0030 */  0x00                                             // .
                })
                Return (RBUF) /* \_SB_.HID2._CRS.RBUF */
            }
        }

        Device (GPIO)
        {
            Name (_HID, "AMDI0030")  // _HID: Hardware ID
            Name (_CID, "AMDI0030")  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x17)
                {
                    /* 0000 */  0x89, 0x06, 0x00, 0x0D, 0x01, 0x07, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x86, 0x09, 0x00, 0x01, 0x00, 0x15, 0xD8,  // ........
                    /* 0010 */  0xFE, 0x00, 0x04, 0x00, 0x00, 0x79, 0x00         // .....y.
                })
                Return (RBUF) /* \_SB_.GPIO._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (PPKG)
        {
            Name (_HID, "AMDI0052")  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (PPKK)
        {
            Name (_HID, "AMDI0053")  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (((HPTI == One) && (HCOR == One)))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (FUR0)
        {
            Method (_HID, 0, Serialized)  // _HID: Hardware ID
            {
                If ((UT0O == One))
                {
                    Return ("AMDI0029")
                }

                Return ("AMDI0020")
            }

            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x23)
                {
                    /* 0000 */  0x89, 0x06, 0x00, 0x03, 0x01, 0x03, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x86, 0x09, 0x00, 0x01, 0x00, 0x90, 0xDC,  // ........
                    /* 0010 */  0xFE, 0x00, 0x10, 0x00, 0x00, 0x86, 0x09, 0x00,  // ........
                    /* 0018 */  0x01, 0x00, 0x70, 0xDC, 0xFE, 0x00, 0x10, 0x00,  // ..p.....
                    /* 0020 */  0x00, 0x79, 0x00                                 // .y.
                })
                CreateWordField (BUF0, 0x05, IRQW)
                IRQW = IUA0 /* \_SB_.IUA0 */
                Return (BUF0) /* \_SB_.FUR0._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = Zero
                Local1 = FUIO (Zero)
                If ((TSOS >= 0x70))
                {
                    If ((UT0E == One))
                    {
                        If ((Local1 == 0x0F))
                        {
                            Local0 = 0x0F
                        }
                    }
                }

                If ((UT0I == One))
                {
                    Local0 = Zero
                }

                Return (Local0)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((UT0D && UT0E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((UT0D && UT0E))
                {
                    DSAD (0x0B, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((UT0D && UT0E))
                {
                    DSAD (0x0B, 0x03)
                }
            }
        }

        Device (FUR1)
        {
            Method (_HID, 0, Serialized)  // _HID: Hardware ID
            {
                If ((UT1O == One))
                {
                    Return ("AMDI0029")
                }

                Return ("AMDI0020")
            }

            Name (_UID, One)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x23)
                {
                    /* 0000 */  0x89, 0x06, 0x00, 0x03, 0x01, 0x0E, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x86, 0x09, 0x00, 0x01, 0x00, 0xA0, 0xDC,  // ........
                    /* 0010 */  0xFE, 0x00, 0x10, 0x00, 0x00, 0x86, 0x09, 0x00,  // ........
                    /* 0018 */  0x01, 0x00, 0x80, 0xDC, 0xFE, 0x00, 0x10, 0x00,  // ........
                    /* 0020 */  0x00, 0x79, 0x00                                 // .y.
                })
                CreateWordField (BUF0, 0x05, IRQW)
                IRQW = IUA1 /* \_SB_.IUA1 */
                Return (BUF0) /* \_SB_.FUR1._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = Zero
                Local1 = FUIO (One)
                If ((TSOS >= 0x70))
                {
                    If ((UT1E == One))
                    {
                        If ((Local1 == 0x0F))
                        {
                            Local0 = 0x0F
                        }
                    }
                }

                If ((UT1I == One))
                {
                    Local0 = Zero
                }

                Return (Local0)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((UT1D && UT1E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((UT1D && UT1E))
                {
                    DSAD (0x0C, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((UT1D && UT1E))
                {
                    DSAD (0x0C, 0x03)
                }
            }
        }

        Device (FUR2)
        {
            Method (_HID, 0, Serialized)  // _HID: Hardware ID
            {
                If ((UT2O == One))
                {
                    Return ("AMDI0029")
                }

                Return ("AMDI0020")
            }

            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x23)
                {
                    /* 0000 */  0x89, 0x06, 0x00, 0x03, 0x01, 0x05, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x86, 0x09, 0x00, 0x01, 0x00, 0xE0, 0xDC,  // ........
                    /* 0010 */  0xFE, 0x00, 0x10, 0x00, 0x00, 0x86, 0x09, 0x00,  // ........
                    /* 0018 */  0x01, 0x00, 0xC0, 0xDC, 0xFE, 0x00, 0x10, 0x00,  // ........
                    /* 0020 */  0x00, 0x79, 0x00                                 // .y.
                })
                CreateWordField (BUF0, 0x05, IRQW)
                IRQW = IUA2 /* \_SB_.IUA2 */
                Return (BUF0) /* \_SB_.FUR2._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = Zero
                Local1 = FUIO (0x02)
                If ((TSOS >= 0x70))
                {
                    If ((UT2E == One))
                    {
                        If ((Local1 == 0x0F))
                        {
                            Local0 = 0x0F
                        }
                    }
                }

                If ((UT2I == One))
                {
                    Local0 = Zero
                }

                Return (Local0)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((UT2D && UT2E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((UT2D && UT2E))
                {
                    DSAD (0x10, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((UT2D && UT2E))
                {
                    DSAD (0x10, 0x03)
                }
            }
        }

        Device (FUR3)
        {
            Method (_HID, 0, Serialized)  // _HID: Hardware ID
            {
                If ((UT3O == One))
                {
                    Return ("AMDI0029")
                }

                Return ("AMDI0020")
            }

            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x23)
                {
                    /* 0000 */  0x89, 0x06, 0x00, 0x03, 0x01, 0x0F, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x86, 0x09, 0x00, 0x01, 0x00, 0xF0, 0xDC,  // ........
                    /* 0010 */  0xFE, 0x00, 0x10, 0x00, 0x00, 0x86, 0x09, 0x00,  // ........
                    /* 0018 */  0x01, 0x00, 0xD0, 0xDC, 0xFE, 0x00, 0x10, 0x00,  // ........
                    /* 0020 */  0x00, 0x79, 0x00                                 // .y.
                })
                CreateWordField (BUF0, 0x05, IRQW)
                IRQW = IUA3 /* \_SB_.IUA3 */
                Return (BUF0) /* \_SB_.FUR3._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = Zero
                Local1 = FUIO (0x03)
                If ((TSOS >= 0x70))
                {
                    If ((UT3E == One))
                    {
                        If ((Local1 == 0x0F))
                        {
                            Local0 = 0x0F
                        }
                    }
                }

                If ((UT3I == One))
                {
                    Local0 = Zero
                }

                Return (Local0)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((UT3D && UT3E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((UT3D && UT3E))
                {
                    DSAD (0x1A, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((UT3D && UT3E))
                {
                    DSAD (0x1A, 0x03)
                }
            }
        }

        Device (FUR4)
        {
            Name (_HID, "AMDI0020")  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x23)
                {
                    /* 0000 */  0x89, 0x06, 0x00, 0x03, 0x01, 0x10, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x86, 0x09, 0x00, 0x01, 0x00, 0x10, 0xDD,  // ........
                    /* 0010 */  0xFE, 0x00, 0x10, 0x00, 0x00, 0x86, 0x09, 0x00,  // ........
                    /* 0018 */  0x01, 0x00, 0x00, 0xDD, 0xFE, 0x00, 0x10, 0x00,  // ........
                    /* 0020 */  0x00, 0x79, 0x00                                 // .y.
                })
                CreateByteField (BUF0, 0x05, IRQB)
                IRQB = IIF7 /* \_SB_.IIF7 */
                Return (BUF0) /* \_SB_.FUR4._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = Zero
                If ((TSOS >= 0x70))
                {
                    If ((UT4E == One))
                    {
                        Local0 = 0x0F
                    }
                }

                If ((UT4I == One))
                {
                    Local0 = Zero
                }

                Return (Local0)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((UT4D && UT4E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((UT4D && UT4E))
                {
                    DSAD (0x14, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((UT4D && UT4E))
                {
                    DSAD (0x14, 0x03)
                }
            }
        }

        Device (I2CA)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x12)
                {
                    /* 0000 */  0x23, 0x00, 0x04, 0x01, 0x86, 0x09, 0x00, 0x01,  // #.......
                    /* 0008 */  0x00, 0x20, 0xDC, 0xFE, 0x00, 0x10, 0x00, 0x00,  // . ......
                    /* 0010 */  0x79, 0x00                                       // y.
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (IC0I & 0x0F))
                Return (BUF0) /* \_SB_.I2CA._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC0E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("d93e4d1c-58bb-493c-a06a-605a717f9e2e") /* Unknown UUID */))
                {
                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }
                        Case (One)
                        {
                            Return (Buffer (0x04)
                            {
                                 0xE5, 0x00, 0x6A, 0x00                           // ..j.
                            })
                        }

                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x05, 0xC8)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((IC0D && IC0E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((IC0D && IC0E))
                {
                    DSAD (0x05, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((IC0D && IC0E))
                {
                    DSAD (0x05, 0x03)
                }
            }
        }

        Device (I2CB)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x12)
                {
                    /* 0000 */  0x23, 0x00, 0x08, 0x01, 0x86, 0x09, 0x00, 0x01,  // #.......
                    /* 0008 */  0x00, 0x30, 0xDC, 0xFE, 0x00, 0x10, 0x00, 0x00,  // .0......
                    /* 0010 */  0x79, 0x00                                       // y.
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (IC1I & 0x0F))
                Return (BUF0) /* \_SB_.I2CB._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC1E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("d93e4d1c-58bb-493c-a06a-605a717f9e2e") /* Unknown UUID */))
                {
                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }
                        Case (One)
                        {
                            Return (Buffer (0x04)
                            {
                                 0xE5, 0x00, 0x6A, 0x00                           // ..j.
                            })
                        }

                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x06, 0xC8)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((IC1D && IC1E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((IC1D && IC1E))
                {
                    DSAD (0x06, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((IC1D && IC1E))
                {
                    DSAD (0x06, 0x03)
                }
            }
        }

        Device (I2CC)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x12)
                {
                    /* 0000 */  0x23, 0x10, 0x00, 0x01, 0x86, 0x09, 0x00, 0x01,  // #.......
                    /* 0008 */  0x00, 0x40, 0xDC, 0xFE, 0x00, 0x10, 0x00, 0x00,  // .@......
                    /* 0010 */  0x79, 0x00                                       // y.
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (IC2I & 0x0F))
                Return (BUF0) /* \_SB_.I2CC._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC2E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("d93e4d1c-58bb-493c-a06a-605a717f9e2e") /* Unknown UUID */))
                {
                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }
                        Case (One)
                        {
                            Return (Buffer (0x04)
                            {
                                 0xE5, 0x00, 0x6A, 0x00                           // ..j.
                            })
                        }

                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x07, 0xC8)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((IC2D && IC2E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((IC2D && IC2E))
                {
                    DSAD (0x07, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((IC2D && IC2E))
                {
                    DSAD (0x07, 0x03)
                }
            }
        }

        Device (I2CD)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x12)
                {
                    /* 0000 */  0x23, 0x40, 0x00, 0x01, 0x86, 0x09, 0x00, 0x01,  // #@......
                    /* 0008 */  0x00, 0x50, 0xDC, 0xFE, 0x00, 0x10, 0x00, 0x00,  // .P......
                    /* 0010 */  0x79, 0x00                                       // y.
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (IC3I & 0x0F))
                Return (BUF0) /* \_SB_.I2CD._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC3E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("d93e4d1c-58bb-493c-a06a-605a717f9e2e") /* Unknown UUID */))
                {
                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }
                        Case (One)
                        {
                            Return (Buffer (0x04)
                            {
                                 0xCF, 0x00, 0x60, 0x00                           // ..`.
                            })
                        }

                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x08, 0xC8)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((IC3D && IC3E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((IC3D && IC3E))
                {
                    DSAD (0x08, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((IC3D && IC3E))
                {
                    DSAD (0x08, 0x03)
                }
            }
        }

        Name (I3ID, "AMDI0015")
        Name (I2ID, "AMDI0016")
        Device (I3CA)
        {
            Method (_HID, 0, Serialized)  // _HID: Hardware ID
            {
                If ((I30M == Zero))
                {
                    Return (I3ID) /* \_SB_.I3ID */
                }
                Else
                {
                    Return (I2ID) /* \_SB_.I2ID */
                }
            }

            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x12)
                {
                    /* 0000 */  0x23, 0x00, 0x04, 0x01, 0x86, 0x09, 0x00, 0x01,  // #.......
                    /* 0008 */  0x00, 0x20, 0xDD, 0xFE, 0x00, 0x10, 0x00, 0x00,  // . ......
                    /* 0010 */  0x79, 0x00                                       // y.
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (IC0I & 0x0F))
                Return (BUF0) /* \_SB_.I3CA._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((I30E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x15, 0xC8)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((I30D && I30E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((I30D && I30E))
                {
                    DSAD (0x15, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((I30D && I30E))
                {
                    DSAD (0x15, 0x03)
                }
            }
        }

        Device (I3CB)
        {
            Method (_HID, 0, Serialized)  // _HID: Hardware ID
            {
                If ((I31M == Zero))
                {
                    Return (I3ID) /* \_SB_.I3ID */
                }
                Else
                {
                    Return (I2ID) /* \_SB_.I2ID */
                }
            }

            Name (_UID, One)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x12)
                {
                    /* 0000 */  0x23, 0x00, 0x08, 0x01, 0x86, 0x09, 0x00, 0x01,  // #.......
                    /* 0008 */  0x00, 0x30, 0xDD, 0xFE, 0x00, 0x10, 0x00, 0x00,  // .0......
                    /* 0010 */  0x79, 0x00                                       // y.
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (IC1I & 0x0F))
                Return (BUF0) /* \_SB_.I3CB._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((I31E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x0D, 0xC8)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((I31D && I31E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((I31D && I31E))
                {
                    DSAD (0x0D, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((I31D && I31E))
                {
                    DSAD (0x0D, 0x03)
                }
            }
        }

        Device (I3CC)
        {
            Method (_HID, 0, Serialized)  // _HID: Hardware ID
            {
                If ((I32M == Zero))
                {
                    Return (I3ID) /* \_SB_.I3ID */
                }
                Else
                {
                    Return (I2ID) /* \_SB_.I2ID */
                }
            }

            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x12)
                {
                    /* 0000 */  0x23, 0x10, 0x00, 0x01, 0x86, 0x09, 0x00, 0x01,  // #.......
                    /* 0008 */  0x00, 0x40, 0xDD, 0xFE, 0x00, 0x10, 0x00, 0x00,  // .@......
                    /* 0010 */  0x79, 0x00                                       // y.
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (IC2I & 0x0F))
                Return (BUF0) /* \_SB_.I3CC._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((I32E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x0E, 0xC8)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((I32D && I32E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((I32D && I32E))
                {
                    DSAD (0x0E, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((I32D && I32E))
                {
                    DSAD (0x0E, 0x03)
                }
            }
        }

        Device (I3CD)
        {
            Method (_HID, 0, Serialized)  // _HID: Hardware ID
            {
                If ((I33M == Zero))
                {
                    Return (I3ID) /* \_SB_.I3ID */
                }
                Else
                {
                    Return (I2ID) /* \_SB_.I2ID */
                }
            }

            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x12)
                {
                    /* 0000 */  0x23, 0x40, 0x00, 0x01, 0x86, 0x09, 0x00, 0x01,  // #@......
                    /* 0008 */  0x00, 0x60, 0xDD, 0xFE, 0x00, 0x10, 0x00, 0x00,  // .`......
                    /* 0010 */  0x79, 0x00                                       // y.
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (IC3I & 0x0F))
                Return (BUF0) /* \_SB_.I3CD._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((I33E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x0F, 0xC8)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((I33D && I33E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((I33D && I33E))
                {
                    DSAD (0x0F, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((I33D && I33E))
                {
                    DSAD (0x0F, 0x03)
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (UAR1)
        {
            Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_DDN, "COM1")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = Zero
                Local1 = FUIO (Zero)
                If ((Local1 != 0x0F))
                {
                    Local0 = 0x0F
                }

                If ((UL0I == One))
                {
                    Local0 = Zero
                }

                Return (Local0)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x0D)
                {
                    /* 0000 */  0x47, 0x01, 0xE8, 0x02, 0xE8, 0x02, 0x01, 0x08,  // G.......
                    /* 0008 */  0x22, 0x08, 0x00, 0x79, 0x00                     // "..y.
                })
                CreateByteField (BUF0, 0x02, IOLO)
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, 0x04, IORL)
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, 0x09, IRQL)
                Local0 = FUIO (Zero)
                Switch (ToInteger (Local0))
                {
                    Case (Zero)
                    {
                        IOLO = 0xE8
                        IOHI = 0x02
                        IORL = 0xE8
                        IORH = 0x02
                    }
                    Case (One)
                    {
                        IOLO = 0xF8
                        IOHI = 0x02
                        IORL = 0xF8
                        IORH = 0x02
                    }
                    Case (0x02)
                    {
                        IOLO = 0xE8
                        IOHI = 0x03
                        IORL = 0xE8
                        IORH = 0x03
                    }
                    Case (0x03)
                    {
                        IOLO = 0xF8
                        IOHI = 0x03
                        IORL = 0xF8
                        IORH = 0x03
                    }

                }

                IRQL = (One << (FRUI (Zero) & 0x0F))
                Return (BUF0) /* \_SB_.PCI0.UAR1._CRS.BUF0 */
            }
        }

        Device (UAR2)
        {
            Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_DDN, "COM2")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = Zero
                Local1 = FUIO (One)
                If ((Local1 != 0x0F))
                {
                    Local0 = 0x0F
                }

                If ((UL1I == One))
                {
                    Local0 = Zero
                }

                Return (Local0)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x0D)
                {
                    /* 0000 */  0x47, 0x01, 0xF8, 0x02, 0xF8, 0x02, 0x01, 0x08,  // G.......
                    /* 0008 */  0x22, 0x10, 0x00, 0x79, 0x00                     // "..y.
                })
                CreateByteField (BUF0, 0x02, IOLO)
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, 0x04, IORL)
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, 0x09, IRQL)
                Local0 = FUIO (One)
                Switch (ToInteger (Local0))
                {
                    Case (Zero)
                    {
                        IOLO = 0xE8
                        IOHI = 0x02
                        IORL = 0xE8
                        IORH = 0x02
                    }
                    Case (One)
                    {
                        IOLO = 0xF8
                        IOHI = 0x02
                        IORL = 0xF8
                        IORH = 0x02
                    }
                    Case (0x02)
                    {
                        IOLO = 0xE8
                        IOHI = 0x03
                        IORL = 0xE8
                        IORH = 0x03
                    }
                    Case (0x03)
                    {
                        IOLO = 0xF8
                        IOHI = 0x03
                        IORL = 0xF8
                        IORH = 0x03
                    }

                }

                IRQL = (One << (FRUI (One) & 0x0F))
                Return (BUF0) /* \_SB_.PCI0.UAR2._CRS.BUF0 */
            }
        }

        Device (UAR3)
        {
            Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_DDN, "COM3")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = Zero
                Local1 = FUIO (0x02)
                If ((Local1 != 0x0F))
                {
                    Local0 = 0x0F
                }

                If ((UL2I == One))
                {
                    Local0 = Zero
                }

                Return (Local0)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x0D)
                {
                    /* 0000 */  0x47, 0x01, 0xE8, 0x03, 0xE8, 0x03, 0x01, 0x08,  // G.......
                    /* 0008 */  0x22, 0x08, 0x00, 0x79, 0x00                     // "..y.
                })
                CreateByteField (BUF0, 0x02, IOLO)
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, 0x04, IORL)
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, 0x09, IRQL)
                Local0 = FUIO (0x02)
                Switch (ToInteger (Local0))
                {
                    Case (Zero)
                    {
                        IOLO = 0xE8
                        IOHI = 0x02
                        IORL = 0xE8
                        IORH = 0x02
                    }
                    Case (One)
                    {
                        IOLO = 0xF8
                        IOHI = 0x02
                        IORL = 0xF8
                        IORH = 0x02
                    }
                    Case (0x02)
                    {
                        IOLO = 0xE8
                        IOHI = 0x03
                        IORL = 0xE8
                        IORH = 0x03
                    }
                    Case (0x03)
                    {
                        IOLO = 0xF8
                        IOHI = 0x03
                        IORL = 0xF8
                        IORH = 0x03
                    }

                }

                IRQL = (One << (FRUI (0x02) & 0x0F))
                Return (BUF0) /* \_SB_.PCI0.UAR3._CRS.BUF0 */
            }
        }

        Device (UAR4)
        {
            Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Name (_DDN, "COM4")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = Zero
                Local1 = FUIO (0x03)
                If ((Local1 != 0x0F))
                {
                    Local0 = 0x0F
                }

                If ((UL3I == One))
                {
                    Local0 = Zero
                }

                Return (Local0)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x0D)
                {
                    /* 0000 */  0x47, 0x01, 0xF8, 0x03, 0xF8, 0x03, 0x01, 0x08,  // G.......
                    /* 0008 */  0x22, 0x10, 0x00, 0x79, 0x00                     // "..y.
                })
                CreateByteField (BUF0, 0x02, IOLO)
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, 0x04, IORL)
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, 0x09, IRQL)
                Local0 = FUIO (0x03)
                Switch (ToInteger (Local0))
                {
                    Case (Zero)
                    {
                        IOLO = 0xE8
                        IOHI = 0x02
                        IORL = 0xE8
                        IORH = 0x02
                    }
                    Case (One)
                    {
                        IOLO = 0xF8
                        IOHI = 0x02
                        IORL = 0xF8
                        IORH = 0x02
                    }
                    Case (0x02)
                    {
                        IOLO = 0xE8
                        IOHI = 0x03
                        IORL = 0xE8
                        IORH = 0x03
                    }
                    Case (0x03)
                    {
                        IOLO = 0xF8
                        IOHI = 0x03
                        IORL = 0xF8
                        IORH = 0x03
                    }

                }

                IRQL = (One << (FRUI (0x03) & 0x0F))
                Return (BUF0) /* \_SB_.PCI0.UAR4._CRS.BUF0 */
            }
        }
    }

    Scope (_SB.I2CD)
    {
        Device (TPDD)
        {
            Name (_HID, "ELAN07C7")  // _HID: Hardware ID
            Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
            Name (_UID, 0x08)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x41)
                {
                    /* 0000 */  0x8E, 0x19, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                    /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                    /* 0010 */  0x15, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x49,  // ..\_SB.I
                    /* 0018 */  0x32, 0x43, 0x44, 0x00, 0x8C, 0x20, 0x00, 0x01,  // 2CD.. ..
                    /* 0020 */  0x00, 0x01, 0x00, 0x12, 0x00, 0x01, 0x00, 0x00,  // ........
                    /* 0028 */  0x00, 0x00, 0x17, 0x00, 0x00, 0x19, 0x00, 0x23,  // .......#
                    /* 0030 */  0x00, 0x00, 0x00, 0x0C, 0x00, 0x5C, 0x5F, 0x53,  // .....\_S
                    /* 0038 */  0x42, 0x2E, 0x47, 0x50, 0x49, 0x4F, 0x00, 0x79,  // B.GPIO.y
                    /* 0040 */  0x00                                             // .
                })
                Return (RBUF) /* \_SB_.I2CD.TPDD._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
            {
                If (Arg0){}
                Else
                {
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("3cdff6f7-4267-4555-ad05-b30a3d8938de") /* HID I2C Device */))
                {
                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            Switch (ToInteger (Arg1))
                            {
                                Case (One)
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03                                             // .
                                    })
                                }
                                Default
                                {
                                    Return (Buffer (One)
                                    {
                                         0x00                                             // .
                                    })
                                }

                            }
                        }
                        Case (One)
                        {
                            Return (One)
                        }
                        Default
                        {
                            Return (Zero)
                        }

                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }
    }

    Scope (_SB)
    {
        Name (CSSV, Zero)
        Name (DSSI, Zero)
        Method (DSSV, 0, Serialized)
        {
            CSSV = Zero
            CSSV <<= 0x10
            CSSV |= Zero /* \_SB_.CSSV */
        }

        Device (WFDE)
        {
            Name (_HID, "PNP0C14" /* Windows Management Instrumentation Device */)  // _HID: Hardware ID
            Name (_UID, "SampleDev")  // _UID: Unique ID
            Name (_WDG, Buffer (0x3C)
            {
                /* 0000 */  0xEF, 0x9D, 0xC4, 0x2B, 0x15, 0x7B, 0x05, 0x4F,  // ...+.{.O
                /* 0008 */  0x8B, 0xB7, 0xEE, 0x37, 0xB9, 0x54, 0x7C, 0x0B,  // ...7.T|.
                /* 0010 */  0x44, 0x45, 0x01, 0x02, 0x3E, 0xA3, 0xFE, 0xA6,  // DE..>...
                /* 0018 */  0xBF, 0xDA, 0xF5, 0x46, 0xBF, 0xC8, 0x46, 0x0D,  // ...F..F.
                /* 0020 */  0x96, 0x1B, 0xEC, 0x9F, 0xD0, 0x00, 0x01, 0x08,  // ........
                /* 0028 */  0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11,  // !...f...
                /* 0030 */  0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10,  // ......).
                /* 0038 */  0x43, 0x43, 0x01, 0x00                           // CC..
            })
            Method (WMDE, 3, NotSerialized)
            {
                If ((Arg1 == One))
                {
                    Return (One)
                }

                If ((Arg1 == 0x02))
                {
                    If ((DSSI == Zero))
                    {
                        DSSV ()
                        DSSI = One
                    }

                    Return (One)
                }

                If ((Arg1 == 0x03))
                {
                    Return (CSSV) /* \_SB_.CSSV */
                }

                Return (Zero)
            }

            Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event, xx=0x00-0xFF
            {
                If ((Arg0 == 0xD0))
                {
                    Return (CSSV) /* \_SB_.CSSV */
                }

                Return (Zero)
            }

            Name (WQCC, Buffer (0x043D)
            {
                /* 0000 */  0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,  // FOMB....
                /* 0008 */  0x2D, 0x04, 0x00, 0x00, 0xB4, 0x0F, 0x00, 0x00,  // -.......
                /* 0010 */  0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,  // DS...}.T
                /* 0018 */  0x28, 0xCE, 0x87, 0x00, 0x01, 0x06, 0x18, 0x42,  // (......B
                /* 0020 */  0x10, 0x07, 0x10, 0x22, 0x21, 0x04, 0x12, 0x01,  // ..."!...
                /* 0028 */  0xA1, 0xC8, 0x2C, 0x0C, 0x86, 0x10, 0x38, 0x2E,  // ..,...8.
                /* 0030 */  0x24, 0x15, 0x07, 0x85, 0x12, 0x02, 0xA1, 0xFE,  // $.......
                /* 0038 */  0x04, 0xF2, 0x2B, 0x00, 0xA1, 0x43, 0x01, 0x32,  // ..+..C.2
                /* 0040 */  0x05, 0x18, 0x14, 0xE0, 0x14, 0x41, 0x04, 0xBD,  // .....A..
                /* 0048 */  0x0A, 0xB0, 0x29, 0xC0, 0xA4, 0x00, 0x8B, 0x02,  // ..).....
                /* 0050 */  0xB4, 0x0B, 0xB0, 0x2C, 0x40, 0xB7, 0x00, 0xE9,  // ...,@...
                /* 0058 */  0xB0, 0x44, 0x24, 0x38, 0x4A, 0x0C, 0x38, 0x4A,  // .D$8J.8J
                /* 0060 */  0x27, 0xB6, 0x70, 0xC3, 0x06, 0x2F, 0x14, 0x45,  // '.p../.E
                /* 0068 */  0x33, 0x88, 0x92, 0xA0, 0x72, 0x01, 0xBE, 0x11,  // 3...r...
                /* 0070 */  0x04, 0x5E, 0xAE, 0x00, 0xC9, 0x13, 0x90, 0x66,  // .^.....f
                /* 0078 */  0x01, 0x86, 0x05, 0x58, 0x17, 0x20, 0x7B, 0x08,  // ...X. {.
                /* 0080 */  0x54, 0xEA, 0x10, 0x50, 0x72, 0x86, 0x80, 0x1A,  // T..Pr...
                /* 0088 */  0x40, 0xAB, 0x13, 0x10, 0x7E, 0xA5, 0x53, 0x42,  // @...~.SB
                /* 0090 */  0x12, 0x84, 0x33, 0x56, 0xF1, 0xF8, 0x9A, 0x45,  // ..3V...E
                /* 0098 */  0xD3, 0x73, 0x92, 0x73, 0x0C, 0x39, 0x1E, 0x17,  // .s.s.9..
                /* 00A0 */  0x7A, 0x10, 0x3C, 0x84, 0x04, 0x10, 0x26, 0x7B,  // z.<...&{
                /* 00A8 */  0xC8, 0x92, 0x0D, 0x83, 0xD2, 0x30, 0x16, 0xEA,  // .....0..
                /* 00B0 */  0x62, 0xD4, 0xA8, 0x91, 0xB2, 0x01, 0x19, 0xA2,  // b.......
                /* 00B8 */  0x24, 0x38, 0xD4, 0xA8, 0x3D, 0xBB, 0xE6, 0xC7,  // $8..=...
                /* 00C0 */  0xA1, 0xD9, 0xB5, 0x3D, 0x16, 0x02, 0xC9, 0xA4,  // ...=....
                /* 00C8 */  0x0D, 0x05, 0x25, 0x05, 0x42, 0xC2, 0x67, 0x4A,  // ..%.B.gJ
                /* 00D0 */  0x66, 0x14, 0xF1, 0x48, 0x0D, 0x93, 0xC0, 0xA3,  // f..H....
                /* 00D8 */  0x88, 0xEC, 0x19, 0x46, 0x63, 0xD0, 0xD8, 0x61,  // ...Fc..a
                /* 00E0 */  0x78, 0x98, 0xC1, 0x0E, 0xE2, 0x30, 0x8E, 0x39,  // x....0.9
                /* 00E8 */  0x72, 0x02, 0x4F, 0xE8, 0x48, 0x8F, 0xBC, 0xB0,  // r.O.H...
                /* 00F0 */  0x79, 0x0A, 0x35, 0x46, 0x73, 0x50, 0x04, 0xFF,  // y.5FsP..
                /* 00F8 */  0x51, 0x00, 0x2B, 0x11, 0x56, 0xA3, 0x8D, 0x7D,  // Q.+.V..}
                /* 0100 */  0xBE, 0x1E, 0xCD, 0xC1, 0xC6, 0x38, 0x82, 0xE3,  // .....8..
                /* 0108 */  0x4A, 0xF0, 0xFF, 0x0F, 0x13, 0xA4, 0xF7, 0xE9,  // J.......
                /* 0110 */  0x10, 0x41, 0x78, 0x12, 0x3D, 0x0B, 0x61, 0xF5,  // .Ax.=.a.
                /* 0118 */  0x0C, 0x24, 0x9C, 0x10, 0xC7, 0xCD, 0x61, 0x0E,  // .$....a.
                /* 0120 */  0x58, 0x83, 0x40, 0xC9, 0x80, 0x10, 0xE4, 0x33,  // X.@....3
                /* 0128 */  0xC1, 0xD1, 0x99, 0xC0, 0xEE, 0x8F, 0x02, 0xD2,  // ........
                /* 0130 */  0x26, 0x40, 0xE3, 0x1D, 0x40, 0x20, 0x9D, 0x21,  // &@..@ .!
                /* 0138 */  0x08, 0xA4, 0xAD, 0xC1, 0x08, 0xA6, 0x42, 0x28,  // ......B(
                /* 0140 */  0xA1, 0x1C, 0x55, 0x38, 0x5B, 0x43, 0x11, 0x90,  // ..U8[C..
                /* 0148 */  0x6F, 0x05, 0xAF, 0x0F, 0xA1, 0xD8, 0xD4, 0x42,  // o......B
                /* 0150 */  0x1E, 0x5B, 0x90, 0xC6, 0xC0, 0x84, 0x1C, 0x2C,  // .[.....,
                /* 0158 */  0x4C, 0xBC, 0xF6, 0x17, 0xC2, 0x1E, 0x12, 0x3A,  // L......:
                /* 0160 */  0x0B, 0x38, 0xD2, 0x68, 0x50, 0x07, 0x05, 0x9F,  // .8.hP...
                /* 0168 */  0x07, 0x7C, 0x16, 0x78, 0x3E, 0xF0, 0xA8, 0x0E,  // .|.x>...
                /* 0170 */  0xCD, 0x83, 0x3B, 0xB0, 0xC7, 0x87, 0x07, 0x01,  // ..;.....
                /* 0178 */  0x0F, 0x99, 0xDD, 0x10, 0x7C, 0xAE, 0xF0, 0xC9,  // ....|...
                /* 0180 */  0x00, 0xEF, 0x1A, 0x50, 0x57, 0x82, 0x07, 0x02,  // ...PW...
                /* 0188 */  0x36, 0x46, 0xC3, 0xF1, 0x21, 0x7A, 0xB8, 0xE1,  // 6F..!z..
                /* 0190 */  0x4E, 0xE0, 0x10, 0x19, 0xA0, 0x67, 0xF5, 0x2C,  // N....g.,
                /* 0198 */  0x80, 0x1D, 0xD6, 0xC9, 0x3C, 0x08, 0xBC, 0x4B,  // ....<..K
                /* 01A0 */  0x34, 0x7B, 0x8B, 0x20, 0x04, 0xC7, 0xE3, 0x0B,  // 4{. ....
                /* 01A8 */  0x04, 0x9B, 0x70, 0x02, 0xCB, 0x1F, 0x04, 0x6A,  // ..p....j
                /* 01B0 */  0x64, 0x86, 0xF6, 0x74, 0x4F, 0xEB, 0x45, 0xC0,  // d..tO.E.
                /* 01B8 */  0x07, 0x00, 0x13, 0x58, 0x2C, 0x84, 0x14, 0x40,  // ...X,..@
                /* 01C0 */  0x68, 0x3C, 0xE0, 0x57, 0x7C, 0xE8, 0x20, 0xB7,  // h<.W|. .
                /* 01C8 */  0x05, 0xCF, 0xD7, 0x47, 0x13, 0xE6, 0x64, 0x3C,  // ...G..d<
                /* 01D0 */  0xA8, 0x51, 0xF8, 0x14, 0x10, 0xEE, 0xBC, 0x4D,  // .Q.....M
                /* 01D8 */  0xE0, 0xC0, 0x10, 0xFA, 0x5F, 0x58, 0xD4, 0x31,  // ...._X.1
                /* 01E0 */  0x85, 0x9F, 0x26, 0xE8, 0x41, 0x82, 0xA1, 0xB2,  // ..&.A...
                /* 01E8 */  0xFF, 0x3F, 0xC4, 0x91, 0x9C, 0x90, 0x3F, 0x2B,  // .?....?+
                /* 01F0 */  0x1E, 0x18, 0x7C, 0xC1, 0xA7, 0x08, 0x20, 0x03,  // ..|... .
                /* 01F8 */  0x83, 0xBB, 0x42, 0xB0, 0x01, 0xC3, 0xBF, 0x4C,  // ..B....L
                /* 0200 */  0x18, 0xD8, 0x17, 0x89, 0xCA, 0x20, 0xC9, 0x91,  // ..... ..
                /* 0208 */  0xE3, 0x89, 0x06, 0x0C, 0xE8, 0x7D, 0x0E, 0x56,  // .....}.V
                /* 0210 */  0x87, 0x16, 0x83, 0xF9, 0x3E, 0x13, 0xEC, 0xE5,  // ....>...
                /* 0218 */  0xA1, 0x47, 0x20, 0xDD, 0x59, 0xAC, 0x15, 0x42,  // .G .Y..B
                /* 0220 */  0x38, 0xAF, 0x30, 0x3E, 0xD6, 0x00, 0x93, 0x51,  // 8.0>...Q
                /* 0228 */  0x3F, 0xD6, 0x80, 0xED, 0xE4, 0x03, 0x67, 0x00,  // ?.....g.
                /* 0230 */  0x3C, 0x8E, 0x09, 0x10, 0x26, 0xFA, 0x5D, 0x20,  // <...&.] 
                /* 0238 */  0x29, 0x0F, 0x04, 0x0A, 0xE3, 0x23, 0x0D, 0x70,  // )....#.p
                /* 0240 */  0xF9, 0xFF, 0x1F, 0x69, 0x80, 0xDF, 0xC9, 0x00,  // ...i....
                /* 0248 */  0x77, 0x7A, 0x00, 0xCF, 0x84, 0x5E, 0x2B, 0xD8,  // wz...^+.
                /* 0250 */  0xFD, 0xC1, 0xE3, 0x08, 0x12, 0x38, 0xC2, 0x13,  // .....8..
                /* 0258 */  0x11, 0x39, 0xD1, 0x40, 0x3E, 0x35, 0x3C, 0xC2,  // .9.@>5<.
                /* 0260 */  0x3C, 0x07, 0x9C, 0xCE, 0xE1, 0x1C, 0xC9, 0x43,  // <......C
                /* 0268 */  0xC0, 0xEB, 0x8C, 0xBD, 0x21, 0xE9, 0x1E, 0xF3,  // ....!...
                /* 0270 */  0x3A, 0x63, 0xAC, 0x40, 0x27, 0x15, 0xC5, 0xF7,  // :c.@'...
                /* 0278 */  0x99, 0x50, 0x11, 0xA2, 0x45, 0x09, 0x19, 0xE1,  // .P..E...
                /* 0280 */  0x15, 0x22, 0xA4, 0x91, 0xA3, 0x45, 0x8C, 0x12,  // ."...E..
                /* 0288 */  0x3F, 0x64, 0x9C, 0x27, 0x1A, 0x16, 0xEB, 0x28,  // ?d.'...(
                /* 0290 */  0xA0, 0xF3, 0x87, 0x4F, 0x34, 0x80, 0xDF, 0xFF,  // ...O4...
                /* 0298 */  0xFF, 0x89, 0x06, 0xFC, 0xF2, 0x4E, 0x24, 0xA0,  // .....N$.
                /* 02A0 */  0x3B, 0x36, 0x79, 0x0E, 0x21, 0x9E, 0x46, 0x80,  // ;6y.!.F.
                /* 02A8 */  0x8B, 0xF4, 0x47, 0x87, 0x4E, 0x75, 0x64, 0xA1,  // ..G.Nud.
                /* 02B0 */  0xB2, 0xB1, 0x50, 0x0F, 0x82, 0x0A, 0x3F, 0x21,  // ..P...?!
                /* 02B8 */  0xE8, 0xAC, 0x12, 0x37, 0xE6, 0xAB, 0xCA, 0x6B,  // ...7...k
                /* 02C0 */  0x84, 0x4F, 0x6B, 0xBE, 0x4B, 0xB0, 0x41, 0x0B,  // .Ok.K.A.
                /* 02C8 */  0x4E, 0xA7, 0x3D, 0x2E, 0x93, 0x42, 0x22, 0x21,  // N.=..B"!
                /* 02D0 */  0x34, 0x20, 0xC3, 0x59, 0x16, 0x1C, 0x05, 0xF1,  // 4 .Y....
                /* 02D8 */  0xE8, 0x7D, 0xE2, 0xF3, 0x51, 0x08, 0x6E, 0xC4,  // .}..Q.n.
                /* 02E0 */  0xA3, 0x10, 0x3D, 0x2D, 0xE0, 0xC7, 0x72, 0x64,  // ..=-..rd
                /* 02E8 */  0x27, 0xE6, 0x59, 0xF8, 0x70, 0x87, 0x3B, 0x72,  // '.Y.p.;r
                /* 02F0 */  0xC0, 0x1D, 0x1C, 0x5B, 0xE1, 0xF1, 0xFB, 0x02,  // ...[....
                /* 02F8 */  0x10, 0xE4, 0x7C, 0x83, 0x9D, 0xAC, 0x51, 0x5E,  // ..|...Q^
                /* 0300 */  0x11, 0x3C, 0x42, 0xEC, 0x60, 0x7C, 0x4C, 0xE2,  // .<B.`|L.
                /* 0308 */  0xE3, 0xF0, 0xD5, 0xE0, 0x7D, 0xC6, 0x04, 0xEC,  // ....}...
                /* 0310 */  0x0C, 0x04, 0x9E, 0xFF, 0xFF, 0x19, 0x88, 0x0B,  // ........
                /* 0318 */  0x3C, 0x22, 0x80, 0x02, 0xC8, 0x97, 0x02, 0x1F,  // <"......
                /* 0320 */  0x11, 0x1E, 0x0C, 0xD8, 0x1C, 0x9E, 0x12, 0x7C,  // .......|
                /* 0328 */  0xC4, 0x61, 0xF0, 0x3C, 0xDA, 0xA8, 0xA8, 0xAC,  // .a.<....
                /* 0330 */  0x71, 0xA1, 0x06, 0xEB, 0x33, 0x0C, 0xC3, 0x3E,  // q...3..>
                /* 0338 */  0x4F, 0x5F, 0x9A, 0x8E, 0xD2, 0xC7, 0x29, 0x0C,  // O_....).
                /* 0340 */  0xAC, 0x87, 0xCF, 0x61, 0x8D, 0x16, 0xF6, 0xA8,  // ...a....
                /* 0348 */  0x9F, 0x24, 0x7C, 0x0B, 0xF1, 0xCC, 0x8C, 0x11,  // .$|.....
                /* 0350 */  0xD6, 0x47, 0x00, 0x20, 0x76, 0x7C, 0x40, 0x9D,  // .G. v|@.
                /* 0358 */  0x79, 0x7C, 0x6E, 0xF0, 0x88, 0x22, 0x9E, 0xE7,  // y|n.."..
                /* 0360 */  0xDB, 0x8F, 0x2F, 0x1B, 0xA7, 0xE4, 0x01, 0x59,  // ../....Y
                /* 0368 */  0xE2, 0xE9, 0x01, 0x25, 0x8E, 0x42, 0xD2, 0x4E,  // ...%.B.N
                /* 0370 */  0x0F, 0x28, 0x31, 0x70, 0x14, 0xC4, 0xA7, 0x07,  // .(1p....
                /* 0378 */  0x07, 0x3D, 0x3D, 0x40, 0x0F, 0x76, 0x7A, 0x00,  // .==@.vz.
                /* 0380 */  0xC5, 0xA9, 0x00, 0x37, 0x56, 0xB8, 0x63, 0xF3,  // ...7V.c.
                /* 0388 */  0x21, 0xCC, 0x73, 0xC3, 0x1E, 0x1C, 0xC0, 0xF2,  // !.s.....
                /* 0390 */  0xFF, 0x3F, 0x38, 0x00, 0xDF, 0xE1, 0xFA, 0xE0,  // .?8.....
                /* 0398 */  0x00, 0xAE, 0x33, 0x80, 0x0F, 0x0E, 0xE0, 0x3A,  // ..3....:
                /* 03A0 */  0x6E, 0x82, 0x67, 0xF4, 0xEC, 0x08, 0xF3, 0x88,  // n.g.....
                /* 03A8 */  0x63, 0xAC, 0x73, 0x7D, 0xE4, 0xF1, 0x09, 0x00,  // c.s}....
                /* 03B0 */  0x8E, 0x98, 0x73, 0x03, 0x6A, 0xB8, 0x96, 0x7B,  // ..s.j..{
                /* 03B8 */  0x8A, 0x41, 0xDC, 0x11, 0x30, 0x07, 0x18, 0x1F,  // .A..0...
                /* 03C0 */  0x1B, 0xB8, 0x40, 0x0A, 0xC9, 0x3B, 0x36, 0xA0,  // ..@..;6.
                /* 03C8 */  0x04, 0xC1, 0x51, 0x10, 0x8F, 0xD1, 0x61, 0x8F,  // ..Q...a.
                /* 03D0 */  0x0D, 0xD0, 0xC3, 0x1D, 0x1B, 0x40, 0x71, 0xFC,  // .....@q.
                /* 03D8 */  0xC1, 0x9F, 0x38, 0xE0, 0x9F, 0xC3, 0xE0, 0x1C,  // ..8.....
                /* 03E0 */  0x1C, 0xF8, 0xFF, 0xFF, 0xE0, 0x00, 0xF8, 0x08,  // ........
                /* 03E8 */  0x75, 0x70, 0x00, 0x1D, 0x2C, 0x3F, 0x38, 0x80,  // up..,?8.
                /* 03F0 */  0x67, 0xFC, 0xC0, 0x43, 0xA1, 0x4D, 0x9F, 0x1A,  // g..C.M..
                /* 03F8 */  0x8D, 0x5A, 0x35, 0x28, 0x53, 0xA3, 0x4C, 0x83,  // .Z5(S.L.
                /* 0400 */  0x5A, 0x7D, 0x2A, 0x35, 0x66, 0xCC, 0xC6, 0x91,  // Z}*5f...
                /* 0408 */  0x01, 0x25, 0x64, 0x55, 0x1A, 0x96, 0x63, 0x80,  // .%dU..c.
                /* 0410 */  0xF0, 0x47, 0x82, 0x40, 0x1C, 0xD5, 0x02, 0x20,  // .G.@... 
                /* 0418 */  0x8B, 0xE2, 0x01, 0x88, 0x09, 0x59, 0x92, 0x40,  // .....Y.@
                /* 0420 */  0x1C, 0xEF, 0xA8, 0x28, 0x23, 0xE7, 0x06, 0x83,  // ...(#...
                /* 0428 */  0x08, 0xC8, 0x71, 0xD7, 0x28, 0x20, 0x87, 0x07,  // ..q.( ..
                /* 0430 */  0x11, 0x90, 0xE3, 0xAF, 0x43, 0x40, 0x16, 0xA3,  // ....C@..
                /* 0438 */  0x03, 0x88, 0xFD, 0xFF, 0x01                     // .....
            })
        }

        Device (WFTE)
        {
            Name (_HID, "PNP0C14" /* Windows Management Instrumentation Device */)  // _HID: Hardware ID
            Name (_UID, "TestDev")  // _UID: Unique ID
            Name (_WDG, Buffer (0x28)
            {
                /* 0000 */  0x7F, 0xAB, 0x13, 0x1F, 0x20, 0x62, 0x10, 0x42,  // .... b.B
                /* 0008 */  0x8F, 0x8E, 0x8B, 0xB5, 0xE7, 0x1E, 0xE9, 0x69,  // .......i
                /* 0010 */  0x44, 0x45, 0x01, 0x02, 0x21, 0x12, 0x90, 0x05,  // DE..!...
                /* 0018 */  0x66, 0xD5, 0xD1, 0x11, 0xB2, 0xF0, 0x00, 0xA0,  // f.......
                /* 0020 */  0xC9, 0x06, 0x29, 0x10, 0x43, 0x43, 0x01, 0x00   // ..).CC..
            })
            Method (WMDE, 3, NotSerialized)
            {
                If ((Arg1 == One))
                {
                    CSSV = Arg2
                    Notify (WFDE, 0xD0) // Hardware-Specific
                    Return (CSSV) /* \_SB_.CSSV */
                }

                Return (Zero)
            }

            Name (WQCC, Buffer (0x02F1)
            {
                /* 0000 */  0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,  // FOMB....
                /* 0008 */  0xE1, 0x02, 0x00, 0x00, 0xC2, 0x06, 0x00, 0x00,  // ........
                /* 0010 */  0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,  // DS...}.T
                /* 0018 */  0xA8, 0x5D, 0x83, 0x00, 0x01, 0x06, 0x18, 0x42,  // .].....B
                /* 0020 */  0x20, 0x14, 0x03, 0x89, 0xC0, 0xA2, 0x69, 0x24,  //  .....i$
                /* 0028 */  0xC7, 0x01, 0x0C, 0x86, 0xCB, 0x72, 0x20, 0xE4,  // .....r .
                /* 0030 */  0x82, 0x89, 0x09, 0x10, 0x01, 0x21, 0xAF, 0x02,  // .....!..
                /* 0038 */  0x6C, 0x0A, 0x30, 0x09, 0xA2, 0xFE, 0xFD, 0x21,  // l.0....!
                /* 0040 */  0x4A, 0x82, 0x43, 0x09, 0x81, 0x90, 0x64, 0x01,  // J.C...d.
                /* 0048 */  0xE6, 0x05, 0xE8, 0x16, 0x60, 0x58, 0x80, 0x6D,  // ....`X.m
                /* 0050 */  0x01, 0xA6, 0x05, 0x38, 0x86, 0xA4, 0xD2, 0xC0,  // ...8....
                /* 0058 */  0x29, 0x81, 0xA5, 0x40, 0x48, 0xB8, 0x00, 0xE5,  // )..@H...
                /* 0060 */  0x02, 0x7C, 0x0B, 0xD0, 0x8E, 0x28, 0xDC, 0x96,  // .|...(..
                /* 0068 */  0x61, 0x44, 0xE0, 0x51, 0x44, 0xB6, 0x50, 0x34,  // aD.QD.P4
                /* 0070 */  0x0A, 0x8D, 0x1D, 0x86, 0x65, 0x82, 0x69, 0x10,  // ....e.i.
                /* 0078 */  0x87, 0x51, 0x36, 0xB2, 0x08, 0x3C, 0xA1, 0x4E,  // .Q6..<.N
                /* 0080 */  0x05, 0xC8, 0x15, 0x20, 0x4C, 0x80, 0x78, 0x54,  // ... L.xT
                /* 0088 */  0x61, 0x34, 0x07, 0x45, 0x20, 0x43, 0x63, 0xC4,  // a4.E Cc.
                /* 0090 */  0x40, 0x48, 0x22, 0xAC, 0x9C, 0x63, 0x6B, 0x14,  // @H"..ck.
                /* 0098 */  0xA7, 0x71, 0x34, 0xA5, 0x63, 0x68, 0x04, 0xC7,  // .q4.ch..
                /* 00A0 */  0x75, 0x40, 0x06, 0xE9, 0x7D, 0x3A, 0x44, 0xD0,  // u@..}:D.
                /* 00A8 */  0x84, 0x34, 0x8A, 0x68, 0x21, 0xA2, 0x04, 0x3D,  // .4.h!..=
                /* 00B0 */  0x8E, 0x20, 0x81, 0x23, 0x24, 0x30, 0xCC, 0x31,  // . .#$0.1
                /* 00B8 */  0x60, 0x64, 0x40, 0xC8, 0xB3, 0x00, 0xEB, 0x83,  // `d@.....
                /* 00C0 */  0x23, 0x04, 0x76, 0x2F, 0xC0, 0x98, 0x00, 0x8D,  // #.v/....
                /* 00C8 */  0x10, 0x72, 0x26, 0xC0, 0xA0, 0x00, 0x85, 0x02,  // .r&.....
                /* 00D0 */  0xBC, 0xC1, 0xC8, 0x96, 0x00, 0x6D, 0x02, 0x94,  // .....m..
                /* 00D8 */  0x21, 0x68, 0x4A, 0x51, 0x0E, 0x2A, 0x48, 0xB8,  // !hJQ.*H.
                /* 00E0 */  0x28, 0x16, 0x87, 0x26, 0x88, 0x16, 0x51, 0x08,  // (..&..Q.
                /* 00E8 */  0x68, 0x84, 0xD6, 0x60, 0x84, 0x1B, 0x2E, 0x46,  // h..`...F
                /* 00F0 */  0x84, 0x93, 0x8B, 0x1C, 0xA2, 0xFD, 0x41, 0x90,  // ......A.
                /* 00F8 */  0x68, 0x47, 0x01, 0x49, 0x00, 0x51, 0xA4, 0xD1,  // hG.I.Q..
                /* 0100 */  0xA0, 0x86, 0x9F, 0xE0, 0x71, 0xC0, 0x47, 0x81,  // ....q.G.
                /* 0108 */  0x93, 0x3B, 0xA9, 0x13, 0x33, 0xC8, 0x89, 0x1D,  // .;..3...
                /* 0110 */  0x5D, 0x9D, 0xE7, 0x00, 0x32, 0x62, 0x86, 0x95,  // ]...2b..
                /* 0118 */  0xE0, 0xD7, 0xC0, 0x07, 0x03, 0xBC, 0x6B, 0x40,  // ......k@
                /* 0120 */  0xDD, 0x08, 0x9E, 0x07, 0xD8, 0x30, 0xC3, 0x61,  // .....0.a
                /* 0128 */  0x86, 0xE8, 0xD1, 0x86, 0xFB, 0xFF, 0x9F, 0xC0,  // ........
                /* 0130 */  0x21, 0x32, 0x40, 0x0F, 0xED, 0x51, 0x00, 0xEB,  // !2@..Q..
                /* 0138 */  0x70, 0x32, 0x3A, 0x07, 0x94, 0x2A, 0xC0, 0xEC,  // p2:..*..
                /* 0140 */  0x99, 0x40, 0x33, 0x4B, 0x70, 0x3C, 0x3E, 0x00,  // .@3Kp<>.
                /* 0148 */  0x78, 0x3E, 0x27, 0x9C, 0xC0, 0xF2, 0x07, 0x81,  // x>'.....
                /* 0150 */  0x1A, 0x99, 0xA1, 0x3D, 0xE3, 0xD3, 0x7A, 0x0F,  // ...=..z.
                /* 0158 */  0xF0, 0xF1, 0xE0, 0xB0, 0x98, 0x58, 0x08, 0x29,  // .....X.)
                /* 0160 */  0x80, 0xD0, 0x78, 0xC0, 0xAF, 0xF8, 0x68, 0x20,  // ..x...h 
                /* 0168 */  0x84, 0x97, 0x05, 0xCF, 0xD7, 0x87, 0x04, 0x03,  // ........
                /* 0170 */  0x63, 0x07, 0x64, 0xBF, 0x02, 0x10, 0x82, 0xBF,  // c.d.....
                /* 0178 */  0x2E, 0x1C, 0xD1, 0x43, 0x43, 0x84, 0x04, 0x2F,  // ...CC../
                /* 0180 */  0x03, 0x47, 0x50, 0x29, 0xBE, 0xB0, 0x0E, 0x21,  // .GP)...!
                /* 0188 */  0x46, 0xA4, 0x18, 0x51, 0x82, 0xD4, 0x0A, 0xA1,  // F..Q....
                /* 0190 */  0xE9, 0x87, 0x49, 0x50, 0xE4, 0xC9, 0x01, 0x3D,  // ..IP...=
                /* 0198 */  0x02, 0x8E, 0x77, 0x02, 0xC7, 0x13, 0xD9, 0xE3,  // ..w.....
                /* 01A0 */  0x89, 0x72, 0x12, 0x07, 0xE4, 0x33, 0x85, 0x11,  // .r...3..
                /* 01A8 */  0x4E, 0xF3, 0x51, 0xE2, 0xD1, 0xC2, 0x9A, 0x67,  // N.Q....g
                /* 01B0 */  0xA4, 0x13, 0xC3, 0x39, 0xBD, 0x0D, 0x98, 0xA0,  // ...9....
                /* 01B8 */  0xB2, 0xE7, 0x80, 0x8E, 0x1F, 0x56, 0x05, 0x22,  // .....V."
                /* 01C0 */  0x1B, 0x4B, 0xF5, 0x39, 0x83, 0x6A, 0x5E, 0xAE,  // .K.9.j^.
                /* 01C8 */  0x46, 0x74, 0xCC, 0xC7, 0xEA, 0x11, 0x9C, 0xB4,  // Ft......
                /* 01D0 */  0xA7, 0x17, 0xD9, 0x4A, 0xC1, 0x04, 0xEC, 0x61,  // ...J...a
                /* 01D8 */  0x5B, 0x23, 0x85, 0xD4, 0xD0, 0x68, 0x3C, 0x06,  // [#...h<.
                /* 01E0 */  0x77, 0xFE, 0x13, 0x09, 0x05, 0x31, 0xA0, 0xC3,  // w....1..
                /* 01E8 */  0x41, 0xC8, 0xC9, 0x49, 0x00, 0xA5, 0x62, 0xBC,  // A..I..b.
                /* 01F0 */  0xE4, 0x68, 0xC1, 0x08, 0xA6, 0x81, 0xD0, 0xDD,  // .h......
                /* 01F8 */  0xC1, 0xF3, 0xF3, 0x3D, 0x80, 0xDF, 0x4C, 0x7C,  // ...=..L|
                /* 0200 */  0x32, 0x30, 0xB0, 0xEF, 0x13, 0x6F, 0x1C, 0xF0,  // 20...o..
                /* 0208 */  0xFF, 0xFF, 0x37, 0x0E, 0x36, 0x09, 0x8C, 0x9A,  // ..7.6...
                /* 0210 */  0x23, 0x04, 0x9D, 0x02, 0xBF, 0x00, 0xBC, 0x0A,  // #.......
                /* 0218 */  0x98, 0xC0, 0xBA, 0x2E, 0x06, 0xD0, 0x4F, 0x1D,  // ......O.
                /* 0220 */  0x1E, 0xA8, 0xAF, 0x1C, 0x67, 0x63, 0x7D, 0x07,  // ....gc}.
                /* 0228 */  0x03, 0x50, 0x00, 0xF9, 0x22, 0xE0, 0x93, 0xC1,  // .P.."...
                /* 0230 */  0xC3, 0x00, 0xBB, 0x19, 0x18, 0x26, 0x9A, 0xD1,  // .....&..
                /* 0238 */  0xB9, 0xA8, 0x69, 0xA3, 0x64, 0xC0, 0x68, 0xDA,  // ..i.d.h.
                /* 0240 */  0x06, 0xF1, 0xB4, 0x1D, 0x71, 0xDA, 0x68, 0x68,  // ....q.hh
                /* 0248 */  0x5F, 0x05, 0x7C, 0x11, 0x70, 0xA8, 0x61, 0xD3,  // _.|.p.a.
                /* 0250 */  0x3B, 0x07, 0x7E, 0xAE, 0x67, 0x16, 0xD0, 0x93,  // ;.~.g...
                /* 0258 */  0xF0, 0x91, 0xE4, 0xB8, 0xC1, 0x32, 0x0A, 0x06,  // .....2..
                /* 0260 */  0x1E, 0x24, 0x8E, 0x47, 0xC1, 0x26, 0xCE, 0x07,  // .$.G.&..
                /* 0268 */  0xE0, 0x89, 0xF3, 0x71, 0xF9, 0x86, 0x01, 0x7F,  // ...q....
                /* 0270 */  0xE4, 0x58, 0x82, 0x02, 0x67, 0x0E, 0x72, 0x78,  // .X..g.rx
                /* 0278 */  0x4C, 0xB0, 0x51, 0x51, 0x59, 0xE3, 0x42, 0x8D,  // L.QQY.B.
                /* 0280 */  0xD2, 0x57, 0x20, 0x86, 0x7D, 0x82, 0x16, 0x3D,  // .W .}..=
                /* 0288 */  0x48, 0x9D, 0x2F, 0x0E, 0xEA, 0x69, 0xC4, 0x63,  // H./..i.c
                /* 0290 */  0x33, 0xAC, 0xC7, 0xFD, 0xFF, 0x0F, 0x8B, 0x41,  // 3......A
                /* 0298 */  0x0B, 0x7B, 0xB8, 0x2F, 0x22, 0x3E, 0xC5, 0x78,  // .{./">.x
                /* 02A0 */  0x66, 0xC6, 0x08, 0xEB, 0xB1, 0x7B, 0x40, 0x8F,  // f....{@.
                /* 02A8 */  0x10, 0xE0, 0x01, 0x7B, 0x35, 0x39, 0xD3, 0x07,  // ...{59..
                /* 02B0 */  0x97, 0x3F, 0x8E, 0xEA, 0x20, 0x74, 0xDF, 0xE0,  // .?.. t..
                /* 02B8 */  0x28, 0x21, 0x1E, 0x38, 0x30, 0x04, 0x15, 0xDA,  // (!.80...
                /* 02C0 */  0xF4, 0xA9, 0xD1, 0xA8, 0x55, 0x83, 0x32, 0x35,  // ....U.25
                /* 02C8 */  0xCA, 0x34, 0xA8, 0xD5, 0xA7, 0x52, 0x63, 0xC6,  // .4...Rc.
                /* 02D0 */  0x3C, 0x5C, 0x8E, 0xE8, 0x41, 0x81, 0xBC, 0x13,  // <\..A...
                /* 02D8 */  0x34, 0x42, 0x87, 0x00, 0xA1, 0x42, 0x9E, 0x08,  // 4B...B..
                /* 02E0 */  0x32, 0x72, 0x0F, 0x31, 0x88, 0x80, 0xAC, 0xCC,  // 2r.1....
                /* 02E8 */  0x02, 0x10, 0xD3, 0x09, 0x22, 0x20, 0xFF, 0xFF,  // ...." ..
                /* 02F0 */  0x01                                             // .
            })
        }

        Method (USSV, 1, Serialized)
        {
            CSSV = Arg0
        }

        Method (GSSV, 0, Serialized)
        {
            Return (CSSV) /* \_SB_.CSSV */
        }
    }

    Scope (\)
    {
        OperationRegion (COMP, SystemMemory, 0x5AF78D18, 0x0200)
        Field (COMP, AnyAcc, Lock, Preserve)
        {
            IDMN,   16, 
            IDPC,   16, 
            BDDD,   8, 
            CPFB,   8, 
            PBTI,   8, 
            BRLV,   8, 
            CAVR,   8, 
            TJMA,   16, 
            CORE,   8, 
            CG12,   8, 
            CG13,   8, 
            CG14,   8, 
            CG15,   8, 
            CG16,   8, 
            CG17,   8, 
            CG18,   8, 
            CG19,   8, 
            CG20,   8, 
            CG21,   8, 
            CG22,   8, 
            CG23,   8, 
            CG24,   8, 
            CG25,   8, 
            CG26,   8, 
            CG27,   8, 
            CG28,   8, 
            CG29,   8, 
            CG30,   8, 
            CG31,   8, 
            SFNO,   16, 
            STDT,   16, 
            BFDT,   1024, 
            RSR1,   736, 
            IDFD,   1024, 
            ESMS,   8, 
            ESMB,   256, 
            RSR2,   752
        }

        OperationRegion (SMIO, SystemIO, 0xB0, 0x02)
        Field (SMIO, ByteAcc, NoLock, Preserve)
        {
            SMMC,   8, 
            SMMD,   8
        }
    }

    Scope (_SB.PCI0.LPC0)
    {
        Method (ECOK, 0, NotSerialized)
        {
            If ((^EC0.OKEC == One))
            {
                Return (One)
            }
            Else
            {
                Return (Zero)
            }
        }

        Device (EC0)
        {
            Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID
            Name (_GPE, 0x0B)  // _GPE: General Purpose Events
            Name (OKEC, One)
            Name (_CRS, Buffer (0x12)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x47, 0x01, 0x62, 0x00, 0x62, 0x00, 0x01, 0x01,  // G.b.b...
                /* 0008 */  0x47, 0x01, 0x66, 0x00, 0x66, 0x00, 0x01, 0x01,  // G.f.f...
                /* 0010 */  0x79, 0x00                                       // y.
            })
            Method (_REG, 2, NotSerialized)  // _REG: Region Availability
            {
                If ((Arg0 == 0x03))
                {
                    OKEC = Arg1
                    ECRD = One
                    If (MPMS)
                    {
                        MPMU = One
                    }
                    Else
                    {
                        MPMU = Zero
                    }

                    WA3F = Zero
                    NPST = 0x03
                    Notify (LID, 0x80) // Status Change
                }
            }

            Method (CMDW, 2, NotSerialized)
            {
                Name (TEMP, One)
                Name (RTEM, Zero)
                While (TEMP)
                {
                    ECPC = Zero
                    TEMP = ECPC /* \_SB_.PCI0.LPC0.EC0_.ECPC */
                }

                ECPC = One
                ECMB = Arg0
                EDTB = Arg1
                ECST = One
                TEMP = One
                While (TEMP)
                {
                    TEMP = ECST /* \_SB_.PCI0.LPC0.EC0_.ECST */
                }

                ECPC = Zero
            }

            OperationRegion (ECMP, SystemMemory, 0xFC7E0000, 0x1000)
            Field (ECMP, AnyAcc, Lock, Preserve)
            {
                Offset (0x24E), 
                BATP,   8, 
                Offset (0x250), 
                VER1,   8, 
                VER2,   8, 
                RSV1,   8, 
                RSV2,   8, 
                CCI0,   8, 
                CCI1,   8, 
                CCI2,   8, 
                CCI3,   8, 
                CTL0,   8, 
                CTL1,   8, 
                CTL2,   8, 
                CTL3,   8, 
                CTL4,   8, 
                CTL5,   8, 
                CTL6,   8, 
                CTL7,   8, 
                MGI0,   8, 
                MGI1,   8, 
                MGI2,   8, 
                MGI3,   8, 
                MGI4,   8, 
                MGI5,   8, 
                MGI6,   8, 
                MGI7,   8, 
                MGI8,   8, 
                MGI9,   8, 
                MGIA,   8, 
                MGIB,   8, 
                MGIC,   8, 
                MGID,   8, 
                MGIE,   8, 
                MGIF,   8, 
                MGO0,   8, 
                MGO1,   8, 
                MGO2,   8, 
                MGO3,   8, 
                MGO4,   8, 
                MGO5,   8, 
                MGO6,   8, 
                MGO7,   8, 
                MGO8,   8, 
                MGO9,   8, 
                MGOA,   8, 
                MGOB,   8, 
                MGOC,   8, 
                MGOD,   8, 
                MGOE,   8, 
                MGOF,   8, 
                Offset (0x6F8), 
                    ,   2, 
                PWDR,   1, 
                    ,   3, 
                INBG,   1, 
                Offset (0x6F9), 
                Offset (0x800), 
                REC1,   8, 
                REC2,   8, 
                WEC1,   8, 
                WEC2,   8, 
                WMIM,   8, 
                ACKM,   1, 
                Offset (0x806), 
                    ,   1, 
                    ,   1, 
                NGPS,   1, 
                DGPE,   1, 
                ENG6,   1, 
                RG12,   1, 
                Offset (0x807), 
                Offset (0x808), 
                Z01R,   8, 
                Z01G,   8, 
                Z01B,   8, 
                Z02R,   8, 
                Z02G,   8, 
                Z02B,   8, 
                SADP,   8, 
                FANE,   1, 
                CPUO,   1, 
                M4GO,   1, 
                FNSW,   1, 
                SBTC,   1, 
                VGAP,   1, 
                WPFM,   1, 
                EHP1,   1, 
                SAD2,   8, 
                FRPM,   8, 
                FNMX,   8, 
                FNMN,   8, 
                FWPM,   8, 
                RSTV,   8, 
                CPTV,   8, 
                GPTV,   8, 
                PHTV,   8, 
                FNTV,   8, 
                BTTV,   8, 
                HDTV,   8, 
                    ,   3, 
                SK6U,   1, 
                    ,   2, 
                FNHK,   1, 
                Offset (0x81D), 
                Z04R,   8, 
                Z04G,   8, 
                Offset (0x821), 
                BTNO,   8, 
                Offset (0x823), 
                DTCL,   3, 
                Offset (0x825), 
                CFBE,   1, 
                EPCF,   1, 
                Offset (0x826), 
                Z03R,   8, 
                TCAS,   2, 
                TCS2,   2, 
                Offset (0x828), 
                Z03G,   8, 
                Z03B,   8, 
                PBSM,   2, 
                SBSM,   2, 
                Offset (0x82B), 
                    ,   2, 
                    ,   1, 
                LCDR,   1, 
                EDPW,   1, 
                    ,   1, 
                    ,   1, 
                Offset (0x82C), 
                PRIC,   8, 
                BCTL,   128, 
                Offset (0x84D), 
                PENS,   72, 
                Offset (0x857), 
                Z04B,   8, 
                Offset (0x85C), 
                WACL,   1, 
                AADT,   1, 
                Offset (0x85D), 
                ENSI,   8, 
                ENSB,   8, 
                ENSD,   8, 
                SMBP,   8, 
                SMBS,   5, 
                    ,   1, 
                SMAL,   1, 
                SMDN,   1, 
                SMAR,   8, 
                SMCD,   8, 
                SMDA,   256, 
                SMBC,   8, 
                SALA,   8, 
                SAD0,   8, 
                SAD1,   8, 
                SBNS,   8, 
                STPM,   8, 
                FPPT,   8, 
                SPPT,   8, 
                SAPU,   8, 
                ASTG,   8, 
                Offset (0x88F), 
                    ,   1, 
                    ,   1, 
                OGHM,   1, 
                Offset (0x8AE), 
                CPTR,   8, 
                Offset (0x8B4), 
                GPTP,   8, 
                PHTP,   8, 
                Offset (0x8D7), 
                BTTP,   8, 
                Offset (0x8DC), 
                    ,   2, 
                SBIS,   1, 
                Offset (0x8FA), 
                PP3T,   8, 
                Offset (0x8FF), 
                SUPL,   8, 
                Offset (0xAC3), 
                    ,   3, 
                GBTC,   1, 
                Offset (0xBB0), 
                Offset (0xBBC), 
                Offset (0xBC0), 
                Offset (0xBC2), 
                PRTM,   16, 
                Offset (0xD82), 
                ECPC,   1, 
                ECST,   1, 
                Offset (0xD8B), 
                ECMB,   8, 
                EDTB,   8, 
                Offset (0xD8E)
            }

            OperationRegion (ECMM, SystemMemory, 0xFC7E0000, 0x1000)
            Field (ECMM, AnyAcc, Lock, Preserve)
            {
                Offset (0x800), 
                Offset (0x81F), 
                    ,   2, 
                MPMU,   1, 
                Offset (0x820), 
                Offset (0x827), 
                DGPW,   1, 
                Offset (0x845), 
                ATTE,   16, 
                RTTE,   16, 
                BTDC,   32, 
                MXER,   8, 
                ATTF,   16, 
                BTVI,   16, 
                NMMD,   1, 
                BLMD,   1, 
                PTMD,   1, 
                Offset (0x853), 
                Offset (0x857), 
                Offset (0x858), 
                ABES,   1, 
                ABEA,   1, 
                SNST,   1, 
                MSSA,   1, 
                MSST,   1, 
                Offset (0x859), 
                BMNE,   16, 
                Offset (0x88E), 
                HSPS,   8, 
                WAAC,   1, 
                WADC,   1, 
                    ,   5, 
                F6FL,   1, 
                BMFN,   72, 
                BATD,   56, 
                AATL,   1, 
                AACL,   1, 
                AAST,   1, 
                AARW,   1, 
                AAEN,   1, 
                    ,   1, 
                WKRN,   1, 
                Offset (0x8A1), 
                    ,   1, 
                VIDO,   1, 
                TOUP,   1, 
                Offset (0x8A2), 
                ODTS,   8, 
                OSTY,   4, 
                WMIS,   1, 
                    ,   1, 
                ECRD,   1, 
                ADPT,   1, 
                PWAK,   1, 
                MDWK,   1, 
                LWAK,   1, 
                RWAK,   1, 
                WWAK,   1, 
                UWAK,   1, 
                KWAK,   1, 
                TPWK,   1, 
                CCAC,   1, 
                AOAC,   1, 
                BLAC,   1, 
                PSRC,   1, 
                BOAC,   1, 
                LCAC,   1, 
                AAAC,   1, 
                ACAC,   1, 
                S3ST,   1, 
                S3RM,   1, 
                S4ST,   1, 
                S4RM,   1, 
                S5ST,   1, 
                S5RM,   1, 
                CSST,   1, 
                CSRM,   1, 
                CATT,   8, 
                VATT,   8, 
                THLT,   8, 
                TCNL,   8, 
                MODE,   1, 
                    ,   2, 
                INIT,   1, 
                FAN1,   1, 
                FAN2,   1, 
                FANT,   1, 
                SKNM,   1, 
                SDTM,   8, 
                FSSN,   4, 
                FANU,   4, 
                PCVL,   6, 
                SWTO,   1, 
                TTHR,   1, 
                TTHM,   1, 
                THTL,   1, 
                CTDP,   1, 
                NPST,   5, 
                CTMP,   8, 
                CTML,   8, 
                EST3,   8, 
                SKTB,   8, 
                SKTC,   8, 
                Offset (0x8B6), 
                EST1,   8, 
                EST2,   8, 
                    ,   1, 
                LIDF,   1, 
                PMEE,   1, 
                PWBE,   1, 
                RNGE,   1, 
                BTWE,   1, 
                Offset (0x8B9), 
                BRTS,   8, 
                S35M,   1, 
                S35S,   1, 
                    ,   2, 
                FFEN,   1, 
                FFST,   1, 
                Offset (0x8BB), 
                WLAT,   1, 
                BTAT,   1, 
                WLEX,   1, 
                BTEX,   1, 
                KLSW,   1, 
                WLOK,   1, 
                AT3G,   1, 
                EX3G,   1, 
                PJID,   8, 
                CPUJ,   3, 
                CPNM,   3, 
                GATY,   2, 
                BOL0,   1, 
                BOL1,   1, 
                    ,   2, 
                BCC0,   1, 
                BCC1,   1, 
                Offset (0x8BF), 
                BPU0,   1, 
                BPU1,   1, 
                    ,   2, 
                BOS0,   1, 
                BOS1,   1, 
                Offset (0x8C0), 
                BTY0,   1, 
                BAM0,   1, 
                BAL0,   1, 
                    ,   1, 
                BMF0,   4, 
                BST0,   8, 
                BRC0,   16, 
                BSN0,   16, 
                BPV0,   16, 
                BDV0,   16, 
                BDC0,   16, 
                BFC0,   16, 
                GAU0,   8, 
                BAT0,   8, 
                BPC0,   16, 
                BAC0,   16, 
                BCG0,   16, 
                BFCB,   16, 
                BTPP,   16, 
                BCT0,   8, 
                BCI0,   8, 
                BCM0,   8, 
                BOT0,   8, 
                BSSB,   16, 
                BOV0,   8, 
                BCF0,   8, 
                BAD0,   8, 
                BCV1,   16, 
                BCV2,   16, 
                BCV3,   16, 
                BCV4,   16, 
                Offset (0x8F1), 
                    ,   6, 
                ORRF,   1, 
                Offset (0x8F6), 
                BACV,   16, 
                BDN0,   8, 
                Offset (0x8FB), 
                BMD0,   16, 
                CYC0,   8, 
                CYC1,   8, 
                Offset (0x900)
            }

            OperationRegion (ERAM, EmbeddedControl, Zero, 0xFF)
            Field (ERAM, ByteAcc, Lock, Preserve)
            {
                Offset (0x01), 
                Offset (0x02), 
                Offset (0x03), 
                Offset (0x60), 
                SMPR,   8, 
                SMST,   8, 
                SMAD,   8, 
                SMCM,   8, 
                SMD0,   256, 
                BCNT,   8, 
                SMAA,   24, 
                SMBN,   8, 
                Offset (0x8A)
            }

            OperationRegion (ECPR, EmbeddedControl, Zero, 0xFF)
            Field (ECPR, ByteAcc, Lock, Preserve)
            {
                Offset (0x1C), 
                CPBC,   8, 
                Offset (0x2A), 
                    ,   6, 
                BMNC,   1, 
                BCLC,   1, 
                Offset (0x2D), 
                Offset (0x5A), 
                BMN9,   16, 
                Offset (0x64), 
                SMDR,   8, 
                Offset (0x90), 
                BMNN,   72, 
                BDVN,   56, 
                Offset (0xEB), 
                MUAC,   16, 
                Offset (0xF1), 
                    ,   6, 
                OSRF,   1
            }

            OperationRegion (CCLK, SystemIO, 0x1810, 0x04)
            Field (CCLK, DWordAcc, NoLock, Preserve)
            {
                    ,   1, 
                DUTY,   3, 
                THEN,   1, 
                Offset (0x01), 
                FTT,    1, 
                    ,   8, 
                TSTS,   1
            }

            OperationRegion (ECRM, EmbeddedControl, Zero, 0xFF)
            Field (ECRM, ByteAcc, Lock, Preserve)
            {
                Offset (0x5D), 
                ERIB,   16, 
                ERBD,   8, 
                Offset (0xAA), 
                Offset (0xAB), 
                Offset (0xAD), 
                    ,   4, 
                Offset (0xAE), 
                PTVL,   4, 
                Offset (0xB0), 
                Offset (0xB1), 
                Offset (0xB2), 
                Offset (0xB3), 
                Offset (0xB4), 
                Offset (0xB5), 
                Offset (0xBC), 
                Offset (0xBD)
            }

            Method (FANG, 1, NotSerialized)
            {
                Local0 = EIDR (Arg0)
                Return (Local0)
            }

            Method (FANW, 2, NotSerialized)
            {
                EIDW (Arg0, Arg1)
                Return (Arg1)
            }

            Method (TUVR, 1, NotSerialized)
            {
                Return (0x05)
            }

            Method (THRO, 1, NotSerialized)
            {
                ATHR (Arg0)
            }

            Method (CLCK, 1, NotSerialized)
            {
                Return (Zero)
            }

            Method (PCLK, 0, NotSerialized)
            {
                APCL ()
            }

            Method (ATHR, 1, NotSerialized)
            {
                If ((Arg0 == Zero))
                {
                    Return (0xFF)
                }
                ElseIf ((Arg0 == One))
                {
                    Return (\_PR.C000._PPC) /* External reference */
                }
                ElseIf ((Arg0 == 0x02))
                {
                    Return (TTHR) /* \_SB_.PCI0.LPC0.EC0_.TTHR */
                }
                Else
                {
                    Return (0xFF)
                }
            }

            Method (APCL, 0, NotSerialized)
            {
                Local0 = PCVL /* \_SB_.PCI0.LPC0.EC0_.PCVL */
                If (CondRefOf (\_PR.C000))
                {
                    \_PR.C000.PPCV = Local0
                    Notify (\_PR.C000, 0x80) // Status Change
                }

                If (CondRefOf (\_PR.C001))
                {
                    \_PR.C001.PPCV = Local0
                    Notify (\_PR.C001, 0x80) // Status Change
                }

                If (CondRefOf (\_PR.C002))
                {
                    \_PR.C002.PPCV = Local0
                    Notify (\_PR.C002, 0x80) // Status Change
                }

                If (CondRefOf (\_PR.C003))
                {
                    \_PR.C003.PPCV = Local0
                    Notify (\_PR.C003, 0x80) // Status Change
                }

                If (CondRefOf (\_PR.C004))
                {
                    \_PR.C004.PPCV = Local0
                    Notify (\_PR.C004, 0x80) // Status Change
                }

                If (CondRefOf (\_PR.C005))
                {
                    \_PR.C005.PPCV = Local0
                    Notify (\_PR.C005, 0x80) // Status Change
                }

                If (CondRefOf (\_PR.C006))
                {
                    \_PR.C006.PPCV = Local0
                    Notify (\_PR.C006, 0x80) // Status Change
                }

                If (CondRefOf (\_PR.C007))
                {
                    \_PR.C007.PPCV = Local0
                    Notify (\_PR.C007, 0x80) // Status Change
                }
            }

            Name (CFWV, "00.00.13")
            Name (CTSL, Package (0x10)
            {
                0x11, 
                0x12, 
                0x13, 
                0x14, 
                0x15, 
                0x16, 
                0x60, 
                0x61, 
                0x62, 
                0x63, 
                0x64, 
                0x20, 
                0x21, 
                0x22, 
                0x26, 
                0x17
            })
            Mutex (CFMX, 0x00)
            Method (CFUN, 4, Serialized)
            {
                Name (ESRC, 0x05)
                Name (FUNN, Zero)
                STDT = Zero
                BFDT = Zero
                FUNN = DerefOf (Arg0 [Zero])
                Switch (FUNN)
                {
                    Case (0x10)
                    {
                        If ((DerefOf (Arg1 [Zero]) == One))
                        {
                            CreateByteField (Arg2, Zero, CAPV)
                            CAVR = CAPV /* \_SB_.PCI0.LPC0.EC0_.CFUN.CAPV */
                            STDT = One
                        }
                        ElseIf ((DerefOf (Arg1 [Zero]) == 0x02))
                        {
                            STDT = One
                            BFDT = CFWV /* \_SB_.PCI0.LPC0.EC0_.CFWV */
                        }
                        ElseIf ((DerefOf (Arg1 [Zero]) == 0x04))
                        {
                            Acquire (CFMX, 0xFFFF)
                            SMMD = Arg0
                            SFNO = Arg1
                            BFDT = Arg2
                            SMMC = 0xCE
                            Release (CFMX)
                        }
                        Else
                        {
                            STDT = Zero
                        }
                    }
                    Case (0x15)
                    {
                        CreateWordField (Arg1, Zero, SFUN)
                        Switch (SFUN)
                        {
                            Case (0x9001)
                            {
                            }
                            Case (0x9002)
                            {
                                STDT = Zero
                                BFDT = Zero
                                BFDT = Zero
                                STDT = One
                            }
                            Case (0x9000)
                            {
                                ESMC (Arg2)
                                If ((ESMS != 0xFF))
                                {
                                    Local1 = Buffer (0x80){}
                                    Local1 [Zero] = 0x80
                                    Local1 [One] = ESMS /* External reference */
                                    Local3 = ESMB /* External reference */
                                    Local1 [0x02] = DerefOf (Local3 [Zero])
                                    Local1 [0x03] = DerefOf (Local3 [One])
                                    Local1 [0x04] = DerefOf (Local3 [0x02])
                                    Local1 [0x05] = DerefOf (Local3 [0x03])
                                    Local1 [0x06] = DerefOf (Local3 [0x04])
                                    Local1 [0x07] = DerefOf (Local3 [0x05])
                                    Local1 [0x08] = DerefOf (Local3 [0x06])
                                    Local1 [0x09] = DerefOf (Local3 [0x07])
                                    Local1 [0x0A] = DerefOf (Local3 [0x08])
                                    Local1 [0x0B] = DerefOf (Local3 [0x09])
                                    Local1 [0x0C] = DerefOf (Local3 [0x0A])
                                    Local1 [0x0D] = DerefOf (Local3 [0x0B])
                                    Local1 [0x0E] = DerefOf (Local3 [0x0C])
                                    Local1 [0x0F] = DerefOf (Local3 [0x0D])
                                    Local1 [0x10] = DerefOf (Local3 [0x0E])
                                    Local1 [0x11] = DerefOf (Local3 [0x0F])
                                    Local1 [0x12] = DerefOf (Local3 [0x10])
                                    Local1 [0x13] = DerefOf (Local3 [0x11])
                                    Local1 [0x14] = DerefOf (Local3 [0x12])
                                    Local1 [0x15] = DerefOf (Local3 [0x13])
                                    Local1 [0x16] = DerefOf (Local3 [0x14])
                                    Local1 [0x17] = DerefOf (Local3 [0x15])
                                    Local1 [0x18] = DerefOf (Local3 [0x16])
                                    Local1 [0x19] = DerefOf (Local3 [0x17])
                                    Local1 [0x1A] = DerefOf (Local3 [0x18])
                                    Local1 [0x1B] = DerefOf (Local3 [0x19])
                                    Local1 [0x1C] = DerefOf (Local3 [0x1A])
                                    Local1 [0x1D] = DerefOf (Local3 [0x1B])
                                    Local1 [0x1E] = DerefOf (Local3 [0x1C])
                                    Local1 [0x1F] = DerefOf (Local3 [0x1D])
                                    Local1 [0x20] = DerefOf (Local3 [0x1E])
                                    Local1 [0x21] = DerefOf (Local3 [0x1F])
                                    BFDT = Local1
                                    STDT = One
                                }
                                Else
                                {
                                    STDT = 0x8000
                                }
                            }
                            Default
                            {
                                Acquire (CFMX, 0xFFFF)
                                SMMD = Arg0
                                SFNO = Arg1
                                BFDT = Arg2
                                SMMC = 0xCE
                                Release (CFMX)
                            }

                        }
                    }
                    Case (0x27)
                    {
                        If ((DerefOf (Arg1 [Zero]) == One))
                        {
                            STDT = Zero
                            BFDT = Zero
                        }
                        ElseIf ((DerefOf (Arg1 [Zero]) == 0x02))
                        {
                            STDT = Zero
                            BFDT = Zero
                            BFDT = Zero
                            STDT = One
                        }
                        Else
                        {
                            STDT = Zero
                        }
                    }
                    Case (0x18)
                    {
                        Acquire (CFMX, 0xFFFF)
                        If ((DerefOf (Arg1 [Zero]) == 0x02))
                        {
                            SMDA = Zero
                            SMAR = DerefOf (Arg2 [One])
                            SMCD = DerefOf (Arg2 [0x02])
                            SBNS = DerefOf (Arg2 [0x03])
                            Local4 = DerefOf (Arg2 [0x04])
                            Local5 = Zero
                            SMBC = Local4
                            If ((Local4 != Zero))
                            {
                                Local1 = SMDA /* \_SB_.PCI0.LPC0.EC0_.SMDA */
                                While (~(Local4 == Local5))
                                {
                                    Local1 [Local5] = DerefOf (Arg2 [(0x05 + Local5)]
                                        )
                                    Local5 += One
                                }

                                SMDA = Local1
                            }

                            SMPR = DerefOf (Arg2 [Zero])
                            While ((~(ESRC == Zero) && !SMDN))
                            {
                                Sleep (0x14)
                                ESRC -= One
                            }

                            Local2 = SMDN /* \_SB_.PCI0.LPC0.EC0_.SMDN */
                            If (SMDN)
                            {
                                Local1 = Buffer (0x80){}
                                Local2 = (SMDN << 0x07)
                                Local6 = (SMAL << 0x06)
                                Local7 = SMBS /* \_SB_.PCI0.LPC0.EC0_.SMBS */
                                Local2 |= Local6
                                Local2 |= Local7
                                Local1 [Zero] = Local2
                                If (((SMDN == One) && (SMBS == Zero)))
                                {
                                    P80H = 0xC4
                                    Local1 [One] = SMBC /* \_SB_.PCI0.LPC0.EC0_.SMBC */
                                    Local3 = SMDA /* \_SB_.PCI0.LPC0.EC0_.SMDA */
                                    Local1 [0x02] = DerefOf (Local3 [Zero])
                                    Local1 [0x03] = DerefOf (Local3 [One])
                                    Local1 [0x04] = DerefOf (Local3 [0x02])
                                    Local1 [0x05] = DerefOf (Local3 [0x03])
                                    Local1 [0x06] = DerefOf (Local3 [0x04])
                                    Local1 [0x07] = DerefOf (Local3 [0x05])
                                    Local1 [0x08] = DerefOf (Local3 [0x06])
                                    Local1 [0x09] = DerefOf (Local3 [0x07])
                                    Local1 [0x0A] = DerefOf (Local3 [0x08])
                                    Local1 [0x0B] = DerefOf (Local3 [0x09])
                                    Local1 [0x0C] = DerefOf (Local3 [0x0A])
                                    Local1 [0x0D] = DerefOf (Local3 [0x0B])
                                    Local1 [0x0E] = DerefOf (Local3 [0x0C])
                                    Local1 [0x0F] = DerefOf (Local3 [0x0D])
                                    Local1 [0x10] = DerefOf (Local3 [0x0E])
                                    Local1 [0x11] = DerefOf (Local3 [0x0F])
                                    Local1 [0x12] = DerefOf (Local3 [0x10])
                                    Local1 [0x13] = DerefOf (Local3 [0x11])
                                    Local1 [0x14] = DerefOf (Local3 [0x12])
                                    Local1 [0x15] = DerefOf (Local3 [0x13])
                                    Local1 [0x16] = DerefOf (Local3 [0x14])
                                    Local1 [0x17] = DerefOf (Local3 [0x15])
                                    Local1 [0x18] = DerefOf (Local3 [0x16])
                                    Local1 [0x19] = DerefOf (Local3 [0x17])
                                    Local1 [0x1A] = DerefOf (Local3 [0x18])
                                    Local1 [0x1B] = DerefOf (Local3 [0x19])
                                    Local1 [0x1C] = DerefOf (Local3 [0x1A])
                                    Local1 [0x1D] = DerefOf (Local3 [0x1B])
                                    Local1 [0x1E] = DerefOf (Local3 [0x1C])
                                    Local1 [0x1F] = DerefOf (Local3 [0x1D])
                                    Local1 [0x20] = DerefOf (Local3 [0x1E])
                                    Local1 [0x21] = DerefOf (Local3 [0x1F])
                                    BFDT = Local1
                                    STDT = One
                                }
                                Else
                                {
                                    P80H = 0xC6
                                    STDT = 0x8000
                                }
                            }
                            Else
                            {
                                P80H = 0xC5
                                STDT = Zero
                            }

                            Release (CFMX)
                        }
                    }
                    Default
                    {
                        If ((Match (CTSL, MEQ, DerefOf (Arg0 [Zero]), MTR, 
                            Zero, Zero) != Ones))
                        {
                            Acquire (CFMX, 0xFFFF)
                            SMMD = Arg0
                            SFNO = Arg1
                            BFDT = Arg2
                            SMMC = 0xCE
                            Release (CFMX)
                        }
                        Else
                        {
                            STDT = 0x8000
                        }
                    }

                }
            }

            Name (OCSL, Package (0x09)
            {
                0x80, 
                0x81, 
                0x82, 
                0x83, 
                0x84, 
                0x85, 
                0x86, 
                0x92, 
                0x93
            })
            Mutex (PFMX, 0x00)
            Method (PFUN, 4, Serialized)
            {
                Acquire (PFMX, 0xFFFF)
                SMMD = Arg0
                SFNO = Arg1
                BFDT = Arg2
                SMMC = 0xCF
                Release (PFMX)
            }

            Method (CMFC, 4, Serialized)
            {
                Name (RTVL, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                If ((ObjectType (Arg0) == One))
                {
                    RTVL [Zero] = 0x8000
                }
                ElseIf ((DerefOf (Arg0 [Zero]) < 0xFE))
                {
                    Local1 = Buffer (0x82){}
                    CreateWordField (Local1, Zero, RTST)
                    CreateField (Local1, 0x10, 0x0400, RTDT)
                    If ((ToInteger (Arg0) <= 0x7F))
                    {
                        CFUN (Arg0, Arg1, Arg2, Arg3)
                    }
                    Else
                    {
                        PFUN (Arg0, Arg1, Arg2, Arg3)
                    }

                    RTST = STDT /* \STDT */
                    RTDT = BFDT /* \BFDT */
                    Return (Local1)
                }
                Else
                {
                    RTVL [Zero] = 0x8000
                }

                Return (RTVL) /* \_SB_.PCI0.LPC0.EC0_.CMFC.RTVL */
            }

            Mutex (FAMX, 0x00)
            Method (EIDR, 1, Serialized)
            {
                Acquire (FAMX, 0xFFFF)
                ERIB = Arg0
                Local0 = ERRD (0x5F)
                Release (FAMX)
                Return (Local0)
            }

            Method (EIDW, 2, Serialized)
            {
                Acquire (FAMX, 0xFFFF)
                ERIB = Arg0
                ERWT (0x5F, Arg1)
                Release (FAMX)
            }

            OperationRegion (ECCD, SystemMemory, 0xFC7E0000, 0x1000)
            Field (ECCD, AnyAcc, Lock, Preserve)
            {
                Offset (0xD80), 
                Offset (0xD82), 
                ECTB,   1, 
                ECTE,   1, 
                Offset (0xD83), 
                ERN1,   8, 
                ERN2,   8, 
                ERN3,   8, 
                ERN4,   8, 
                ERN5,   8, 
                ERN6,   8, 
                ERN7,   8, 
                ERN8,   8, 
                ECMD,   8, 
                EDT1,   8, 
                EDT2,   8, 
                EDT3,   8, 
                EDT4,   8, 
                EDT5,   8, 
                    ,   1
            }

            Method (ERWT, 2, Serialized)
            {
                Local0 = Buffer (0x08){}
                Local0 [Zero] = 0xB1
                Local0 [One] = Arg0
                Local0 [0x02] = Arg1
                ERCD (Local0)
            }

            Method (ERRD, 1, Serialized)
            {
                Local0 = Buffer (0x08){}
                Local0 [Zero] = 0xB0
                Local0 [One] = Arg0
                Local0 = ERCD (Local0)
                Local1 = DerefOf (Local0 [Zero])
                Return (Local1)
            }

            Mutex (CSMX, 0x00)
            Method (ERCD, 1, Serialized)
            {
                Acquire (CSMX, 0xFFFF)
                Name (ESRC, 0x64)
                ECTB = One
                ECMD = DerefOf (Arg0 [Zero])
                EDT1 = DerefOf (Arg0 [One])
                EDT2 = DerefOf (Arg0 [0x02])
                EDT3 = DerefOf (Arg0 [0x03])
                EDT4 = DerefOf (Arg0 [0x04])
                EDT5 = DerefOf (Arg0 [0x05])
                ECTE = One
                While (((ESRC != Zero) && (ECTE != Zero)))
                {
                    Sleep (0x0A)
                    ESRC -= One
                }

                Local0 = Buffer (0x08){}
                Local0 [Zero] = ERN1 /* \_SB_.PCI0.LPC0.EC0_.ERN1 */
                Local0 [One] = ERN2 /* \_SB_.PCI0.LPC0.EC0_.ERN2 */
                Local0 [0x02] = ERN3 /* \_SB_.PCI0.LPC0.EC0_.ERN3 */
                Local0 [0x03] = ERN4 /* \_SB_.PCI0.LPC0.EC0_.ERN4 */
                Local0 [0x04] = ERN5 /* \_SB_.PCI0.LPC0.EC0_.ERN5 */
                Local0 [0x05] = ERN6 /* \_SB_.PCI0.LPC0.EC0_.ERN6 */
                Local0 [0x06] = ERN7 /* \_SB_.PCI0.LPC0.EC0_.ERN7 */
                Local0 [0x07] = ERN8 /* \_SB_.PCI0.LPC0.EC0_.ERN8 */
                ECTB = Zero
                Release (CSMX)
                Return (Local0)
            }

            Method (SBAT, 2, NotSerialized)
            {
                Local0 = Buffer (0x08){}
                Local0 [Zero] = Arg0
                Local0 [One] = 0x16
                Local0 [0x02] = Arg1
                Local0 [0x03] = Zero
                Local0 [0x04] = Zero
                ESMC (Local0)
            }

            Method (SBA2, 2, NotSerialized)
            {
                Local0 = Buffer (0x08){}
                Local0 [Zero] = Arg0
                Local0 [One] = 0x36
                Local0 [0x02] = Arg1
                Local0 [0x03] = Zero
                Local0 [0x04] = Zero
                ESMC (Local0)
            }

            Mutex (ESCX, 0x00)
            Method (ESMC, 1, NotSerialized)
            {
                Acquire (ESCX, 0xFFFF)
                Name (ESRC, 0x05)
                SMDA = Zero
                SMAR = DerefOf (Arg0 [One])
                SMCD = DerefOf (Arg0 [0x02])
                SBNS = DerefOf (Arg0 [0x03])
                Local4 = DerefOf (Arg0 [0x04])
                Local5 = Zero
                SMBC = Local4
                If ((Local4 != Zero))
                {
                    Local1 = SMDA /* \_SB_.PCI0.LPC0.EC0_.SMDA */
                    While (~(Local4 == Local5))
                    {
                        Local1 [Local5] = DerefOf (Arg0 [(0x05 + Local5)]
                            )
                        Local5 += One
                    }

                    SMDA = Local1
                }

                SMPR = DerefOf (Arg0 [Zero])
                While ((~(ESRC == Zero) && !SMDN))
                {
                    Sleep (0x14)
                    ESRC -= One
                }

                If (((SMDN == One) && (SMBS == Zero)))
                {
                    ESMB = SMDA /* \_SB_.PCI0.LPC0.EC0_.SMDA */
                    ESMS = SMBC /* \_SB_.PCI0.LPC0.EC0_.SMBC */
                }
                Else
                {
                    Debug = "====== Sent EC SMBus command time out. ======"
                    ESMS = 0xFF
                }

                Release (ESCX)
            }
        }

        Scope (EC0)
        {
            Method (BSHK, 0, NotSerialized)
            {
                If (ECOK ())
                {
                    Local1 = One
                    If ((OSYS == 0x07D1))
                    {
                        Local1 = Zero
                    }

                    If ((OSYS == 0x07D2))
                    {
                        Local1 = Zero
                    }

                    If ((OSYS == 0x07D6))
                    {
                        Local1 = One
                    }

                    If ((OSYS == 0x03E8))
                    {
                        Local1 = 0x02
                    }

                    If ((OSYS == 0x07D9))
                    {
                        Local1 = 0x03
                    }

                    If ((OSYS == 0x07DC))
                    {
                        Local1 = 0x04
                    }

                    If ((OSYS == 0x07DD))
                    {
                        Local1 = 0x05
                    }

                    If ((OSYS == 0x07DF))
                    {
                        Local1 = 0x06
                    }

                    Sleep (0x14)
                    OSTY = Local1
                    Sleep (0x14)
                }
            }
        }

        Device (BAT1)
        {
            Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB, 
            })
            Name (BMDL, Zero)
            Name (BASC, One)
            Name (BFFW, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                ^^EC0.BSHK ()
                If (ECOK ())
                {
                    If (^^EC0.BOL0)
                    {
                        Sleep (Zero)
                        Return (0x1F)
                    }
                    Else
                    {
                        Sleep (Zero)
                        Return (0x0F)
                    }
                }
                Else
                {
                    Sleep (Zero)
                    Return (0x1F)
                }
            }

            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                Return (BIFX (Zero))
            }

            Method (_BIX, 0, NotSerialized)  // _BIX: Battery Information Extended
            {
                Return (BIFX (One))
            }

            Method (BIFX, 1, NotSerialized)
            {
                Name (STAX, Package (0x14)
                {
                    Zero, 
                    One, 
                    0x1770, 
                    0x1770, 
                    One, 
                    0x2A30, 
                    0x0258, 
                    0xB4, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x0108, 
                    0x0EC4, 
                    "PABAS0241231", 
                    "41167", 
                    "LION", 
                    "Hewlett-Packard"
                })
                Name (STAF, Package (0x0D)
                {
                    One, 
                    0x1770, 
                    0x1770, 
                    One, 
                    0x2A30, 
                    0x0258, 
                    0xB4, 
                    0x0108, 
                    0x0EC4, 
                    "PABAS0241231", 
                    "41167", 
                    "LION", 
                    "Hewlett-Packard"
                })
                If (ECOK ())
                {
                    BFFW = ^^EC0.ORRF /* \_SB_.PCI0.LPC0.EC0_.ORRF */
                    If ((^^EC0.BAM0 == Zero))
                    {
                        BASC = 0x0A
                    }

                    STAX [One] = ^^EC0.BAM0 /* \_SB_.PCI0.LPC0.EC0_.BAM0 */
                    Local0 = ^^EC0.BDN0 /* \_SB_.PCI0.LPC0.EC0_.BDN0 */
                    BMDL = Local0
                    STAX [0x02] = (^^EC0.BDC0 * BASC)
                    Sleep (Zero)
                    STAX [0x05] = ^^EC0.BDV0 /* \_SB_.PCI0.LPC0.EC0_.BDV0 */
                    Sleep (Zero)
                    If ((BFFW == One))
                    {
                        Local2 = ^^EC0.BFCB /* \_SB_.PCI0.LPC0.EC0_.BFCB */
                    }
                    Else
                    {
                        Local2 = ^^EC0.BFC0 /* \_SB_.PCI0.LPC0.EC0_.BFC0 */
                    }

                    Local2 = (Local2 * BASC)
                    Sleep (Zero)
                    STAX [0x03] = Local2
                    Divide (Local2, 0x64, Local0, Local1)
                    Local1 *= 0x05
                    STAX [0x06] = Local1
                    Divide (Local2, 0x64, Local0, Local1)
                    Local1 *= 0x03
                    STAX [0x07] = Local1
                    STAF [Zero] = DerefOf (STAX [One])
                    STAF [One] = DerefOf (STAX [0x02])
                    STAF [0x02] = DerefOf (STAX [0x03])
                    STAF [0x03] = DerefOf (STAX [0x04])
                    STAF [0x04] = DerefOf (STAX [0x05])
                    STAF [0x05] = DerefOf (STAX [0x06])
                    STAF [0x06] = DerefOf (STAX [0x07])
                    STAF [0x07] = DerefOf (STAX [0x0E])
                    STAF [0x08] = DerefOf (STAX [0x0F])
                    STAF [0x09] = DerefOf (STAX [0x10])
                    STAF [0x0A] = DerefOf (STAX [0x11])
                    STAF [0x0B] = DerefOf (STAX [0x12])
                    STAF [0x0C] = DerefOf (STAX [0x13])
                    If ((Arg0 == One))
                    {
                        Return (STAX) /* \_SB_.PCI0.LPC0.BAT1.BIFX.STAX */
                    }
                    Else
                    {
                        Return (STAF) /* \_SB_.PCI0.LPC0.BAT1.BIFX.STAF */
                    }
                }
            }

            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                Name (PBST, Package (0x04)
                {
                    Zero, 
                    0xFFFFFFFF, 
                    0xFFFFFFFF, 
                    0x1770
                })
                If (ECOK ())
                {
                    PBST [Zero] = ^^EC0.BST0 /* \_SB_.PCI0.LPC0.EC0_.BST0 */
                    Sleep (Zero)
                    If ((^^EC0.BAC0 >> 0x0F))
                    {
                        Local4 = ((~^^EC0.BAC0 & 0xFFFF) + One)
                    }
                    Else
                    {
                        Local4 = ^^EC0.BAC0 /* \_SB_.PCI0.LPC0.EC0_.BAC0 */
                    }

                    If ((^^EC0.BAM0 == Zero))
                    {
                        Local4 = ((Local4 * ^^EC0.BPV0) / 0x03E8)
                    }

                    If ((^^^^WMID.BRTE == Zero))
                    {
                        PBST [One] = 0xFFFFFFFF
                    }
                    Else
                    {
                        PBST [One] = Local4
                    }

                    Sleep (Zero)
                    PBST [0x02] = (^^EC0.BRC0 * BASC)
                    Sleep (Zero)
                    PBST [0x03] = ^^EC0.BPV0 /* \_SB_.PCI0.LPC0.EC0_.BPV0 */
                    Sleep (Zero)
                    If ((^^EC0.BDN0 != BMDL))
                    {
                        Notify (BAT1, 0x81) // Information Change
                    }
                }

                Return (PBST) /* \_SB_.PCI0.LPC0.BAT1._BST.PBST */
            }

            Method (_BTP, 1, NotSerialized)  // _BTP: Battery Trip Point
            {
                Local0 = (Arg0 / BASC)
                ^^EC0.BTPP = Local0
            }
        }

        Device (ACAD)
        {
            Name (_HID, "ACPI0003" /* Power Source Device */)  // _HID: Hardware ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB, 
            })
            Name (XX00, Buffer (0x03){})
            Name (ACDC, 0xFF)
            Mutex (RTCL, 0x00)
            Method (_PSR, 0, Serialized)  // _PSR: Power Source
            {
                Acquire (RTCL, 0xFFFF)
                Local0 = ^^EC0.ADPT /* \_SB_.PCI0.LPC0.EC0_.ADPT */
                CreateWordField (XX00, Zero, SSZE)
                CreateByteField (XX00, 0x02, ACST)
                SSZE = 0x03
                If ((Local0 != ACDC))
                {
                    If (Local0)
                    {
                        P80H = 0xAC
                        If (IGDS)
                        {
                            AFN4 (One)
                        }

                        ACST = Zero
                    }
                    Else
                    {
                        P80H = 0xDC
                        If (IGDS)
                        {
                            AFN4 (0x02)
                        }

                        ACST = One
                    }

                    ALIB (One, XX00)
                    ACDC = Local0
                }

                Return (Local0)
                Release (RTCL)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Scope (RTC)
        {
            OperationRegion (RCM0, SystemCMOS, Zero, 0x10)
            Field (RCM0, ByteAcc, NoLock, Preserve)
            {
                AccessAs (ByteAcc, 0x00), 
                RTCS,   8, 
                Offset (0x02), 
                RTCM,   8, 
                Offset (0x04), 
                RTCH,   8, 
                Offset (0x06), 
                RTCW,   8, 
                RTCD,   8
            }
        }
    }

    Scope (_TZ)
    {
        ThermalZone (TSZ0)
        {
            Name (REGN, "Processor Thermal Zone")
            Method (FMAX, 0, NotSerialized)
            {
                Return ((\_SB.PCI0.LPC0.EC0.FNMX * 0x64))
            }

            Method (FMIN, 0, NotSerialized)
            {
                Return ((\_SB.PCI0.LPC0.EC0.FNMN * 0x64))
            }

            Method (FRSP, 0, NotSerialized)
            {
                Return ((\_SB.PCI0.LPC0.EC0.FRPM * 0x64))
            }

            Method (FSSP, 1, NotSerialized)
            {
                \_SB.PCI0.LPC0.EC0.FNSW = One
                \_SB.PCI0.LPC0.EC0.FWPM = (!Arg0 & One)
                \_SB.PCI0.LPC0.EC0.FNSW = Zero
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Return (0x1388)
            }

            Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
            {
                Return (0x0F16)
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                If ((\_SB.PCI0.LPC0.EC0.CTMP > CMST))
                {
                    CMST = \_SB.PCI0.LPC0.EC0.CTMP
                }

                Return ((0x0AAC + (\_SB.PCI0.LPC0.EC0.CTMP * 0x0A)))
            }
        }

        ThermalZone (TSZ2)
        {
            Name (BOTP, Zero)
            Name (TZTP, Zero)
            Name (FFVO, Zero)
            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                Local1 = (FFAL | PDPN)
                Local2 = (TZTP | BOTP)
                Local3 = (TZTP | FFVO)
                If (((Local1 || Local2) || Local3))
                {
                    TZTP = Zero
                    BOTP = Zero
                    FFVO = Zero
                    Return (0x0E30)
                }
                Else
                {
                    Return (0x0B74)
                    TZTP = Zero
                    BOTP = Zero
                }
            }
        }
    }

    Scope (_SB.PCI0.LPC0.EC0)
    {
        OperationRegion (DBG1, SystemIO, 0xB0, 0x02)
        Field (DBG1, WordAcc, NoLock, Preserve)
        {
            PB0,    8, 
            PB1,    8
        }

        Method (_Q11, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P80H = 0x11
            If ((GPHM == 0x02))
            {
                Notify (^^^GPP0.PEGP.LCD0, 0x87) // Device-Specific
            }
            Else
            {
                Notify (^^^GP17.VGA.LCD, 0x87) // Device-Specific
            }
        }

        Method (_Q12, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P80H = 0x12
            If ((GPHM == 0x02))
            {
                Notify (^^^GPP0.PEGP.LCD0, 0x86) // Device-Specific
            }
            Else
            {
                Notify (^^^GP17.VGA.LCD, 0x86) // Device-Specific
            }
        }

        Method (_Q13, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P80H = 0x13
            If (ECON)
            {
                Notify (\_TZ.TSZ0, 0x80) // Thermal Status Change
            }
        }

        Method (_Q15, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P80H = 0x15
            Notify (LID, 0x80) // Status Change
        }

        Method (_Q1D, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P80H = 0x1D
            PCLK ()
        }

        Method (_Q1E, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P80H = 0x1E
            ^^^GPP0.VGA.AFN2 (DTCL, 0x02)
        }

        Method (_Q21, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P80H = 0x21
            Debug = "=====QUERY_21====="
            UCEV ()
        }

        Method (_Q24, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P80H = 0x24
            Debug = "=====QUERY_24====="
            Sleep (0x03E8)
            Notify (BAT1, 0x80) // Status Change
        }

        Method (_Q25, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P80H = 0x25
            Debug = "=====QUERY_25====="
            Sleep (0x03E8)
            Notify (BAT1, 0x81) // Information Change
            Sleep (0x03E8)
            Notify (BAT1, 0x80) // Status Change
        }

        Method (_Q27, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P80H = 0x26
            Local0 = (CPBC & 0x80)
            If ((Local0 == 0x80))
            {
                PB1 = 0x48
                PB0 = 0xC7
            }
            Else
            {
                PB1 = 0x49
                PB0 = 0xC7
            }
        }

        Method (_Q28, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P80H = 0x28
            ^^^^WMID.WEI1 = 0x04
            ^^^^WMID.WED1 = Zero
            Notify (WMID, 0x80) // Status Change
        }

        Method (_Q29, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Debug = "=====PROJECT_QUERY_29====="
            P80H = 0x29
            ^^^^WMID.WEI1 = 0x1D
            ^^^^WMID.WED1 = 0x21A5
            Notify (WMID, 0x80) // Status Change
        }

        Method (_Q2A, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Debug = "=====PROJECT_QUERY_2A====="
            P80H = 0x2A
            ^^^^WMID.WEI1 = 0x04
            ^^^^WMID.WED1 = Zero
            Notify (WMID, 0x80) // Status Change
        }

        Method (_Q2B, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P80H = 0x2B
            DPTC (0x05, (SUPL * 0x03E8))
            DPTC (0x06, (FPPT * 0x03E8))
            DPTC (0x07, (SPPT * 0x03E8))
            DPTC (0x32, (PP3T * 0x03E8))
        }

        Method (_Q2C, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
        }

        Method (_Q2F, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Debug = "=====PROJECT_QUERY_2F====="
            P80H = 0x2F
            If ((NGPS == Zero))
            {
                P80H = 0x48
                Notify (^^^GPP0.PEGP, 0xD1) // Hardware-Specific
            }
            Else
            {
                P80H = 0x49
                Local0 = (DTCL + 0xD1)
                Notify (^^^GPP0.PEGP, Local0)
            }
        }

        Method (_Q37, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P80H = 0x37
            Debug = "=====QUERY_37====="
            Notify (ACAD, 0x80) // Status Change
            Sleep (0x03E8)
            Notify (BAT1, 0x80) // Status Change
            ^^^^WMID.WEI1 = 0x03
            ^^^^WMID.WED1 = Zero
            Notify (WMID, 0x80) // Status Change
            If (ADPT)
            {
                ^^^^NPCF.DTGP = One
                Notify (NPCF, 0xC0) // Hardware-Specific
            }

            PWRS = One
        }

        Method (_Q38, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            ^^^^NPCF.DTGP = Zero
            Notify (NPCF, 0xC0) // Hardware-Specific
        }

        Method (_Q39, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            ^^^^NPCF.DTGP = One
            Notify (NPCF, 0xC0) // Hardware-Specific
        }

        Method (_Q40, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P80H = 0x40
            If ((((OSYS == 0x07DC) || (OSYS == 0x07DD)) || (OSYS == 0x07DF))){}
            Else
            {
            }
        }

        Method (_Q41, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Debug = "=====PROJECT_QUERY_41====="
            P80H = 0x41
            Local0 = Buffer (0x08){}
            Local0 = ERCD (Package (0x06)
                    {
                        0x45, 
                        0xA0, 
                        0x02, 
                        Zero, 
                        Zero, 
                        Zero
                    })
            If ((DerefOf (Local0 [Zero]) > Zero))
            {
                ^^^^WMID.WEI1 = 0x0D
                ^^^^WMID.WED1 = 0x02
                Notify (WMID, 0x80) // Status Change
            }
            Else
            {
                ^^^^WMID.WEI1 = 0x0D
                ^^^^WMID.WED1 = Zero
                Notify (WMID, 0x80) // Status Change
            }
        }

        Method (_Q44, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P80H = 0x44
            If (ECON)
            {
                THSD = One
                \_TZ.TSZ2.BOTP = One
                Notify (\_TZ.TSZ2, 0x80) // Thermal Status Change
            }
        }

        Method (_Q45, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P80H = 0x45
            Debug = "=====QUERY_45====="
            If (ECON)
            {
                PDPN = One
                Notify (\_TZ.TSZ2, 0x80) // Thermal Status Change
            }
        }

        Method (_Q49, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P80H = 0x49
            If (ECON)
            {
                CMDW (0x45, 0x45)
                QE49 = 0x49
                \_TZ.TSZ2.TZTP = One
                Notify (\_TZ.TSZ2, 0x80) // Thermal Status Change
            }
        }

        Method (_Q4A, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Debug = "=====QUERY_4A====="
            P80H = 0x4A
            ^^^^WMID.WEI1 = 0x00020001
            ^^^^WMID.WED1 = Zero
            Notify (WMID, 0x80) // Status Change
        }

        Method (_Q4B, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P80H = 0x4B
            ECSF = One
            CFBE = One
        }

        Method (_Q4D, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P80H = 0x4D
            Debug = "=====QUERY_4D====="
            If (BMNC)
            {
                ^^^^WMID.WEI1 = 0x16
                ^^^^WMID.WED1 = One
                Notify (WMID, 0x80) // Status Change
            }

            If (BCLC)
            {
                ^^^^WMID.WEI1 = 0x16
                ^^^^WMID.WED1 = One
                Notify (WMID, 0x80) // Status Change
            }
        }

        Method (_Q4E, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P80H = 0x4E
            If (ECON)
            {
                \_TZ.TSZ2.FFVO = One
                Notify (\_TZ.TSZ2, 0x80) // Thermal Status Change
            }
        }

        Method (_Q54, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Debug = "=====PROJECT_QUERY_54====="
            P80H = 0x54
            ^^^^WMID.WEI1 = 0x1D
            ^^^^WMID.WED1 = 0x21A7
            Notify (WMID, 0x80) // Status Change
        }
    }

    Scope (_SB)
    {
        Device (UBTC)
        {
            Name (_HID, EisaId ("USBC000"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0CA0"))  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_DDN, "USB Type C")  // _DDN: DOS Device Name
            Name (_ADR, Zero)  // _ADR: Address
            Name (CRS, Buffer (0x0E)
            {
                /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x10, 0x00, 0x00, 0x79, 0x00               // ....y.
            })
            Device (CR01)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Name (PLDC, Package (0x01)
                {
                    Buffer (0x14)
                    {
                        /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0008 */  0x11, 0x0C, 0x80, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                        /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                    }
                })
                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (PLDC) /* \_SB_.UBTC.CR01.PLDC */
                }
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                CreateDWordField (CRS, 0x04, CBAS)
                CBAS = UBCB /* \UBCB */
                Return (CRS) /* \_SB_.UBTC.CRS_ */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            OperationRegion (USBC, SystemMemory, UBCB, 0x38)
            Field (USBC, ByteAcc, Lock, Preserve)
            {
                VER1,   8, 
                VER2,   8, 
                RSV1,   8, 
                RSV2,   8, 
                CCI0,   8, 
                CCI1,   8, 
                CCI2,   8, 
                CCI3,   8, 
                CTL0,   8, 
                CTL1,   8, 
                CTL2,   8, 
                CTL3,   8, 
                CTL4,   8, 
                CTL5,   8, 
                CTL6,   8, 
                CTL7,   8, 
                MGI0,   8, 
                MGI1,   8, 
                MGI2,   8, 
                MGI3,   8, 
                MGI4,   8, 
                MGI5,   8, 
                MGI6,   8, 
                MGI7,   8, 
                MGI8,   8, 
                MGI9,   8, 
                MGIA,   8, 
                MGIB,   8, 
                MGIC,   8, 
                MGID,   8, 
                MGIE,   8, 
                MGIF,   8, 
                MGO0,   8, 
                MGO1,   8, 
                MGO2,   8, 
                MGO3,   8, 
                MGO4,   8, 
                MGO5,   8, 
                MGO6,   8, 
                MGO7,   8, 
                MGO8,   8, 
                MGO9,   8, 
                MGOA,   8, 
                MGOB,   8, 
                MGOC,   8, 
                MGOD,   8, 
                MGOE,   8, 
                MGOF,   8
            }

            Mutex (UBSY, 0x00)
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("6f8398c2-7ca4-11e4-ad36-631042b5008f") /* Unknown UUID */))
                {
                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            Return (Buffer (One)
                            {
                                 0x0F                                             // .
                            })
                        }
                        Case (One)
                        {
                            Acquire (UBSY, 0xFFFF)
                            ^^PCI0.LPC0.EC0.MGO0 = MGO0 /* \_SB_.UBTC.MGO0 */
                            ^^PCI0.LPC0.EC0.MGO1 = MGO1 /* \_SB_.UBTC.MGO1 */
                            ^^PCI0.LPC0.EC0.MGO2 = MGO2 /* \_SB_.UBTC.MGO2 */
                            ^^PCI0.LPC0.EC0.MGO3 = MGO3 /* \_SB_.UBTC.MGO3 */
                            ^^PCI0.LPC0.EC0.MGO4 = MGO4 /* \_SB_.UBTC.MGO4 */
                            ^^PCI0.LPC0.EC0.MGO5 = MGO5 /* \_SB_.UBTC.MGO5 */
                            ^^PCI0.LPC0.EC0.MGO6 = MGO6 /* \_SB_.UBTC.MGO6 */
                            ^^PCI0.LPC0.EC0.MGO7 = MGO7 /* \_SB_.UBTC.MGO7 */
                            ^^PCI0.LPC0.EC0.MGO8 = MGO8 /* \_SB_.UBTC.MGO8 */
                            ^^PCI0.LPC0.EC0.MGO9 = MGO9 /* \_SB_.UBTC.MGO9 */
                            ^^PCI0.LPC0.EC0.MGOA = MGOA /* \_SB_.UBTC.MGOA */
                            ^^PCI0.LPC0.EC0.MGOB = MGOB /* \_SB_.UBTC.MGOB */
                            ^^PCI0.LPC0.EC0.MGOC = MGOC /* \_SB_.UBTC.MGOC */
                            ^^PCI0.LPC0.EC0.MGOD = MGOD /* \_SB_.UBTC.MGOD */
                            ^^PCI0.LPC0.EC0.MGOE = MGOE /* \_SB_.UBTC.MGOE */
                            ^^PCI0.LPC0.EC0.MGOF = MGOF /* \_SB_.UBTC.MGOF */
                            ^^PCI0.LPC0.EC0.CTL0 = CTL0 /* \_SB_.UBTC.CTL0 */
                            ^^PCI0.LPC0.EC0.CTL1 = CTL1 /* \_SB_.UBTC.CTL1 */
                            ^^PCI0.LPC0.EC0.CTL2 = CTL2 /* \_SB_.UBTC.CTL2 */
                            ^^PCI0.LPC0.EC0.CTL3 = CTL3 /* \_SB_.UBTC.CTL3 */
                            ^^PCI0.LPC0.EC0.CTL4 = CTL4 /* \_SB_.UBTC.CTL4 */
                            ^^PCI0.LPC0.EC0.CTL5 = CTL5 /* \_SB_.UBTC.CTL5 */
                            ^^PCI0.LPC0.EC0.CTL6 = CTL6 /* \_SB_.UBTC.CTL6 */
                            ^^PCI0.LPC0.EC0.CTL7 = CTL7 /* \_SB_.UBTC.CTL7 */
                            MBGS ("UCSI write")
                            ^^PCI0.LPC0.EC0.CMDW (0x59, 0xB1)
                            Release (UBSY)
                        }
                        Case (0x02)
                        {
                            MGI0 = ^^PCI0.LPC0.EC0.MGI0 /* \_SB_.PCI0.LPC0.EC0_.MGI0 */
                            MGI1 = ^^PCI0.LPC0.EC0.MGI1 /* \_SB_.PCI0.LPC0.EC0_.MGI1 */
                            MGI2 = ^^PCI0.LPC0.EC0.MGI2 /* \_SB_.PCI0.LPC0.EC0_.MGI2 */
                            MGI3 = ^^PCI0.LPC0.EC0.MGI3 /* \_SB_.PCI0.LPC0.EC0_.MGI3 */
                            MGI4 = ^^PCI0.LPC0.EC0.MGI4 /* \_SB_.PCI0.LPC0.EC0_.MGI4 */
                            MGI5 = ^^PCI0.LPC0.EC0.MGI5 /* \_SB_.PCI0.LPC0.EC0_.MGI5 */
                            MGI6 = ^^PCI0.LPC0.EC0.MGI6 /* \_SB_.PCI0.LPC0.EC0_.MGI6 */
                            MGI7 = ^^PCI0.LPC0.EC0.MGI7 /* \_SB_.PCI0.LPC0.EC0_.MGI7 */
                            MGI8 = ^^PCI0.LPC0.EC0.MGI8 /* \_SB_.PCI0.LPC0.EC0_.MGI8 */
                            MGI9 = ^^PCI0.LPC0.EC0.MGI9 /* \_SB_.PCI0.LPC0.EC0_.MGI9 */
                            MGIA = ^^PCI0.LPC0.EC0.MGIA /* \_SB_.PCI0.LPC0.EC0_.MGIA */
                            MGIB = ^^PCI0.LPC0.EC0.MGIB /* \_SB_.PCI0.LPC0.EC0_.MGIB */
                            MGIC = ^^PCI0.LPC0.EC0.MGIC /* \_SB_.PCI0.LPC0.EC0_.MGIC */
                            MGID = ^^PCI0.LPC0.EC0.MGID /* \_SB_.PCI0.LPC0.EC0_.MGID */
                            MGIE = ^^PCI0.LPC0.EC0.MGIE /* \_SB_.PCI0.LPC0.EC0_.MGIE */
                            MGIF = ^^PCI0.LPC0.EC0.MGIF /* \_SB_.PCI0.LPC0.EC0_.MGIF */
                            CCI0 = ^^PCI0.LPC0.EC0.CCI0 /* \_SB_.PCI0.LPC0.EC0_.CCI0 */
                            CCI1 = ^^PCI0.LPC0.EC0.CCI1 /* \_SB_.PCI0.LPC0.EC0_.CCI1 */
                            CCI2 = ^^PCI0.LPC0.EC0.CCI2 /* \_SB_.PCI0.LPC0.EC0_.CCI2 */
                            CCI3 = ^^PCI0.LPC0.EC0.CCI3 /* \_SB_.PCI0.LPC0.EC0_.CCI3 */
                            MBGS ("UCSI read")
                        }

                    }
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }

        Method (UCEV, 0, Serialized)
        {
            ^UBTC.MGI0 = ^PCI0.LPC0.EC0.MGI0 /* \_SB_.PCI0.LPC0.EC0_.MGI0 */
            ^UBTC.MGI1 = ^PCI0.LPC0.EC0.MGI1 /* \_SB_.PCI0.LPC0.EC0_.MGI1 */
            ^UBTC.MGI2 = ^PCI0.LPC0.EC0.MGI2 /* \_SB_.PCI0.LPC0.EC0_.MGI2 */
            ^UBTC.MGI3 = ^PCI0.LPC0.EC0.MGI3 /* \_SB_.PCI0.LPC0.EC0_.MGI3 */
            ^UBTC.MGI4 = ^PCI0.LPC0.EC0.MGI4 /* \_SB_.PCI0.LPC0.EC0_.MGI4 */
            ^UBTC.MGI5 = ^PCI0.LPC0.EC0.MGI5 /* \_SB_.PCI0.LPC0.EC0_.MGI5 */
            ^UBTC.MGI6 = ^PCI0.LPC0.EC0.MGI6 /* \_SB_.PCI0.LPC0.EC0_.MGI6 */
            ^UBTC.MGI7 = ^PCI0.LPC0.EC0.MGI7 /* \_SB_.PCI0.LPC0.EC0_.MGI7 */
            ^UBTC.MGI8 = ^PCI0.LPC0.EC0.MGI8 /* \_SB_.PCI0.LPC0.EC0_.MGI8 */
            ^UBTC.MGI9 = ^PCI0.LPC0.EC0.MGI9 /* \_SB_.PCI0.LPC0.EC0_.MGI9 */
            ^UBTC.MGIA = ^PCI0.LPC0.EC0.MGIA /* \_SB_.PCI0.LPC0.EC0_.MGIA */
            ^UBTC.MGIB = ^PCI0.LPC0.EC0.MGIB /* \_SB_.PCI0.LPC0.EC0_.MGIB */
            ^UBTC.MGIC = ^PCI0.LPC0.EC0.MGIC /* \_SB_.PCI0.LPC0.EC0_.MGIC */
            ^UBTC.MGID = ^PCI0.LPC0.EC0.MGID /* \_SB_.PCI0.LPC0.EC0_.MGID */
            ^UBTC.MGIE = ^PCI0.LPC0.EC0.MGIE /* \_SB_.PCI0.LPC0.EC0_.MGIE */
            ^UBTC.MGIF = ^PCI0.LPC0.EC0.MGIF /* \_SB_.PCI0.LPC0.EC0_.MGIF */
            ^UBTC.CCI0 = ^PCI0.LPC0.EC0.CCI0 /* \_SB_.PCI0.LPC0.EC0_.CCI0 */
            ^UBTC.CCI1 = ^PCI0.LPC0.EC0.CCI1 /* \_SB_.PCI0.LPC0.EC0_.CCI1 */
            ^UBTC.CCI2 = ^PCI0.LPC0.EC0.CCI2 /* \_SB_.PCI0.LPC0.EC0_.CCI2 */
            ^UBTC.CCI3 = ^PCI0.LPC0.EC0.CCI3 /* \_SB_.PCI0.LPC0.EC0_.CCI3 */
            MBGS ("UCSI event")
            Notify (UBTC, 0x80) // Status Change
        }
    }

    Method (BRTN, 0, NotSerialized)
    {
        Name (ABRT, Buffer (0x0100)
        {
            /* 0000 */  0x1C, 0x00, 0x00, 0x00, 0x00, 0x64, 0x32, 0x0F,  // .....d2.
            /* 0008 */  0xFF, 0x09, 0x0A, 0x19, 0x14, 0x33, 0x1E, 0x4C,  // .....3.L
            /* 0010 */  0x28, 0x66, 0x32, 0x7F, 0x3C, 0x99, 0x46, 0xB2,  // (f2.<.F.
            /* 0018 */  0x50, 0xCC, 0x5A, 0xE5                           // P.Z.
        })
        Name (ABR0, Buffer (0x0100)
        {
            /* 0000 */  0x1C, 0x00, 0x00, 0x00, 0x00, 0x64, 0x32, 0x0C,  // .....d2.
            /* 0008 */  0xFF, 0x09, 0x0A, 0x11, 0x14, 0x19, 0x1E, 0x23,  // .......#
            /* 0010 */  0x28, 0x30, 0x32, 0x4C, 0x3C, 0x63, 0x46, 0x7C,  // (02L<cF|
            /* 0018 */  0x50, 0x96, 0x5A, 0xBF                           // P.Z.
        })
        Name (ABR1, Buffer (0x0100)
        {
            /* 0000 */  0x1C, 0x00, 0x00, 0x00, 0x00, 0x64, 0x32, 0x0F,  // .....d2.
            /* 0008 */  0xFF, 0x09, 0x0A, 0x14, 0x14, 0x1C, 0x1E, 0x26,  // .......&
            /* 0010 */  0x28, 0x35, 0x32, 0x4F, 0x3C, 0x68, 0x46, 0x82,  // (52O<hF.
            /* 0018 */  0x50, 0x9B, 0x5A, 0xC9                           // P.Z.
        })
        Name (ABR2, Buffer (0x0100)
        {
            /* 0000 */  0x1C, 0x00, 0x00, 0x00, 0x00, 0x64, 0x32, 0x0C,  // .....d2.
            /* 0008 */  0xFF, 0x09, 0x0A, 0x11, 0x14, 0x19, 0x1E, 0x28,  // .......(
            /* 0010 */  0x28, 0x3A, 0x32, 0x51, 0x3C, 0x66, 0x46, 0x7C,  // (:2Q<fF|
            /* 0018 */  0x50, 0x93, 0x5A, 0xBC                           // P.Z.
        })
        Name (ABR3, Buffer (0x0100)
        {
            /* 0000 */  0x1C, 0x00, 0x00, 0x00, 0x00, 0x64, 0x32, 0x0F,  // .....d2.
            /* 0008 */  0xFF, 0x09, 0x0A, 0x14, 0x14, 0x1C, 0x1E, 0x26,  // .......&
            /* 0010 */  0x28, 0x35, 0x32, 0x4F, 0x3C, 0x68, 0x46, 0x82,  // (52O<hF.
            /* 0018 */  0x50, 0x9B, 0x5A, 0xC6                           // P.Z.
        })
        Name (ABR4, Buffer (0x0100)
        {
            /* 0000 */  0x1C, 0x00, 0x00, 0x00, 0x00, 0x64, 0x32, 0x0A,  // .....d2.
            /* 0008 */  0xFF, 0x09, 0x0A, 0x0F, 0x14, 0x14, 0x1E, 0x1C,  // ........
            /* 0010 */  0x28, 0x26, 0x32, 0x3A, 0x3C, 0x4F, 0x46, 0x60,  // (&2:<OF`
            /* 0018 */  0x50, 0x75, 0x5A, 0x96                           // PuZ.
        })
        Name (ABR5, Buffer (0x0100)
        {
            /* 0000 */  0x1C, 0x00, 0x00, 0x00, 0x00, 0x64, 0x32, 0x0A,  // .....d2.
            /* 0008 */  0xFF, 0x09, 0x0A, 0x0F, 0x14, 0x16, 0x1E, 0x1E,  // ........
            /* 0010 */  0x28, 0x33, 0x32, 0x42, 0x3C, 0x5B, 0x46, 0x72,  // (32B<[Fr
            /* 0018 */  0x50, 0x89, 0x5A, 0xB2                           // P.Z.
        })
        Name (ABR6, Buffer (0x0100)
        {
            /* 0000 */  0x1C, 0x00, 0x00, 0x00, 0x00, 0x64, 0x32, 0x0A,  // .....d2.
            /* 0008 */  0xFF, 0x09, 0x0A, 0x0F, 0x14, 0x16, 0x1E, 0x1E,  // ........
            /* 0010 */  0x28, 0x2D, 0x32, 0x3D, 0x3C, 0x4F, 0x46, 0x5E,  // (-2=<OF^
            /* 0018 */  0x50, 0x6D, 0x5A, 0x8E                           // PmZ.
        })
        Name (ABR7, Buffer (0x0100)
        {
            /* 0000 */  0x1C, 0x00, 0x00, 0x00, 0x00, 0x64, 0x32, 0x0F,  // .....d2.
            /* 0008 */  0xFF, 0x09, 0x0A, 0x14, 0x14, 0x1C, 0x1E, 0x26,  // .......&
            /* 0010 */  0x28, 0x35, 0x32, 0x4F, 0x3C, 0x68, 0x46, 0x82,  // (52O<hF.
            /* 0018 */  0x50, 0x9B, 0x5A, 0xC9                           // P.Z.
        })
        Name (ABR8, Buffer (0x0100)
        {
            /* 0000 */  0x1C, 0x00, 0x00, 0x00, 0x00, 0x64, 0x32, 0x0C,  // .....d2.
            /* 0008 */  0xFF, 0x09, 0x0A, 0x11, 0x14, 0x19, 0x1E, 0x21,  // .......!
            /* 0010 */  0x28, 0x30, 0x32, 0x47, 0x3C, 0x5E, 0x46, 0x77,  // (02G<^Fw
            /* 0018 */  0x50, 0x8E, 0x5A, 0xB7                           // P.Z.
        })
        Name (ABR9, Buffer (0x0100)
        {
            /* 0000 */  0x1C, 0x00, 0x00, 0x00, 0x00, 0x64, 0x32, 0x0C,  // .....d2.
            /* 0008 */  0xFF, 0x09, 0x0A, 0x11, 0x14, 0x1C, 0x1E, 0x21,  // .......!
            /* 0010 */  0x28, 0x30, 0x32, 0x47, 0x3C, 0x60, 0x46, 0x7A,  // (02G<`Fz
            /* 0018 */  0x50, 0x91, 0x5A, 0xBC                           // P.Z.
        })
        Name (ABRA, Buffer (0x0100)
        {
            /* 0000 */  0x1C, 0x00, 0x00, 0x00, 0x00, 0x64, 0x32, 0x0F,  // .....d2.
            /* 0008 */  0xFF, 0x09, 0x0A, 0x14, 0x14, 0x1C, 0x1E, 0x26,  // .......&
            /* 0010 */  0x28, 0x38, 0x32, 0x54, 0x3C, 0x70, 0x46, 0x89,  // (82T<pF.
            /* 0018 */  0x50, 0xA3, 0x5A, 0xD3                           // P.Z.
        })
        Name (ABRB, Buffer (0x0100)
        {
            /* 0000 */  0x1C, 0x00, 0x00, 0x00, 0x00, 0x64, 0x32, 0x0C,  // .....d2.
            /* 0008 */  0xFF, 0x09, 0x0A, 0x11, 0x14, 0x16, 0x1E, 0x21,  // .......!
            /* 0010 */  0x28, 0x2D, 0x32, 0x44, 0x3C, 0x5B, 0x46, 0x75,  // (-2D<[Fu
            /* 0018 */  0x50, 0x84, 0x5A, 0xB2                           // P.Z.
        })
        Name (ABRC, Buffer (0x0100)
        {
            /* 0000 */  0x1C, 0x00, 0x00, 0x00, 0x00, 0x64, 0x32, 0x0A,  // .....d2.
            /* 0008 */  0xFF, 0x09, 0x0A, 0x0F, 0x14, 0x14, 0x1E, 0x1C,  // ........
            /* 0010 */  0x28, 0x26, 0x32, 0x3A, 0x3C, 0x4C, 0x46, 0x5E,  // (&2:<LF^
            /* 0018 */  0x50, 0x72, 0x5A, 0x93                           // PrZ.
        })
        OperationRegion (CDFT, SystemMemory, M133, 0x0200)
        Field (CDFT, DWordAcc, NoLock, Preserve)
        {
            Offset (0xD4), 
            ATIF,   2048
        }

        If (((IDMN == 0xE430) && (IDPC == 0x076D)))
        {
            ATIF = ABR0 /* \BRTN.ABR0 */
        }
        ElseIf (((IDMN == 0xAE0D) && (IDPC == 0x162D)))
        {
            ATIF = ABR1 /* \BRTN.ABR1 */
        }
        ElseIf (((IDMN == 0xAE0D) && (IDPC == 0x162E)))
        {
            ATIF = ABR2 /* \BRTN.ABR2 */
        }
        ElseIf (((IDMN == 0xE509) && (IDPC == 0x0B7D)))
        {
            ATIF = ABR3 /* \BRTN.ABR3 */
        }
        ElseIf (((IDMN == 0xE509) && (IDPC == 0x0B9E)))
        {
            ATIF = ABR4 /* \BRTN.ABR4 */
        }
        ElseIf (((IDMN == 0xE509) && (IDPC == 0x0B81)))
        {
            ATIF = ABR5 /* \BRTN.ABR5 */
        }
        ElseIf (((IDMN == 0xE509) && (IDPC == 0x0B9F)))
        {
            ATIF = ABR6 /* \BRTN.ABR6 */
        }
        ElseIf (((IDMN == 0xAE0D) && (IDPC == 0x160A)))
        {
            ATIF = ABR7 /* \BRTN.ABR7 */
        }
        ElseIf (((IDMN == 0xE509) && (IDPC == 0x09B7)))
        {
            ATIF = ABR8 /* \BRTN.ABR8 */
        }
        ElseIf (((IDMN == 0xAE0D) && (IDPC == 0x1629)))
        {
            ATIF = ABR9 /* \BRTN.ABR9 */
        }
        ElseIf (((IDMN == 0xE430) && (IDPC == 0x0789)))
        {
            ATIF = ABRA /* \BRTN.ABRA */
        }
        ElseIf (((IDMN == 0xAE0D) && (IDPC == 0x163E)))
        {
            ATIF = ABRB /* \BRTN.ABRB */
        }
        ElseIf (((IDMN == 0xE509) && (IDPC == 0x0C76)))
        {
            ATIF = ABRC /* \BRTN.ABRC */
        }
        Else
        {
            ATIF = ABRT /* \BRTN.ABRT */
        }
    }
}

