/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20260408 (64-bit version)
 * Copyright (c) 2000 - 2026 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ssdt1.dat
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000222 (546)
 *     Revision         0x01
 *     Checksum         0x09
 *     OEM ID           "HPQOEM"
 *     OEM Table ID     "8BCD    "
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "HP  "
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("", "SSDT", 1, "HPQOEM", "8BCD    ", 0x00000001)
{
    External (_SB_.ACDC.STSL, UnknownObj)

    Scope (\_SB)
    {
        Device (ACDC)
        {
            Name (_HID, "ACPI000E" /* Time and Alarm Device */)  // _HID: Hardware ID
            Name (_CRS, Buffer (0x25)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x8C, 0x20, 0x00, 0x01, 0x00, 0x01, 0x00, 0x1B,  // . ......
                /* 0008 */  0x00, 0x01, 0x00, 0x00, 0xB8, 0x0B, 0x17, 0x00,  // ........
                /* 0010 */  0x00, 0x19, 0x00, 0x23, 0x00, 0x00, 0x00, 0x34,  // ...#...4
                /* 0018 */  0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x47, 0x50,  // .\_SB.GP
                /* 0020 */  0x49, 0x4F, 0x00, 0x79, 0x00                     // IO.y.
            })
            OperationRegion (IOMX, SystemMemory, 0xFED80D00, 0x0100)
            Field (IOMX, AnyAcc, NoLock, Preserve)
            {
                Offset (0x17), 
                IM17,   8
            }

            OperationRegion (CMOP, SystemMemory, 0xFED81D00, 0x0100)
            Field (CMOP, DWordAcc, NoLock, Preserve)
            {
                ATVE,   32, 
                AETP,   32, 
                ATED,   1, 
                ATWP,   1, 
                Offset (0x10), 
                DTVE,   32, 
                DETP,   32, 
                DTED,   1, 
                DTWP,   1, 
                Offset (0x20), 
                BUSY,   1, 
                Offset (0x21), 
                ATEE,   1, 
                DTEE,   1
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((STSL == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                IM17 = Zero
                ATEE = One
                DTEE = One
            }

            Method (AINI, 0, NotSerialized)
            {
                IM17 = Zero
                ATEE = One
            }

            Method (DINI, 0, NotSerialized)
            {
                IM17 = Zero
                DTEE = One
            }

            Method (_GCP, 0, NotSerialized)  // _GCP: Get Capabilities
            {
                Return (0x03)
            }

            Method (_STP, 2, NotSerialized)  // _STP: Set Expired Timer Wake Policy
            {
                If ((Arg0 == Zero))
                {
                    AETP = Arg1
                }
                Else
                {
                    DETP = Arg1
                }

                Return (Zero)
            }

            Method (_TIP, 1, NotSerialized)  // _TIP: Expired Timer Wake Policy
            {
                If ((Arg0 == One))
                {
                    Local0 = DETP /* \_SB_.ACDC.DETP */
                }
                Else
                {
                    Local0 = AETP /* \_SB_.ACDC.AETP */
                }

                Return (Local0)
            }

            Method (_STV, 2, NotSerialized)  // _STV: Set Timer Value
            {
                If ((Arg0 == Zero))
                {
                    AINI ()
                    ATVE = Arg1
                }
                Else
                {
                    DINI ()
                    DTVE = Arg1
                }

                Return (Zero)
            }

            Method (_TIV, 1, NotSerialized)  // _TIV: Timer Values
            {
                If ((Arg0 == One))
                {
                    Local0 = DTVE /* \_SB_.ACDC.DTVE */
                }
                Else
                {
                    Local0 = ATVE /* \_SB_.ACDC.ATVE */
                }

                Return (Local0)
            }

            Method (_GWS, 1, NotSerialized)  // _GWS: Get Wake Status
            {
                Local0 = Zero
                If ((Arg0 == One))
                {
                    Local0 |= DTED
                    Local0 |= (DTWP << One)
                }
                Else
                {
                    Local0 |= ATED
                    Local0 |= (ATWP << One)
                }

                Return (Local0)
            }

            Method (_CWS, 1, NotSerialized)  // _CWS: Clear Wake Alarm Status
            {
                If ((Arg0 == Zero))
                {
                    ATWP = One
                }
                Else
                {
                    DTWP = One
                }

                Return (Zero)
            }
        }
    }
}

