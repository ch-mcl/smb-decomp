.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global HIOReadMailbox
HIOReadMailbox:
/* 800DBAE4 000D7A04  7C 08 02 A6 */	mflr r0
/* 800DBAE8 000D7A08  90 01 00 04 */	stw r0, 4(r1)
/* 800DBAEC 000D7A0C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800DBAF0 000D7A10  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800DBAF4 000D7A14  93 C1 00 10 */	stw r30, 0x10(r1)
/* 800DBAF8 000D7A18  3B C3 00 00 */	addi r30, r3, 0
/* 800DBAFC 000D7A1C  80 0D 97 C0 */	lwz r0, Chan@sda21(r13)
/* 800DBB00 000D7A20  2C 00 FF FF */	cmpwi r0, -1
/* 800DBB04 000D7A24  41 82 00 10 */	beq lbl_800DBB14
/* 800DBB08 000D7A28  4B FE 63 A9 */	bl __OSGetDIConfig
/* 800DBB0C 000D7A2C  28 03 00 FF */	cmplwi r3, 0xff
/* 800DBB10 000D7A30  40 82 00 0C */	bne lbl_800DBB1C
lbl_800DBB14:
/* 800DBB14 000D7A34  38 60 00 00 */	li r3, 0
/* 800DBB18 000D7A38  48 00 00 E4 */	b lbl_800DBBFC
lbl_800DBB1C:
/* 800DBB1C 000D7A3C  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBB20 000D7A40  38 80 00 00 */	li r4, 0
/* 800DBB24 000D7A44  38 A0 00 00 */	li r5, 0
/* 800DBB28 000D7A48  4B FE 95 A5 */	bl EXILock
/* 800DBB2C 000D7A4C  2C 03 00 00 */	cmpwi r3, 0
/* 800DBB30 000D7A50  40 82 00 0C */	bne lbl_800DBB3C
/* 800DBB34 000D7A54  38 60 00 00 */	li r3, 0
/* 800DBB38 000D7A58  48 00 00 C4 */	b lbl_800DBBFC
lbl_800DBB3C:
/* 800DBB3C 000D7A5C  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBB40 000D7A60  38 80 00 00 */	li r4, 0
/* 800DBB44 000D7A64  38 A0 00 04 */	li r5, 4
/* 800DBB48 000D7A68  4B FE 8F 25 */	bl EXISelect
/* 800DBB4C 000D7A6C  2C 03 00 00 */	cmpwi r3, 0
/* 800DBB50 000D7A70  40 82 00 14 */	bne lbl_800DBB64
/* 800DBB54 000D7A74  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBB58 000D7A78  4B FE 96 69 */	bl EXIUnlock
/* 800DBB5C 000D7A7C  38 60 00 00 */	li r3, 0
/* 800DBB60 000D7A80  48 00 00 9C */	b lbl_800DBBFC
lbl_800DBB64:
/* 800DBB64 000D7A84  3C 00 60 00 */	lis r0, 0x6000
/* 800DBB68 000D7A88  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBB6C 000D7A8C  90 01 00 0C */	stw r0, 0xc(r1)
/* 800DBB70 000D7A90  38 81 00 0C */	addi r4, r1, 0xc
/* 800DBB74 000D7A94  38 A0 00 02 */	li r5, 2
/* 800DBB78 000D7A98  38 C0 00 01 */	li r6, 1
/* 800DBB7C 000D7A9C  38 E0 00 00 */	li r7, 0
/* 800DBB80 000D7AA0  4B FE 84 D1 */	bl EXIImm
/* 800DBB84 000D7AA4  7C 60 00 34 */	cntlzw r0, r3
/* 800DBB88 000D7AA8  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBB8C 000D7AAC  54 1F D9 7E */	srwi r31, r0, 5
/* 800DBB90 000D7AB0  4B FE 88 A9 */	bl EXISync
/* 800DBB94 000D7AB4  7C 60 00 34 */	cntlzw r0, r3
/* 800DBB98 000D7AB8  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBB9C 000D7ABC  54 00 D9 7E */	srwi r0, r0, 5
/* 800DBBA0 000D7AC0  38 9E 00 00 */	addi r4, r30, 0
/* 800DBBA4 000D7AC4  7F FF 03 78 */	or r31, r31, r0
/* 800DBBA8 000D7AC8  38 A0 00 04 */	li r5, 4
/* 800DBBAC 000D7ACC  38 C0 00 00 */	li r6, 0
/* 800DBBB0 000D7AD0  38 E0 00 00 */	li r7, 0
/* 800DBBB4 000D7AD4  4B FE 84 9D */	bl EXIImm
/* 800DBBB8 000D7AD8  7C 60 00 34 */	cntlzw r0, r3
/* 800DBBBC 000D7ADC  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBBC0 000D7AE0  54 00 D9 7E */	srwi r0, r0, 5
/* 800DBBC4 000D7AE4  7F FF 03 78 */	or r31, r31, r0
/* 800DBBC8 000D7AE8  4B FE 88 71 */	bl EXISync
/* 800DBBCC 000D7AEC  7C 60 00 34 */	cntlzw r0, r3
/* 800DBBD0 000D7AF0  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBBD4 000D7AF4  54 00 D9 7E */	srwi r0, r0, 5
/* 800DBBD8 000D7AF8  7F FF 03 78 */	or r31, r31, r0
/* 800DBBDC 000D7AFC  4B FE 8F BD */	bl EXIDeselect
/* 800DBBE0 000D7B00  7C 60 00 34 */	cntlzw r0, r3
/* 800DBBE4 000D7B04  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBBE8 000D7B08  54 00 D9 7E */	srwi r0, r0, 5
/* 800DBBEC 000D7B0C  7F FF 03 78 */	or r31, r31, r0
/* 800DBBF0 000D7B10  4B FE 95 D1 */	bl EXIUnlock
/* 800DBBF4 000D7B14  7F E0 00 34 */	cntlzw r0, r31
/* 800DBBF8 000D7B18  54 03 D9 7E */	srwi r3, r0, 5
lbl_800DBBFC:
/* 800DBBFC 000D7B1C  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800DBC00 000D7B20  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800DBC04 000D7B24  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800DBC08 000D7B28  7C 08 03 A6 */	mtlr r0
/* 800DBC0C 000D7B2C  38 21 00 18 */	addi r1, r1, 0x18
/* 800DBC10 000D7B30  4E 80 00 20 */	blr

