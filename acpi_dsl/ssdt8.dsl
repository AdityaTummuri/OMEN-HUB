/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20260408 (64-bit version)
 * Copyright (c) 2000 - 2026 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ssdt8.dat
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000025C7 (9671)
 *     Revision         0x01
 *     Checksum         0xA2
 *     OEM ID           "HPQOEM"
 *     OEM Table ID     "8BCD    "
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "HP  "
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("", "SSDT", 1, "HPQOEM", "8BCD    ", 0x00001000)
{
    /*
     * iASL Warning: There were 17 external control methods found during
     * disassembly, but only 16 were resolved (1 unresolved). Additional
     * ACPI tables may be required to properly disassemble the code. This
     * resulting disassembler output file may not compile because the
     * disassembler did not know how many arguments to assign to the
     * unresolved methods. Note: SSDTs can be dynamically loaded at
     * runtime and may or may not be available via the host OS.
     *
     * To specify the tables needed to resolve external control method
     * references, the -e option can be used to specify the filenames.
     * Example iASL invocations:
     *     iasl -e ssdt1.aml ssdt2.aml ssdt3.aml -d dsdt.aml
     *     iasl -e dsdt.aml ssdt2.aml -d ssdt1.aml
     *     iasl -e ssdt*.aml -d dsdt.aml
     *
     * In addition, the -fe option can be used to specify a file containing
     * control method external declarations with the associated method
     * argument counts. Each line of the file must be of the form:
     *     External (<method pathname>, MethodObj, <argument count>)
     * Invocation:
     *     iasl -fe refs.txt -d dsdt.aml
     *
     * The following methods were unresolved and many not compile properly
     * because the disassembler had to guess at the number of arguments
     * required for each:
     */
    External (_SB_.ALIB, MethodObj)    // 2 Arguments
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.DPTC, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.GP17, DeviceObj)
    External (_SB_.PCI0.GPP0, DeviceObj)
    External (_SB_.PCI0.GPP0.HDAU._ADR, UnknownObj)
    External (_SB_.PCI0.GPP0.PEGP, DeviceObj)
    External (_SB_.PCI0.GPP0.PEGP.DAV1, UnknownObj)
    External (_SB_.PCI0.GPP0.PEGP.DAVC, UnknownObj)
    External (_SB_.PCI0.GPP0.PEGP.DHVC, UnknownObj)
    External (_SB_.PCI0.GPP0.PEGP.DVP9, UnknownObj)
    External (_SB_.PCI0.GPP0.PEGP.NHAD, UnknownObj)
    External (_SB_.PCI0.GPP0.VGA_._ADR, UnknownObj)
    External (_SB_.PCI0.LPC0.EC0_.BATP, FieldUnitObj)
    External (_SB_.PCI0.LPC0.EC0_.DGPE, IntObj)
    External (_SB_.PCI0.LPC0.EC0_.ENG6, IntObj)
    External (_SB_.PCI0.LPC0.EC0_.ERCD, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPC0.EC0_.OGHM, FieldUnitObj)
    External (_SB_.PCI0.LPC0.EC0_.RG12, UnknownObj)
    External (_SB_.PCI0.LPC0.EC0_.SADP, FieldUnitObj)
    External (_SB_.PLTF.C000, DeviceObj)
    External (_SB_.PLTF.C001, DeviceObj)
    External (_SB_.PLTF.C002, DeviceObj)
    External (_SB_.PLTF.C003, DeviceObj)
    External (_SB_.PLTF.C004, DeviceObj)
    External (_SB_.PLTF.C005, DeviceObj)
    External (_SB_.PLTF.C006, DeviceObj)
    External (_SB_.PLTF.C007, DeviceObj)
    External (_SB_.PLTF.C008, DeviceObj)
    External (_SB_.PLTF.C009, DeviceObj)
    External (_SB_.PLTF.C00A, DeviceObj)
    External (_SB_.PLTF.C00B, DeviceObj)
    External (_SB_.PLTF.C00C, DeviceObj)
    External (_SB_.PLTF.C00D, DeviceObj)
    External (_SB_.PLTF.C00E, DeviceObj)
    External (_SB_.PLTF.C00F, DeviceObj)
    External (GPUW, IntObj)
    External (M000, MethodObj)    // 1 Arguments
    External (M009, MethodObj)    // 1 Arguments
    External (M010, MethodObj)    // 2 Arguments
    External (M017, MethodObj)    // 6 Arguments
    External (M018, MethodObj)    // 7 Arguments
    External (M019, MethodObj)    // 4 Arguments
    External (M020, MethodObj)    // 5 Arguments
    External (M023, MethodObj)    // 3 Arguments
    External (M028, MethodObj)    // 4 Arguments
    External (M402, MethodObj)    // 3 Arguments
    External (M428, MethodObj)    // 6 Arguments
    External (M429, MethodObj)    // 7 Arguments
    External (M472, MethodObj)    // 4 Arguments
    External (MPMS, IntObj)
    External (NHAD, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (TCNT, FieldUnitObj)

    Scope (\_SB.PCI0.GPP0)
    {
        Device (PEGP)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
            {
                Return (Zero)
            }
        }

        Device (NHDA)
        {
            Name (_ADR, One)  // _ADR: Address
            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
            {
                Return (Zero)
            }
        }
    }

    Scope (\_SB.PCI0)
    {
        OperationRegion (HGOP, SystemMemory, 0x58F7DF18, 0x00000011)
        Field (HGOP, AnyAcc, Lock, Preserve)
        {
            DGDA,   32, 
            DGBA,   32, 
            DGPV,   16, 
            OPTF,   8, 
            NVGE,   8, 
            DSSV,   32, 
            DISM,   8
        }
    }

    Scope (\_SB.PCI0.GPP0.PEGP)
    {
        OperationRegion (VBOR, SystemMemory, 0x5AE6B018, 0x00040004)
        Field (VBOR, DWordAcc, Lock, Preserve)
        {
            RVBS,   32, 
            VBS1,   262144, 
            VBS2,   262144, 
            VBS3,   262144, 
            VBS4,   262144, 
            VBS5,   262144, 
            VBS6,   262144, 
            VBS7,   262144, 
            VBS8,   262144
        }
    }

    Scope (\_SB.PCI0.GPP0.PEGP)
    {
        OperationRegion (NOPR, SystemMemory, 0x5AE68018, 0x00002028)
        Field (NOPR, AnyAcc, Lock, Preserve)
        {
            DHPS,   8, 
            DPCS,   8, 
            GPSS,   8, 
            VENS,   8, 
            NBCS,   8, 
            GC6S,   8, 
            NVSR,   8, 
            NPCS,   8, 
            NCTP,   8, 
            SLVS,   8, 
            PBCM,   8, 
            EXMD,   8, 
            MXBS,   32, 
            MXMB,   32768, 
            SMXS,   32, 
            SMXB,   32768, 
            FBEN,   32, 
            ENVT,   32, 
            PWGD,   32, 
            DMMP,   32, 
            DLRP,   32
        }
    }

    Scope (\_SB.PCI0.GPP0.PEGP)
    {
        Name (GSV1, Buffer (One)
        {
             0x00                                             // .
        })
        Name (GSV2, Buffer (One)
        {
             0x00                                             // .
        })
        Name (GSDR, Buffer (0xA1)
        {
            /* 0000 */  0x57, 0x74, 0xDC, 0x86, 0x75, 0x84, 0xEC, 0xE7,  // Wt..u...
            /* 0008 */  0x52, 0x44, 0xA1, 0x00, 0x00, 0x00, 0x00, 0x01,  // RD......
            /* 0010 */  0x00, 0x00, 0x00, 0x00, 0xDE, 0x10, 0x00, 0x00,  // ........
            /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0020 */  0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x34, 0x00,  // ......4.
            /* 0028 */  0x00, 0x00, 0x01, 0x00, 0x47, 0x00, 0x00, 0x00,  // ....G...
            /* 0030 */  0x02, 0x00, 0x45, 0x00, 0x00, 0x00, 0x03, 0x00,  // ..E.....
            /* 0038 */  0x51, 0x00, 0x00, 0x00, 0x04, 0x00, 0x4F, 0x00,  // Q.....O.
            /* 0040 */  0x00, 0x00, 0x05, 0x00, 0x4D, 0x00, 0x00, 0x00,  // ....M...
            /* 0048 */  0x06, 0x00, 0x4B, 0x00, 0x00, 0x00, 0x07, 0x00,  // ..K.....
            /* 0050 */  0x49, 0x00, 0x00, 0x00, 0x08, 0x00, 0x47, 0x00,  // I.....G.
            /* 0058 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD9, 0x1C,  // ........
            /* 0060 */  0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00,  // ........
            /* 0068 */  0x41, 0x5D, 0xC9, 0x00, 0x01, 0x24, 0x2E, 0x00,  // A]...$..
            /* 0070 */  0x02, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x01,  // ........
            /* 0078 */  0x00, 0x00, 0x00, 0xD9, 0x1C, 0x04, 0x00, 0x00,  // ........
            /* 0080 */  0x00, 0x01, 0x00, 0x00, 0x00, 0x60, 0x68, 0x9E,  // .....`h.
            /* 0088 */  0x35, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // 5.......
            /* 0090 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0098 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 00A0 */  0x00                                             // .
        })
        Method (NBCI, 4, Serialized)
        {
            Debug = "------- NV NBCI DSM --------"
            If ((Arg1 != 0x0102))
            {
                Debug = " NBCI DSM: NOT SUPPORTED!"
                Return (0x80000002)
            }

            If ((Arg2 == Zero))
            {
                Debug = "   NBCI fun0 NBCI_FUNC_SUPPORT"
                Return (Buffer (0x04)
                {
                     0x01, 0x00, 0x11, 0x00                           // ....
                })
            }

            If ((Arg2 == 0x10))
            {
                Debug = "   NBCI fun16 NBCI_FUNC_GETOBJBYTYPE"
                CreateWordField (Arg3, 0x02, BFF0)
                If ((BFF0 == 0x564B)){}
                If ((BFF0 == 0x4452))
                {
                    Return (GSDR) /* \_SB_.PCI0.GPP0.PEGP.GSDR */
                }
            }

            If ((Arg2 == 0x14))
            {
                Debug = "   NBCI fun20 NBCI_FUNC_GETBACKLIGHT"
                Return (Package (0x20)
                {
                    0x8000A450, 
                    0x0200, 
                    Zero, 
                    Zero, 
                    0x05, 
                    One, 
                    0xC8, 
                    0x32, 
                    0x03E8, 
                    0x0B, 
                    0x32, 
                    0x64, 
                    0x96, 
                    0xC8, 
                    0x012C, 
                    0x0190, 
                    0x01FE, 
                    0x0276, 
                    0x02F8, 
                    0x0366, 
                    0x03E8, 
                    Zero, 
                    0x64, 
                    0xC8, 
                    0x012C, 
                    0x0190, 
                    0x01F4, 
                    0x0258, 
                    0x02BC, 
                    0x0320, 
                    0x0384, 
                    0x03E8
                })
            }
        }
    }

    Mutex (NVMT, 0x00)
    Scope (\)
    {
        Name (REST, 0x28)
        Name (PWEN, 0x09)
        Name (PWOK, 0x9A)
        Name (GRDN, One)
        Name (GRFN, One)
    }

    Scope (\_SB.PCI0.GPP0)
    {
        Method (GPON, 0, NotSerialized)
        {
            \_SB.PCI0.DPTC (0x2E, 0x61A8)
            \_SB.PCI0.DPTC (0x06, 0x61A8)
            \_SB.PCI0.DPTC (0x07, 0x61A8)
            \_SB.PCI0.DPTC (0x32, 0x61A8)
            \_SB.PCI0.DPTC (0x05, 0x61A8)
        }

        Method (GPOF, 0, NotSerialized)
        {
            \_SB.PCI0.DPTC (0x2E, 0x00011170)
            \_SB.PCI0.DPTC (0x06, 0x00011170)
            \_SB.PCI0.DPTC (0x07, 0x00011170)
            \_SB.PCI0.DPTC (0x32, 0x00011170)
            \_SB.PCI0.DPTC (0x05, 0x00011170)
        }

        Method (SGPC, 1, NotSerialized)
        {
            If ((Arg0 == One))
            {
                M000 (0xAA0C)
                Sleep (0x05)
                If ((M009 (PWEN) == One))
                {
                    Return (Zero)
                }

                Sleep (One)
                M010 (PWEN, One)
                Local0 = One
                While (Local0)
                {
                    If ((M009 (PWOK) == One))
                    {
                        Local0 = Zero
                    }
                    Else
                    {
                        Sleep (One)
                    }
                }

                Sleep (0x02)
                M010 (REST, One)
                Sleep (0x64)
                Sleep (0x64)
                Sleep (0x64)
                Sleep (0x64)
                Sleep (0x64)
            }
            Else
            {
                M010 (PWEN, One)
                Sleep (0x64)
                M010 (REST, Zero)
                Sleep (0x03)
                M010 (PWEN, Zero)
                Sleep (0x64)
            }
        }

        PowerResource (PG00, 0x00, 0x0000)
        {
            Name (M239, One)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (M239) /* \_SB_.PCI0.GPP0.PG00.M239 */
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
                M000 (0xC000)
                If ((\_SB.PCI0.TDGC == One))
                {
                    If ((\_SB.PCI0.DGCX == 0x03))
                    {
                        \_SB.PCI0.GC6O ()
                    }
                    ElseIf ((\_SB.PCI0.DGCX == 0x04))
                    {
                        \_SB.PCI0.GC6O ()
                    }

                    \_SB.PCI0.TDGC = Zero
                    \_SB.PCI0.DGCX = Zero
                }
                ElseIf ((M239 == Zero))
                {
                    M023 (Zero, GRDN, GRFN)
                    SGPC (One)
                    L23D (One)
                }

                \_SB.PCI0.LPC0.EC0.DGPE = One
                M239 = One
                Sleep (0x64)
                M000 (0xC001)
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
                \_SB.PCI0.LPC0.EC0.DGPE = Zero
                M000 (0xC002)
                If ((\_SB.PCI0.TDGC == One))
                {
                    CreateField (\_SB.PCI0.TGPC, Zero, 0x03, GPPC)
                    If ((ToInteger (GPPC) == One))
                    {
                        \_SB.PCI0.GC6I ()
                    }
                    ElseIf ((ToInteger (GPPC) == 0x02))
                    {
                        \_SB.PCI0.GC6I ()
                    }
                }
                Else
                {
                    If ((M239 == One))
                    {
                        DL23 ()
                        SGPC (Zero)
                    }

                    M239 = Zero
                }

                M000 (0xC003)
            }
        }

        Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
        {
            PG00, 
        })
        Name (_PR2, Package (0x01)  // _PR2: Power Resources for D2
        {
            PG00, 
        })
        Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
        {
            PG00, 
        })
        Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
        OperationRegion (RPCX, SystemMemory, \_SB.PCI0.DGBA, 0x1000)
        Field (RPCX, DWordAcc, NoLock, Preserve)
        {
            RVID,   32, 
            CMDR,   8, 
            Offset (0x19), 
            PRBN,   8, 
            Offset (0x54), 
            D0ST,   2, 
            Offset (0x62), 
            CEDR,   1, 
            Offset (0x68), 
            ASPM,   2, 
                ,   2, 
            LNKD,   1, 
            Offset (0x80), 
            Offset (0x81), 
                ,   2, 
            LREN,   1
        }

        Method (GSTA, 0, NotSerialized)
        {
            If ((M009 (PWOK) == Zero))
            {
                Return (Zero)
            }
            Else
            {
                Return (One)
            }
        }
    }

    Method (L23D, 1, NotSerialized)
    {
        Local1 = M017 (Zero, GRDN, GRFN, 0x70, Zero, 0x10)
        M018 (Zero, GRDN, One, 0x70, Zero, 0x10, (Local1 & 0xEFD7))
        \_SB.ALIB (0x13, ((GRDN << 0x03) | GRFN))
        Sleep (0x1E)
        Local1 = Zero
        Local2 = 0x13BB
        While ((((Local1 & 0x28) != 0x20) && (Local2 > Zero)))
        {
            Local1 = M017 (Zero, GRDN, GRFN, 0x6B, Zero, 0x08)
            Local2 = (Local2 - One)
            Stall (0x63)
        }

        Sleep (0x64)
        Local1 = M019 (Zero, GRDN, GRFN, 0x54)
        M020 (Zero, GRDN, GRFN, 0x54, (Local1 & 0xFFFF7FFC))
        If ((Arg0 == One))
        {
            \_SB.PCI0.GPP0.CMDR = 0x07
        }
        ElseIf ((Arg0 == 0x02))
        {
            \_SB.PCI0.GPP0.CMDR |= 0x04
        }

        \_SB.PCI0.GPP0.D0ST = Zero
        While ((\_SB.PCI0.GPP0.PEGP.NVID != 0x10DE))
        {
            Sleep (One)
        }

        \_SB.PCI0.GPP0.LREN = \_SB.PCI0.GPP0.PEGP.LTRE
        \_SB.PCI0.GPP0.CEDR = One
        M020 (Zero, GRDN, GRFN, 0x54, (Local1 & 0xFFFF7FFF))
        Sleep (0x64)
    }

    Method (DL23, 0, NotSerialized)
    {
        \_SB.PCI0.GPP0.PEGP.LTRE = \_SB.PCI0.GPP0.LREN
        Sleep (0x14)
        M023 (Zero, GRDN, GRFN)
        Local1 = M019 (Zero, GRDN, GRFN, 0x54)
        M020 (Zero, GRDN, GRFN, 0x54, (Local1 & 0xFFFF7FFC))
        Sleep (One)
        Local2 = M017 (Zero, GRDN, GRFN, 0x19, Zero, 0x08)
        M028 (Local2, Zero, Zero, Zero)
        M020 (Zero, GRDN, GRFN, 0x54, (Local1 & 0xFFFF7FFF))
        M402 (Zero, GRDN, GRFN)
        Local2 = M017 (Zero, GRDN, GRFN, 0x70, Zero, 0x10)
        M018 (Zero, GRDN, One, 0x70, Zero, 0x10, (Local2 & 0xEFD7))
        \_SB.ALIB (0x12, ((GRDN << 0x03) | GRFN))
        Sleep (0x1E)
        Local2 = M428 (Zero, GRDN, GRFN, 0x55, Zero, 0x08)
        M429 (Zero, GRDN, GRFN, 0x55, Zero, 0x08, (Local2 | 0x80))
        Local2 = M428 (Zero, GRDN, GRFN, 0x7A, Zero, 0x08)
        M429 (Zero, GRDN, GRFN, 0x7A, Zero, 0x08, (Local2 | One))
        M023 (Zero, GRDN, GRFN)
    }

    Scope (\_SB.PCI0.GPP0.PEGP)
    {
        Name (LTRE, Zero)
        Name (DGPS, Zero)
        Name (_PSC, Zero)  // _PSC: Power State Current
        Name (GPRF, Zero)
        Name (OPCE, 0x02)
        OperationRegion (PCIM, SystemMemory, \_SB.PCI0.DGDA, 0x1000)
        Field (PCIM, DWordAcc, NoLock, Preserve)
        {
            NVID,   16, 
            NDID,   16, 
            CMDR,   8, 
            VGAR,   2008, 
            Offset (0x48B), 
                ,   1, 
            HDAE,   1
        }

        OperationRegion (DGPU, SystemMemory, \_SB.PCI0.DGDA, 0x0100)
        Field (DGPU, DWordAcc, NoLock, Preserve)
        {
            Offset (0x40), 
            SSSV,   32
        }

        OperationRegion (PCIS, PCI_Config, Zero, 0x0100)
        Field (PCIS, AnyAcc, NoLock, Preserve)
        {
            PVID,   16, 
            PDID,   16
        }

        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
        {
            Acquire (NVMT, 0xFFFF)
            _PSC = Zero
            If ((DGPS != Zero))
            {
                \_SB.PCI0.GPP0.PG00._ON ()
                DGPS = Zero
            }

            Release (NVMT)
        }

        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
        {
            Acquire (NVMT, 0xFFFF)
            If ((OPCE == 0x03))
            {
                If ((DGPS == Zero))
                {
                    \_SB.PCI0.GPP0.PG00._OFF ()
                    DGPS = One
                }

                OPCE = 0x02
            }

            _PSC = 0x03
            Release (NVMT)
        }

        Method (SGST, 0, Serialized)
        {
            If ((PVID != 0x0FFF))
            {
                Return (0x0F)
            }

            Return (Zero)
        }

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {
            If ((Arg0 == ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0") /* Unknown UUID */))
            {
                Return (\_SB.PCI0.GPP0.PEGP.NVOP (Arg0, Arg1, Arg2, Arg3))
            }

            If ((Arg0 == ToUUID ("a3132d01-8cda-49ba-a52e-bc9d46df6b81") /* Unknown UUID */))
            {
                If ((\_SB.PCI0.GPP0.PEGP.GPSS != Zero))
                {
                    Return (\_SB.PCI0.GPP0.PEGP.GPS (Arg0, Arg1, Arg2, Arg3))
                }
            }

            If ((Arg0 == ToUUID ("cbeca351-067b-4924-9cbd-b46b00b86f34") /* Unknown UUID */))
            {
                If ((\_SB.PCI0.GPP0.PEGP.GC6S != Zero))
                {
                    Return (\_SB.PCI0.GPP0.PEGP.NVJT (Arg0, Arg1, Arg2, Arg3))
                }
            }

            If ((Arg0 == ToUUID ("d4a50b75-65c7-46f7-bfb7-41514cea0244") /* Unknown UUID */))
            {
                If ((\_SB.PCI0.GPP0.PEGP.NBCS != Zero))
                {
                    Return (\_SB.PCI0.GPP0.PEGP.NBCI (Arg0, Arg1, Arg2, Arg3))
                }
            }

            Return (0x80000001)
        }
    }

    Scope (\_SB.PCI0.GPP0.PEGP)
    {
        OperationRegion (NHAC, SystemMemory, NHAD, 0x04)
        Field (NHAC, DWordAcc, NoLock, Preserve)
        {
            NHAV,   32
        }

        Method (NVOP, 4, Serialized)
        {
            If ((Arg2 == Zero))
            {
                Return (Buffer (0x04)
                {
                     0x01, 0x00, 0x00, 0x0C                           // ....
                })
            }
            Else
            {
                If ((Arg2 == 0x1A))
                {
                    CreateField (Arg3, 0x18, 0x02, OMPR)
                    CreateField (Arg3, Zero, One, FLCH)
                    CreateField (Arg3, One, One, DVSR)
                    CreateField (Arg3, 0x02, One, DVSC)
                    If (ToInteger (FLCH))
                    {
                        \_SB.PCI0.GPP0.PEGP.OPCE = OMPR /* \_SB_.PCI0.GPP0.PEGP.NVOP.OMPR */
                    }

                    Local0 = Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                           // ....
                        }
                    CreateField (Local0, Zero, One, OPEN)
                    CreateField (Local0, 0x03, 0x02, CGCS)
                    CreateField (Local0, 0x06, One, SHPC)
                    CreateField (Local0, 0x08, One, SNSR)
                    CreateField (Local0, 0x18, 0x03, DGPC)
                    CreateField (Local0, 0x1B, 0x02, OHAC)
                    OPEN = One
                    SHPC = One
                    DGPC = One
                    OHAC = 0x03
                    If (ToInteger (DVSC))
                    {
                        If (ToInteger (DVSR))
                        {
                            \_SB.PCI0.GPP0.PEGP.GPRF = One
                        }
                        Else
                        {
                            \_SB.PCI0.GPP0.PEGP.GPRF = Zero
                        }
                    }

                    SNSR = \_SB.PCI0.GPP0.PEGP.GPRF
                    If ((\_SB.PCI0.GPP0.PEGP.SGST () != Zero))
                    {
                        CGCS = 0x03
                    }

                    Return (Local0)
                }

                If ((Arg2 == 0x1B))
                {
                    Name (BF32, Buffer (0x04)
                    {
                         0x00                                             // .
                    })
                    CreateBitField (BF32, 0x18, DP9D)
                    CreateBitField (BF32, 0x19, EP9D)
                    CreateBitField (BF32, 0x1A, DV1D)
                    CreateBitField (BF32, 0x1B, EV1D)
                    CreateBitField (BF32, 0x1C, DAVD)
                    CreateBitField (BF32, 0x1D, EAVD)
                    CreateBitField (BF32, 0x1E, DEVD)
                    CreateBitField (BF32, 0x1F, EEVD)
                    BF32 = NHAV /* \_SB_.PCI0.GPP0.PEGP.NHAV */
                    If ((DAVC == One))
                    {
                        DAVD = One
                        EAVD = One
                    }

                    If ((DHVC == One))
                    {
                        DEVD = One
                        EEVD = One
                    }

                    If ((DAV1 == One))
                    {
                        DV1D = One
                        EV1D = One
                    }

                    If ((DVP9 == One))
                    {
                        DP9D = One
                        EP9D = One
                    }

                    NHAV = BF32 /* \_SB_.PCI0.GPP0.PEGP.NVOP.BF32 */
                }
            }

            Return (0x80000002)
        }
    }

    Scope (\_SB.PCI0.GPP0.PEGP)
    {
        Name (NLIM, Zero)
        Name (PSLS, Zero)
        Name (GPSP, Buffer (0x28){})
        CreateDWordField (GPSP, Zero, RETN)
        CreateDWordField (GPSP, 0x04, VRV1)
        CreateDWordField (GPSP, 0x08, TGPU)
        CreateDWordField (GPSP, 0x0C, PDTS)
        CreateDWordField (GPSP, 0x10, SFAN)
        CreateDWordField (GPSP, 0x14, SKNT)
        CreateDWordField (GPSP, 0x18, CPUE)
        CreateDWordField (GPSP, 0x1C, TMP1)
        CreateDWordField (GPSP, 0x20, TMP2)
        Name (GPSV, 0x57)
        Method (GPS, 4, Serialized)
        {
            Debug = "------- NV GPS DSM --------"
            If ((Arg1 != 0x0200))
            {
                Return (0x80000002)
            }

            Switch (ToInteger (Arg2))
            {
                Case (Zero)
                {
                    Debug = "   GPS fun 0"
                    Return (Buffer (0x08)
                    {
                         0x01, 0x00, 0x08, 0x00, 0x01, 0x04, 0x00, 0x00   // ........
                    })
                }
                Case (0x13)
                {
                    Debug = "   GPS fun 19"
                    CreateDWordField (Arg3, Zero, TEMP)
                    If ((TEMP == Zero))
                    {
                        Return (0x04)
                    }

                    If ((TEMP && 0x04))
                    {
                        \_SB.PCI0.LPC0.EC0.RG12 = Zero
                        Return (0x04)
                    }
                }
                Case (0x20)
                {
                    Debug = "   GPS fun 32"
                    Name (RET1, Zero)
                    CreateBitField (Arg3, 0x02, SPBI)
                    If (NLIM)
                    {
                        RET1 |= One
                    }

                    If (PSLS)
                    {
                        RET1 |= 0x02
                    }

                    Return (RET1) /* \_SB_.PCI0.GPP0.PEGP.GPS_.RET1 */
                }
                Case (0x2A)
                {
                    Debug = "   GPS fun 42"
                    CreateField (Arg3, Zero, 0x04, PSH0)
                    CreateBitField (Arg3, 0x08, GPUT)
                    VRV1 = 0x00010000
                    Switch (ToInteger (PSH0))
                    {
                        Case (Zero)
                        {
                            Return (GPSP) /* \_SB_.PCI0.GPP0.PEGP.GPSP */
                        }
                        Case (One)
                        {
                            RETN = 0x0100
                            RETN |= ToInteger (PSH0)
                            Return (GPSP) /* \_SB_.PCI0.GPP0.PEGP.GPSP */
                        }
                        Case (0x02)
                        {
                            RETN = 0x0102
                            TGPU = GPSV /* \_SB_.PCI0.GPP0.PEGP.GPSV */
                            Return (GPSP) /* \_SB_.PCI0.GPP0.PEGP.GPSP */
                        }

                    }
                }
                Default
                {
                    Return (0x80000002)
                }

            }

            Return (0x80000002)
        }
    }

    Scope (\_SB.PCI0)
    {
        Name (TGPC, Buffer (0x04)
        {
             0x00                                             // .
        })
        Name (TDGC, Zero)
        Name (DGCX, Zero)
        Method (GC6I, 0, Serialized)
        {
            Debug = "   JT GC6I"
            DL23 ()
            Sleep (0x14)
            M010 (REST, Zero)
            Sleep (0x14)
            \_SB.PCI0.LPC0.EC0.ENG6 = One
        }

        Method (GC6O, 0, Serialized)
        {
            Debug = "   JT GC6O"
            M472 (Zero, GRDN, GRFN, One)
            M023 (Zero, GRDN, GRFN)
            Sleep (0x14)
            M010 (REST, One)
            Sleep (0x05)
            L23D (0x02)
            \_SB.PCI0.LPC0.EC0.ENG6 = Zero
        }
    }

    Scope (\_SB.PCI0.GPP0.PEGP)
    {
        Method (NVJT, 4, Serialized)
        {
            Debug = "------- NV JT DSM --------"
            If ((ToInteger (Arg1) < 0x0100))
            {
                Return (0x80000001)
            }

            Switch (ToInteger (Arg2))
            {
                Case (Zero)
                {
                    Debug = "   JT fun0 JT_FUNC_SUPPORT"
                    Return (Buffer (0x04)
                    {
                         0x1B, 0x00, 0x00, 0x00                           // ....
                    })
                }
                Case (One)
                {
                    Debug = "   JT fun1 JT_FUNC_CAPS"
                    Name (JTCA, Buffer (0x04)
                    {
                         0x00                                             // .
                    })
                    CreateField (JTCA, Zero, One, JTEN)
                    CreateField (JTCA, One, 0x02, SREN)
                    CreateField (JTCA, 0x03, 0x02, PLPR)
                    CreateField (JTCA, 0x05, One, SRPR)
                    CreateField (JTCA, 0x06, 0x02, FBPR)
                    CreateField (JTCA, 0x08, 0x02, GUPR)
                    CreateField (JTCA, 0x0A, One, GC6R)
                    CreateField (JTCA, 0x0B, One, PTRH)
                    CreateField (JTCA, 0x0D, One, MHYB)
                    CreateField (JTCA, 0x0E, One, RPCL)
                    CreateField (JTCA, 0x0F, 0x02, GC6V)
                    CreateField (JTCA, 0x11, One, GEIS)
                    CreateField (JTCA, 0x12, One, GSWS)
                    CreateField (JTCA, 0x14, 0x0C, JTRV)
                    JTEN = One
                    GC6R = Zero
                    RPCL = One
                    SREN = One
                    FBPR = Zero
                    MHYB = One
                    GC6V = 0x02
                    JTRV = 0x0200
                    Return (JTCA) /* \_SB_.PCI0.GPP0.PEGP.NVJT.JTCA */
                }
                Case (0x02)
                {
                    Debug = "   JT fun2 JT_FUNC_POLICYSELECT"
                    Return (0x80000002)
                }
                Case (0x03)
                {
                    Debug = "   JT fun3 JT_FUNC_POWERCONTROL"
                    CreateField (Arg3, Zero, 0x03, GPPC)
                    CreateField (Arg3, 0x04, One, PLPC)
                    CreateField (Arg3, 0x07, One, ECOC)
                    CreateField (Arg3, 0x0E, 0x02, DFGC)
                    CreateField (Arg3, 0x10, 0x03, GPCX)
                    \_SB.PCI0.TGPC = Arg3
                    If (((ToInteger (GPPC) != Zero) || (ToInteger (DFGC
                        ) != Zero)))
                    {
                        \_SB.PCI0.TDGC = ToInteger (DFGC)
                        \_SB.PCI0.DGCX = ToInteger (GPCX)
                    }

                    Name (JTPC, Buffer (0x04)
                    {
                         0x00                                             // .
                    })
                    CreateField (JTPC, Zero, 0x03, GUPS)
                    CreateField (JTPC, 0x03, One, GPWO)
                    CreateField (JTPC, 0x07, One, PLST)
                    If ((ToInteger (DFGC) != Zero))
                    {
                        GPWO = One
                        GUPS = One
                        Return (JTPC) /* \_SB_.PCI0.GPP0.PEGP.NVJT.JTPC */
                    }

                    Debug = "   JT fun3 GPPC="
                    Debug = ToInteger (GPPC)
                    If ((ToInteger (GPPC) == One))
                    {
                        \_SB.PCI0.GC6I ()
                        PLST = One
                        GUPS = Zero
                    }
                    ElseIf ((ToInteger (GPPC) == 0x02))
                    {
                        \_SB.PCI0.GC6I ()
                        If ((ToInteger (PLPC) == Zero))
                        {
                            PLST = Zero
                        }

                        GUPS = Zero
                    }
                    ElseIf ((ToInteger (GPPC) == 0x03))
                    {
                        \_SB.PCI0.GC6O ()
                        If ((ToInteger (PLPC) != Zero))
                        {
                            PLST = Zero
                        }

                        GPWO = One
                        GUPS = One
                    }
                    ElseIf ((ToInteger (GPPC) == 0x04))
                    {
                        \_SB.PCI0.GC6O ()
                        If ((ToInteger (PLPC) != Zero))
                        {
                            PLST = Zero
                        }

                        GPWO = One
                        GUPS = One
                    }
                    ElseIf ((M009 (PWGD) == One))
                    {
                        Debug = "   JT GETS() return 0x1"
                        GPWO = One
                        GUPS = One
                    }
                    Else
                    {
                        Debug = "   JT GETS() return 0x3"
                        GPWO = Zero
                        GUPS = 0x03
                    }

                    Return (JTPC) /* \_SB_.PCI0.GPP0.PEGP.NVJT.JTPC */
                }
                Case (0x04)
                {
                    Debug = "   JT fun4 JT_FUNC_PLATPOLICY"
                    CreateField (Arg3, 0x02, One, PAUD)
                    CreateField (Arg3, 0x03, One, PADM)
                    CreateField (Arg3, 0x04, 0x04, PDGS)
                    Local0 = Zero
                    Local0 = (\_SB.PCI0.GPP0.PEGP.HDAE << 0x02)
                    Return (Local0)
                }

            }

            Return (0x80000002)
        }
    }

    Scope (\_SB)
    {
        Device (NPCF)
        {
            Name (ACBT, 0x50)
            Name (CTGP, Zero)
            Name (DTGP, Zero)
            Name (OTPP, Zero)
            Name (DCBT, Zero)
            Name (DBAC, Zero)
            Name (DBDC, Zero)
            Name (AMAT, Zero)
            Name (AMIT, 0xFF88)
            Name (ATPP, 0x0168)
            Name (DTPP, 0xC8)
            Name (TPPL, Zero)
            Name (DROS, Zero)
            Name (CDIS, Zero)
            Name (CUSL, Zero)
            Name (CUCT, Zero)
            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                CDIS = Zero
                Return ("NVDA0820")
            }

            Name (_UID, "NPCF")  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((CDIS == One))
                {
                    Return (0x0D)
                }

                Return (0x0F)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                CDIS = One
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("36b49710-2483-11e7-9598-0800200c9a66") /* Unknown UUID */))
                {
                    If ((\_SB.PCI0.GPP0.PEGP.NPCS != Zero))
                    {
                        Return (NPCF (Arg0, Arg1, Arg2, Arg3))
                    }
                }
            }

            Method (NPCF, 4, Serialized)
            {
                Debug = "------- NVPCF DSM --------"
                If ((ToInteger (Arg1) != 0x0200))
                {
                    Return (0x80000001)
                }

                Switch (ToInteger (Arg2))
                {
                    Case (Zero)
                    {
                        Debug = "   NVPCF sub-func#0"
                        Return (Buffer (0x04)
                        {
                             0x87, 0x03, 0x00, 0x00                           // ....
                        })
                    }
                    Case (One)
                    {
                        Debug = "   NVPCF sub-func#1"
                        Return (Buffer (0x0E)
                        {
                            /* 0000 */  0x20, 0x03, 0x01, 0x01, 0x23, 0x04, 0x05, 0x01,  //  ...#...
                            /* 0008 */  0x01, 0x01, 0x00, 0x00, 0x00, 0xAC               // ......
                        })
                    }
                    Case (0x02)
                    {
                        Debug = "   NVPCF sub-func#2"
                        Name (PBD2, Buffer (0x31)
                        {
                             0x00                                             // .
                        })
                        CreateByteField (PBD2, Zero, PTV2)
                        CreateByteField (PBD2, One, PHB2)
                        CreateByteField (PBD2, 0x02, GSB2)
                        CreateByteField (PBD2, 0x03, CTB2)
                        CreateByteField (PBD2, 0x04, NCE2)
                        PTV2 = 0x23
                        PHB2 = 0x05
                        GSB2 = 0x10
                        CTB2 = 0x1C
                        NCE2 = One
                        CreateWordField (PBD2, 0x05, TGPA)
                        CreateWordField (PBD2, 0x07, TGPD)
                        CreateByteField (PBD2, 0x15, PC01)
                        CreateByteField (PBD2, 0x16, PC02)
                        CreateWordField (PBD2, 0x19, TPPA)
                        CreateWordField (PBD2, 0x1B, TPPD)
                        CreateWordField (PBD2, 0x1D, MAGA)
                        CreateWordField (PBD2, 0x1F, MAGD)
                        CreateWordField (PBD2, 0x21, MIGA)
                        CreateWordField (PBD2, 0x23, MIGD)
                        CreateDWordField (PBD2, 0x25, DROP)
                        CreateDWordField (PBD2, 0x29, PA5O)
                        CreateDWordField (PBD2, 0x2D, PA6O)
                        CreateField (Arg3, 0x28, 0x02, NIGS)
                        CreateByteField (Arg3, 0x15, IORC)
                        CreateField (Arg3, 0xB0, One, PWCS)
                        CreateField (Arg3, 0xB1, One, PWTS)
                        CreateField (Arg3, 0xB2, One, CGPS)
                        If (((\_SB.PCI0.LPC0.EC0.OGHM & One) == One))
                        {
                            ACBT = 0xF0
                            AMAT = 0x50
                            ATPP = 0x0118
                        }
                        Else
                        {
                            ACBT = Zero
                            AMAT = 0x50
                            ATPP = 0xF0
                        }

                        If ((OTPP != Zero))
                        {
                            ATPP = OTPP /* \_SB_.NPCF.OTPP */
                            OTPP = Zero
                        }

                        If ((ToInteger (NIGS) == Zero))
                        {
                            If ((CTGP == One))
                            {
                                If (MPMS)
                                {
                                    TGPA = ACBT /* \_SB_.NPCF.ACBT */
                                }
                                Else
                                {
                                    TGPA = 0xA0
                                }

                                TGPD = Zero
                            }
                            Else
                            {
                                If (MPMS)
                                {
                                    TGPA = Zero
                                }
                                Else
                                {
                                    TGPA = 0xA0
                                }

                                TGPD = Zero
                            }

                            PC01 = Zero
                            TPPA = ATPP /* \_SB_.NPCF.ATPP */
                            TPPD = DTPP /* \_SB_.NPCF.DTPP */
                            If ((DTGP == One))
                            {
                                DBAC = Zero
                                DBDC = Zero
                                If (MPMS)
                                {
                                    PC02 = (DBAC | (DBDC << One))
                                }
                                Else
                                {
                                    PC02 = (One | (DBDC << One))
                                }

                                MAGA = AMAT /* \_SB_.NPCF.AMAT */
                                MIGA = AMIT /* \_SB_.NPCF.AMIT */
                            }
                            Else
                            {
                                DBAC = One
                                DBDC = One
                                If (MPMS)
                                {
                                    PC02 = (DBAC | (DBDC << One))
                                }
                                Else
                                {
                                    PC02 = (One | (DBDC << One))
                                }

                                MAGA = Zero
                                MIGA = Zero
                            }

                            DROP = DROS /* \_SB_.NPCF.DROS */
                        }

                        If ((ToInteger (NIGS) == One))
                        {
                            If ((ToInteger (PWCS) == One)){}
                            Else
                            {
                            }

                            If ((ToInteger (PWTS) == One)){}
                            Else
                            {
                            }

                            If ((ToInteger (CGPS) == One)){}
                            Else
                            {
                            }

                            TGPA = Zero
                            TGPD = Zero
                            PC01 = Zero
                            PC02 = Zero
                            TPPA = Zero
                            TPPD = Zero
                            MAGA = Zero
                            MIGA = Zero
                            MAGD = Zero
                            MIGD = Zero
                        }

                        Return (PBD2) /* \_SB_.NPCF.NPCF.PBD2 */
                    }
                    Case (0x03)
                    {
                        Debug = "   NVPCF sub-func#3"
                        Return (Buffer (0x3D)
                        {
                            /* 0000 */  0x11, 0x04, 0x13, 0x03, 0x00, 0xFF, 0x00, 0x28,  // .......(
                            /* 0008 */  0x2D, 0x2D, 0x33, 0x33, 0x39, 0x39, 0x3F, 0x3F,  // --3399??
                            /* 0010 */  0x45, 0x42, 0x4B, 0x46, 0x50, 0xFF, 0xFF, 0x05,  // EBKFP...
                            /* 0018 */  0xFF, 0x00, 0x3C, 0x41, 0x41, 0x46, 0x46, 0x4B,  // ..<AAFFK
                            /* 0020 */  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,  // ........
                            /* 0028 */  0xFF, 0xFF, 0x02, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,  // ........
                            /* 0030 */  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,  // ........
                            /* 0038 */  0x00, 0x30, 0x34, 0x34, 0x3A                     // .044:
                        })
                    }
                    Case (0x04)
                    {
                        Debug = "   NVPCF sub-func#4"
                        Return (Buffer (0x32)
                        {
                            /* 0000 */  0x11, 0x04, 0x2E, 0x01, 0x05, 0x00, 0x01, 0x02,  // ........
                            /* 0008 */  0x03, 0x04, 0x03, 0x01, 0x02, 0x03, 0x00, 0x02,  // ........
                            /* 0010 */  0x03, 0x04, 0x00, 0x02, 0x03, 0x04, 0x00, 0x02,  // ........
                            /* 0018 */  0x03, 0x04, 0x00, 0x02, 0x03, 0x04, 0x00, 0x02,  // ........
                            /* 0020 */  0x03, 0x04, 0x01, 0x02, 0x03, 0x04, 0x02, 0x02,  // ........
                            /* 0028 */  0x03, 0x04, 0x03, 0x03, 0x03, 0x04, 0x04, 0x04,  // ........
                            /* 0030 */  0x04, 0x04                                       // ..
                        })
                    }
                    Case (0x05)
                    {
                        Debug = "   NVPCF sub-func#5"
                        Name (PBD5, Buffer (0x28)
                        {
                             0x00                                             // .
                        })
                        CreateByteField (PBD5, Zero, PTV5)
                        CreateByteField (PBD5, One, PHB5)
                        CreateByteField (PBD5, 0x02, TEB5)
                        CreateByteField (PBD5, 0x03, NTE5)
                        PTV5 = 0x11
                        PHB5 = 0x04
                        TEB5 = 0x24
                        NTE5 = One
                        CreateDWordField (PBD5, 0x04, F5O0)
                        CreateDWordField (PBD5, 0x08, F5O1)
                        CreateDWordField (PBD5, 0x0C, F5O2)
                        CreateDWordField (PBD5, 0x10, F5O3)
                        CreateDWordField (PBD5, 0x14, F5O4)
                        CreateDWordField (PBD5, 0x18, F5O5)
                        CreateDWordField (PBD5, 0x1C, F5O6)
                        CreateDWordField (PBD5, 0x20, F5O7)
                        CreateDWordField (PBD5, 0x24, F5O8)
                        CreateField (Arg3, 0x20, 0x03, INC5)
                        CreateDWordField (Arg3, 0x08, F5P1)
                        CreateDWordField (Arg3, 0x0C, F5P2)
                        Switch (ToInteger (INC5))
                        {
                            Case (Zero)
                            {
                                F5O0 = One
                                F5O1 = Zero
                                F5O2 = Zero
                                F5O3 = Zero
                            }
                            Case (One)
                            {
                                F5O0 = Zero
                                F5O1 = Zero
                                F5O2 = Zero
                                F5O3 = Zero
                            }
                            Case (0x02)
                            {
                                F5O0 = Zero
                                F5O1 = Zero
                                F5O2 = Zero
                                F5O3 = Zero
                                F5O4 = Zero
                                F5O5 = Zero
                                F5O6 = Zero
                                F5O7 = Zero
                                F5O8 = Zero
                            }
                            Case (0x03)
                            {
                                CUSL = (F5P1 & 0xFF)
                            }
                            Case (0x04)
                            {
                                CUCT = F5P2 /* \_SB_.NPCF.NPCF.F5P2 */
                            }
                            Default
                            {
                                Return (0x80000002)
                            }

                        }

                        Return (PBD5) /* \_SB_.NPCF.NPCF.PBD5 */
                    }
                    Case (0x07)
                    {
                        Debug = "   NVPCF sub-func#7"
                        CreateDWordField (Arg3, 0x05, AMAX)
                        CreateDWordField (Arg3, 0x09, ARAT)
                        CreateDWordField (Arg3, 0x0D, DMAX)
                        CreateDWordField (Arg3, 0x11, DRAT)
                        CreateDWordField (Arg3, 0x15, TGPM)
                        Return (Zero)
                    }
                    Case (0x08)
                    {
                        Debug = "   NVPCF sub-func#8"
                        If ((\_SB.PCI0.LPC0.EC0.BATP == 0x46))
                        {
                            Return (Buffer (0x15)
                            {
                                /* 0000 */  0x10, 0x04, 0x11, 0x01, 0x64, 0x4A, 0x15, 0x00,  // ....dJ..
                                /* 0008 */  0x00, 0x30, 0x75, 0x00, 0x00, 0x98, 0x3A, 0x00,  // .0u...:.
                                /* 0010 */  0x00, 0xA8, 0x61, 0x00, 0x00                     // ..a..
                            })
                        }
                        Else
                        {
                            Return (Buffer (0x26)
                            {
                                /* 0000 */  0x10, 0x04, 0x11, 0x02, 0x64, 0x78, 0x1E, 0x00,  // ....dx..
                                /* 0008 */  0x00, 0x30, 0x75, 0x00, 0x00, 0x98, 0x3A, 0x00,  // .0u...:.
                                /* 0010 */  0x00, 0xA8, 0x61, 0x00, 0x00, 0x28, 0x70, 0x17,  // ..a..(p.
                                /* 0018 */  0x00, 0x00, 0x30, 0x75, 0x00, 0x00, 0x98, 0x3A,  // ..0u...:
                                /* 0020 */  0x00, 0x00, 0x98, 0x3A, 0x00, 0x00               // ...:..
                            })
                        }
                    }
                    Case (0x09)
                    {
                        Debug = "   NVPCF sub-func#9"
                        CreateDWordField (Arg3, 0x03, CPTD)
                        If ((ToInteger (CPTD) == Zero))
                        {
                            Local2 = (\_SB.PCI0.LPC0.EC0.SADP & 0xB0)
                            If ((Local2 == Zero))
                            {
                                \_SB.PCI0.LPC0.EC0.ERCD (Package (0x06)
                                    {
                                        0x45, 
                                        0xA0, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero
                                    })
                                \_SB.PCI0.LPC0.EC0.ERCD (Package (0x06)
                                    {
                                        0x45, 
                                        0xA0, 
                                        0x11, 
                                        0x2D, 
                                        Zero, 
                                        Zero
                                    })
                                \_SB.PCI0.LPC0.EC0.ERCD (Package (0x06)
                                    {
                                        0x45, 
                                        0xA0, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero
                                    })
                                \_SB.PCI0.LPC0.EC0.ERCD (Package (0x06)
                                    {
                                        0x45, 
                                        0xA0, 
                                        0x12, 
                                        0x2D, 
                                        Zero, 
                                        Zero
                                    })
                            }
                        }
                        Else
                        {
                            Local0 = Buffer (0x02)
                                {
                                     0x00                                             // .
                                }
                            Local1 = Buffer (0x06)
                                {
                                     0x00                                             // .
                                }
                            Divide (ToInteger (CPTD), 0x03E8, Local0 [One], Local0 [Zero]
                                )
                            \_SB.PCI0.LPC0.EC0.ERCD (Package (0x06)
                                {
                                    0x45, 
                                    0xA0, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                })
                            Local1 [Zero] = 0x45
                            Local1 [One] = 0xA0
                            Local1 [0x02] = 0x11
                            Local1 [0x03] = DerefOf (Local0 [Zero])
                            Local1 [0x04] = Zero
                            Local1 [0x05] = Zero
                            \_SB.PCI0.LPC0.EC0.ERCD (Local1)
                            Local2 = (DerefOf (Local0 [Zero]) * 0x7D)
                            Divide (Local2, 0x64, Local0 [One], Local0 [Zero])
                            \_SB.PCI0.LPC0.EC0.ERCD (Package (0x06)
                                {
                                    0x45, 
                                    0xA0, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                })
                            Local1 [Zero] = 0x45
                            Local1 [One] = 0xA0
                            Local1 [0x02] = 0x12
                            Local1 [0x03] = DerefOf (Local0 [Zero])
                            Local1 [0x04] = Zero
                            Local1 [0x05] = Zero
                            \_SB.PCI0.LPC0.EC0.ERCD (Local1)
                        }

                        Return (Zero)
                    }
                    Case (0x0A)
                    {
                        Debug = "   NVPCF sub-func#10"
                        Name (PBDA, Buffer (0x08)
                        {
                             0x00                                             // .
                        })
                        CreateByteField (PBDA, Zero, DTTV)
                        CreateByteField (PBDA, One, DTSH)
                        CreateByteField (PBDA, 0x02, DTSE)
                        CreateByteField (PBDA, 0x03, DTTE)
                        CreateDWordField (PBDA, 0x04, DTTL)
                        DTTV = 0x10
                        DTSH = 0x04
                        DTSE = 0x04
                        DTTE = One
                        DTTL = TPPL /* \_SB_.NPCF.TPPL */
                        Return (PBDA) /* \_SB_.NPCF.NPCF.PBDA */
                    }

                }

                Return (0x80000002)
            }
        }
    }

    Scope (\_SB.PCI0.GPP0.PEGP)
    {
        Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
        {
            Return (Package (0x01)
            {
                0x80087330
            })
        }
    }
}

