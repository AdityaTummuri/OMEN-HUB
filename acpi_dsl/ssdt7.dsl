/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20260408 (64-bit version)
 * Copyright (c) 2000 - 2026 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ssdt7.dat
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000021E (542)
 *     Revision         0x01
 *     Checksum         0x23
 *     OEM ID           "HPQOEM"
 *     OEM Table ID     "8BCD    "
 *     OEM Revision     0x00000002 (2)
 *     Compiler ID      "HP  "
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("", "SSDT", 1, "HPQOEM", "8BCD    ", 0x00000002)
{
    External (HROL, IntObj)
    External (POS1, UnknownObj)
    External (POS2, UnknownObj)
    External (POS3, UnknownObj)
    External (POS4, UnknownObj)
    External (POS5, UnknownObj)
    External (POSV, UnknownObj)
    External (W10S, UnknownObj)
    External (WOAS, IntObj)

    Scope (\_SB)
    {
        Device (IPPF)
        {
            Name (_HID, "HPIC0003")  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (((POSV == 0x57) && (POS1 == 0x31)))
                {
                    If (((POS2 == 0x30) && (POS3 == 0x52)))
                    {
                        If (((POS4 == 0x53) && (POS5 < 0x34)))
                        {
                            Return (Zero)
                        }
                    }
                }

                If (((POSV == 0x57) && (POS1 == 0x31)))
                {
                    If (((POS2 == 0x30) && (POS3 == 0x52)))
                    {
                        If (((POS4 == 0x53) && (POS5 == 0x34)))
                        {
                            If ((W10S != One))
                            {
                                Return (Zero)
                            }
                        }
                    }
                }

                Return (0x0F)
            }
        }

        Device (HRBL)
        {
            Name (_HID, "HPIC0014")  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\HROL == One))
                {
                    Return (0x0F)
                }

                If ((\WOAS == One))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (STXS, 1, NotSerialized)
            {
                Name (STPX, Buffer (One)
                {
                     0x00                                             // .
                })
                STPX = Arg0
                CreateByteField (STPX, Zero, STPS)
                If ((STPS == 0x05)){}
                If ((STPS == 0x06)){}
                If ((STPS == 0x07)){}
            }

            Method (ACWK, 1, NotSerialized)
            {
                Return (Zero)
            }
        }

        Device (IC04)
        {
            Name (_HID, "HPIC0004")  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (((POSV == 0x57) && (POS1 == 0x31)))
                {
                    If (((POS2 == 0x30) && (POS3 == 0x52)))
                    {
                        If (((POS4 == 0x53) && (POS5 < 0x34)))
                        {
                            Return (Zero)
                        }
                    }
                }

                If (((POSV == 0x57) && (POS1 == 0x31)))
                {
                    If (((POS2 == 0x30) && (POS3 == 0x52)))
                    {
                        If (((POS4 == 0x53) && (POS5 == 0x34)))
                        {
                            If ((W10S != One))
                            {
                                Return (Zero)
                            }
                        }
                    }
                }

                Return (0x0F)
            }
        }
    }
}