.global HIOWriteMailbox
HIOWriteMailbox:
/* 800DBC14 000D7B34  7C 08 02 A6 */	mflr r0
/* 800DBC18 000D7B38  90 01 00 04 */	stw r0, 4(r1)
/* 800DBC1C 000D7B3C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800DBC20 000D7B40  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800DBC24 000D7B44  3B E3 00 00 */	addi r31, r3, 0
/* 800DBC28 000D7B48  80 0D 97 C0 */	lwz r0, Chan@sda21(r13)
/* 800DBC2C 000D7B4C  2C 00 FF FF */	cmpwi r0, -1
/* 800DBC30 000D7B50  41 82 00 10 */	beq lbl_800DBC40
/* 800DBC34 000D7B54  4B FE 62 7D */	bl __OSGetDIConfig
/* 800DBC38 000D7B58  28 03 00 FF */	cmplwi r3, 0xff
/* 800DBC3C 000D7B5C  40 82 00 0C */	bne lbl_800DBC48
lbl_800DBC40:
/* 800DBC40 000D7B60  38 60 00 00 */	li r3, 0
/* 800DBC44 000D7B64  48 00 00 B0 */	b lbl_800DBCF4
lbl_800DBC48:
/* 800DBC48 000D7B68  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBC4C 000D7B6C  38 80 00 00 */	li r4, 0
/* 800DBC50 000D7B70  38 A0 00 00 */	li r5, 0
/* 800DBC54 000D7B74  4B FE 94 79 */	bl EXILock
/* 800DBC58 000D7B78  2C 03 00 00 */	cmpwi r3, 0
/* 800DBC5C 000D7B7C  40 82 00 0C */	bne lbl_800DBC68
/* 800DBC60 000D7B80  38 60 00 00 */	li r3, 0
/* 800DBC64 000D7B84  48 00 00 90 */	b lbl_800DBCF4
lbl_800DBC68:
/* 800DBC68 000D7B88  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBC6C 000D7B8C  38 80 00 00 */	li r4, 0
/* 800DBC70 000D7B90  38 A0 00 04 */	li r5, 4
/* 800DBC74 000D7B94  4B FE 8D F9 */	bl EXISelect
/* 800DBC78 000D7B98  2C 03 00 00 */	cmpwi r3, 0
/* 800DBC7C 000D7B9C  40 82 00 14 */	bne lbl_800DBC90
/* 800DBC80 000D7BA0  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBC84 000D7BA4  4B FE 95 3D */	bl EXIUnlock
/* 800DBC88 000D7BA8  38 60 00 00 */	li r3, 0
/* 800DBC8C 000D7BAC  48 00 00 68 */	b lbl_800DBCF4
lbl_800DBC90:
/* 800DBC90 000D7BB0  57 E0 00 FE */	clrlwi r0, r31, 3
/* 800DBC94 000D7BB4  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBC98 000D7BB8  64 00 C0 00 */	oris r0, r0, 0xc000
/* 800DBC9C 000D7BBC  90 01 00 0C */	stw r0, 0xc(r1)
/* 800DBCA0 000D7BC0  38 81 00 0C */	addi r4, r1, 0xc
/* 800DBCA4 000D7BC4  38 A0 00 04 */	li r5, 4
/* 800DBCA8 000D7BC8  38 C0 00 01 */	li r6, 1
/* 800DBCAC 000D7BCC  38 E0 00 00 */	li r7, 0
/* 800DBCB0 000D7BD0  4B FE 83 A1 */	bl EXIImm
/* 800DBCB4 000D7BD4  7C 60 00 34 */	cntlzw r0, r3
/* 800DBCB8 000D7BD8  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBCBC 000D7BDC  54 1F D9 7E */	srwi r31, r0, 5
/* 800DBCC0 000D7BE0  4B FE 87 79 */	bl EXISync
/* 800DBCC4 000D7BE4  7C 60 00 34 */	cntlzw r0, r3
/* 800DBCC8 000D7BE8  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBCCC 000D7BEC  54 00 D9 7E */	srwi r0, r0, 5
/* 800DBCD0 000D7BF0  7F FF 03 78 */	or r31, r31, r0
/* 800DBCD4 000D7BF4  4B FE 8E C5 */	bl EXIDeselect
/* 800DBCD8 000D7BF8  7C 60 00 34 */	cntlzw r0, r3
/* 800DBCDC 000D7BFC  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBCE0 000D7C00  54 00 D9 7E */	srwi r0, r0, 5
/* 800DBCE4 000D7C04  7F FF 03 78 */	or r31, r31, r0
/* 800DBCE8 000D7C08  4B FE 94 D9 */	bl EXIUnlock
/* 800DBCEC 000D7C0C  7F E0 00 34 */	cntlzw r0, r31
/* 800DBCF0 000D7C10  54 03 D9 7E */	srwi r3, r0, 5
lbl_800DBCF4:
/* 800DBCF4 000D7C14  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800DBCF8 000D7C18  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800DBCFC 000D7C1C  38 21 00 18 */	addi r1, r1, 0x18
/* 800DBD00 000D7C20  7C 08 03 A6 */	mtlr r0
/* 800DBD04 000D7C24  4E 80 00 20 */	blr

