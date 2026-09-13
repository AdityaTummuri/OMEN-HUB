/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20260408 (64-bit version)
 * Copyright (c) 2000 - 2026 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ssdt31.dat
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000008D (141)
 *     Revision         0x02
 *     Checksum         0x41
 *     OEM ID           "HPQOEM"
 *     OEM Table ID     "8BCD    "
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "HP  "
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("", "SSDT", 2, "HPQOEM", "8BCD    ", 0x00000001)
{
    External (_SB_.PLTF, DeviceObj)

    Scope (\_SB.PLTF)
    {
        Name (_LPI, Package (0x04)  // _LPI: Low Power Idle States
        {
            Zero, 
            Zero, 
            One, 
            Package (0x0A)
            {
                0x000F4240, 
                0xC350, 
                One, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Buffer (0x11)
                {
                    /* 0000 */  0x82, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                    /* 0010 */  0x00                                             // .
                }, 

                Buffer (0x11)
                {
                    /* 0000 */  0x82, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                    /* 0010 */  0x00                                             // .
                }, 

                "S0i3"
            }
        })
    }
}