.global HIORead
HIORead:
/* 800DBD08 000D7C28  7C 08 02 A6 */	mflr r0
/* 800DBD0C 000D7C2C  90 01 00 04 */	stw r0, 4(r1)
/* 800DBD10 000D7C30  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 800DBD14 000D7C34  93 E1 00 24 */	stw r31, 0x24(r1)
/* 800DBD18 000D7C38  3B E3 00 00 */	addi r31, r3, 0
/* 800DBD1C 000D7C3C  93 C1 00 20 */	stw r30, 0x20(r1)
/* 800DBD20 000D7C40  3B C5 00 00 */	addi r30, r5, 0
/* 800DBD24 000D7C44  93 A1 00 1C */	stw r29, 0x1c(r1)
/* 800DBD28 000D7C48  3B A4 00 00 */	addi r29, r4, 0
/* 800DBD2C 000D7C4C  80 0D 97 C0 */	lwz r0, Chan@sda21(r13)
/* 800DBD30 000D7C50  2C 00 FF FF */	cmpwi r0, -1
/* 800DBD34 000D7C54  41 82 00 10 */	beq lbl_800DBD44
/* 800DBD38 000D7C58  4B FE 61 79 */	bl __OSGetDIConfig
/* 800DBD3C 000D7C5C  28 03 00 FF */	cmplwi r3, 0xff
/* 800DBD40 000D7C60  40 82 00 0C */	bne lbl_800DBD4C
lbl_800DBD44:
/* 800DBD44 000D7C64  38 60 00 00 */	li r3, 0
/* 800DBD48 000D7C68  48 00 00 E8 */	b lbl_800DBE30
lbl_800DBD4C:
/* 800DBD4C 000D7C6C  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBD50 000D7C70  38 80 00 00 */	li r4, 0
/* 800DBD54 000D7C74  38 A0 00 00 */	li r5, 0
/* 800DBD58 000D7C78  4B FE 93 75 */	bl EXILock
/* 800DBD5C 000D7C7C  2C 03 00 00 */	cmpwi r3, 0
/* 800DBD60 000D7C80  40 82 00 0C */	bne lbl_800DBD6C
/* 800DBD64 000D7C84  38 60 00 00 */	li r3, 0
/* 800DBD68 000D7C88  48 00 00 C8 */	b lbl_800DBE30
lbl_800DBD6C:
/* 800DBD6C 000D7C8C  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBD70 000D7C90  38 80 00 00 */	li r4, 0
/* 800DBD74 000D7C94  38 A0 00 04 */	li r5, 4
/* 800DBD78 000D7C98  4B FE 8C F5 */	bl EXISelect
/* 800DBD7C 000D7C9C  2C 03 00 00 */	cmpwi r3, 0
/* 800DBD80 000D7CA0  40 82 00 14 */	bne lbl_800DBD94
/* 800DBD84 000D7CA4  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBD88 000D7CA8  4B FE 94 39 */	bl EXIUnlock
/* 800DBD8C 000D7CAC  38 60 00 00 */	li r3, 0
/* 800DBD90 000D7CB0  48 00 00 A0 */	b lbl_800DBE30
lbl_800DBD94:
/* 800DBD94 000D7CB4  57 E0 41 EA */	rlwinm r0, r31, 8, 7, 0x15
/* 800DBD98 000D7CB8  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBD9C 000D7CBC  64 00 20 00 */	oris r0, r0, 0x2000
/* 800DBDA0 000D7CC0  90 01 00 14 */	stw r0, 0x14(r1)
/* 800DBDA4 000D7CC4  38 81 00 14 */	addi r4, r1, 0x14
/* 800DBDA8 000D7CC8  38 A0 00 04 */	li r5, 4
/* 800DBDAC 000D7CCC  38 C0 00 01 */	li r6, 1
/* 800DBDB0 000D7CD0  38 E0 00 00 */	li r7, 0
/* 800DBDB4 000D7CD4  4B FE 82 9D */	bl EXIImm
/* 800DBDB8 000D7CD8  7C 60 00 34 */	cntlzw r0, r3
/* 800DBDBC 000D7CDC  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBDC0 000D7CE0  54 1F D9 7E */	srwi r31, r0, 5
/* 800DBDC4 000D7CE4  4B FE 86 75 */	bl EXISync
/* 800DBDC8 000D7CE8  7C 60 00 34 */	cntlzw r0, r3
/* 800DBDCC 000D7CEC  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBDD0 000D7CF0  54 00 D9 7E */	srwi r0, r0, 5
/* 800DBDD4 000D7CF4  38 9D 00 00 */	addi r4, r29, 0
/* 800DBDD8 000D7CF8  38 BE 00 00 */	addi r5, r30, 0
/* 800DBDDC 000D7CFC  7F FF 03 78 */	or r31, r31, r0
/* 800DBDE0 000D7D00  38 C0 00 00 */	li r6, 0
/* 800DBDE4 000D7D04  38 E0 00 00 */	li r7, 0
/* 800DBDE8 000D7D08  4B FE 85 65 */	bl EXIDma
/* 800DBDEC 000D7D0C  7C 60 00 34 */	cntlzw r0, r3
/* 800DBDF0 000D7D10  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBDF4 000D7D14  54 00 D9 7E */	srwi r0, r0, 5
/* 800DBDF8 000D7D18  7F FF 03 78 */	or r31, r31, r0
/* 800DBDFC 000D7D1C  4B FE 86 3D */	bl EXISync
/* 800DBE00 000D7D20  7C 60 00 34 */	cntlzw r0, r3
/* 800DBE04 000D7D24  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBE08 000D7D28  54 00 D9 7E */	srwi r0, r0, 5
/* 800DBE0C 000D7D2C  7F FF 03 78 */	or r31, r31, r0
/* 800DBE10 000D7D30  4B FE 8D 89 */	bl EXIDeselect
/* 800DBE14 000D7D34  7C 60 00 34 */	cntlzw r0, r3
/* 800DBE18 000D7D38  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBE1C 000D7D3C  54 00 D9 7E */	srwi r0, r0, 5
/* 800DBE20 000D7D40  7F FF 03 78 */	or r31, r31, r0
/* 800DBE24 000D7D44  4B FE 93 9D */	bl EXIUnlock
/* 800DBE28 000D7D48  7F E0 00 34 */	cntlzw r0, r31
/* 800DBE2C 000D7D4C  54 03 D9 7E */	srwi r3, r0, 5
lbl_800DBE30:
/* 800DBE30 000D7D50  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 800DBE34 000D7D54  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 800DBE38 000D7D58  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 800DBE3C 000D7D5C  7C 08 03 A6 */	mtlr r0
/* 800DBE40 000D7D60  83 A1 00 1C */	lwz r29, 0x1c(r1)
/* 800DBE44 000D7D64  38 21 00 28 */	addi r1, r1, 0x28
/* 800DBE48 000D7D68  4E 80 00 20 */	blr

.global HIOWrite
HIOWrite:
/* 800DBE4C 000D7D6C  7C 08 02 A6 */	mflr r0
/* 800DBE50 000D7D70  90 01 00 04 */	stw r0, 4(r1)
/* 800DBE54 000D7D74  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 800DBE58 000D7D78  93 E1 00 24 */	stw r31, 0x24(r1)
/* 800DBE5C 000D7D7C  3B E3 00 00 */	addi r31, r3, 0
/* 800DBE60 000D7D80  93 C1 00 20 */	stw r30, 0x20(r1)
/* 800DBE64 000D7D84  3B C5 00 00 */	addi r30, r5, 0
/* 800DBE68 000D7D88  93 A1 00 1C */	stw r29, 0x1c(r1)
/* 800DBE6C 000D7D8C  3B A4 00 00 */	addi r29, r4, 0
/* 800DBE70 000D7D90  80 0D 97 C0 */	lwz r0, Chan@sda21(r13)
/* 800DBE74 000D7D94  2C 00 FF FF */	cmpwi r0, -1
/* 800DBE78 000D7D98  41 82 00 10 */	beq lbl_800DBE88
/* 800DBE7C 000D7D9C  4B FE 60 35 */	bl __OSGetDIConfig
/* 800DBE80 000D7DA0  28 03 00 FF */	cmplwi r3, 0xff
/* 800DBE84 000D7DA4  40 82 00 0C */	bne lbl_800DBE90
lbl_800DBE88:
/* 800DBE88 000D7DA8  38 60 00 00 */	li r3, 0
/* 800DBE8C 000D7DAC  48 00 00 E8 */	b lbl_800DBF74
lbl_800DBE90:
/* 800DBE90 000D7DB0  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBE94 000D7DB4  38 80 00 00 */	li r4, 0
/* 800DBE98 000D7DB8  38 A0 00 00 */	li r5, 0
/* 800DBE9C 000D7DBC  4B FE 92 31 */	bl EXILock
/* 800DBEA0 000D7DC0  2C 03 00 00 */	cmpwi r3, 0
/* 800DBEA4 000D7DC4  40 82 00 0C */	bne lbl_800DBEB0
/* 800DBEA8 000D7DC8  38 60 00 00 */	li r3, 0
/* 800DBEAC 000D7DCC  48 00 00 C8 */	b lbl_800DBF74
lbl_800DBEB0:
/* 800DBEB0 000D7DD0  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBEB4 000D7DD4  38 80 00 00 */	li r4, 0
/* 800DBEB8 000D7DD8  38 A0 00 04 */	li r5, 4
/* 800DBEBC 000D7DDC  4B FE 8B B1 */	bl EXISelect
/* 800DBEC0 000D7DE0  2C 03 00 00 */	cmpwi r3, 0
/* 800DBEC4 000D7DE4  40 82 00 14 */	bne lbl_800DBED8
/* 800DBEC8 000D7DE8  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBECC 000D7DEC  4B FE 92 F5 */	bl EXIUnlock
/* 800DBED0 000D7DF0  38 60 00 00 */	li r3, 0
/* 800DBED4 000D7DF4  48 00 00 A0 */	b lbl_800DBF74
lbl_800DBED8:
/* 800DBED8 000D7DF8  57 E0 41 EA */	rlwinm r0, r31, 8, 7, 0x15
/* 800DBEDC 000D7DFC  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBEE0 000D7E00  64 00 A0 00 */	oris r0, r0, 0xa000
/* 800DBEE4 000D7E04  90 01 00 14 */	stw r0, 0x14(r1)
/* 800DBEE8 000D7E08  38 81 00 14 */	addi r4, r1, 0x14
/* 800DBEEC 000D7E0C  38 A0 00 04 */	li r5, 4
/* 800DBEF0 000D7E10  38 C0 00 01 */	li r6, 1
/* 800DBEF4 000D7E14  38 E0 00 00 */	li r7, 0
/* 800DBEF8 000D7E18  4B FE 81 59 */	bl EXIImm
/* 800DBEFC 000D7E1C  7C 60 00 34 */	cntlzw r0, r3
/* 800DBF00 000D7E20  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBF04 000D7E24  54 1F D9 7E */	srwi r31, r0, 5
/* 800DBF08 000D7E28  4B FE 85 31 */	bl EXISync
/* 800DBF0C 000D7E2C  7C 60 00 34 */	cntlzw r0, r3
/* 800DBF10 000D7E30  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBF14 000D7E34  54 00 D9 7E */	srwi r0, r0, 5
/* 800DBF18 000D7E38  38 9D 00 00 */	addi r4, r29, 0
/* 800DBF1C 000D7E3C  38 BE 00 00 */	addi r5, r30, 0
/* 800DBF20 000D7E40  7F FF 03 78 */	or r31, r31, r0
/* 800DBF24 000D7E44  38 C0 00 01 */	li r6, 1
/* 800DBF28 000D7E48  38 E0 00 00 */	li r7, 0
/* 800DBF2C 000D7E4C  4B FE 84 21 */	bl EXIDma
/* 800DBF30 000D7E50  7C 60 00 34 */	cntlzw r0, r3
/* 800DBF34 000D7E54  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBF38 000D7E58  54 00 D9 7E */	srwi r0, r0, 5
/* 800DBF3C 000D7E5C  7F FF 03 78 */	or r31, r31, r0
/* 800DBF40 000D7E60  4B FE 84 F9 */	bl EXISync
/* 800DBF44 000D7E64  7C 60 00 34 */	cntlzw r0, r3
/* 800DBF48 000D7E68  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBF4C 000D7E6C  54 00 D9 7E */	srwi r0, r0, 5
/* 800DBF50 000D7E70  7F FF 03 78 */	or r31, r31, r0
/* 800DBF54 000D7E74  4B FE 8C 45 */	bl EXIDeselect
/* 800DBF58 000D7E78  7C 60 00 34 */	cntlzw r0, r3
/* 800DBF5C 000D7E7C  80 6D 97 C0 */	lwz r3, Chan@sda21(r13)
/* 800DBF60 000D7E80  54 00 D9 7E */	srwi r0, r0, 5
/* 800DBF64 000D7E84  7F FF 03 78 */	or r31, r31, r0
/* 800DBF68 000D7E88  4B FE 92 59 */	bl EXIUnlock
/* 800DBF6C 000D7E8C  7F E0 00 34 */	cntlzw r0, r31
/* 800DBF70 000D7E90  54 03 D9 7E */	srwi r3, r0, 5
lbl_800DBF74:
/* 800DBF74 000D7E94  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 800DBF78 000D7E98  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 800DBF7C 000D7E9C  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 800DBF80 000D7EA0  7C 08 03 A6 */	mtlr r0
/* 800DBF84 000D7EA4  83 A1 00 1C */	lwz r29, 0x1c(r1)
/* 800DBF88 000D7EA8  38 21 00 28 */	addi r1, r1, 0x28
/* 800DBF8C 000D7EAC  4E 80 00 20 */	blr
