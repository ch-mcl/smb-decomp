.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global sin
sin:
/* 801088E8 00104808  7C 08 02 A6 */	mflr r0
/* 801088EC 0010480C  3C 60 3F E9 */	lis r3, 0x3FE921FB@ha
/* 801088F0 00104810  90 01 00 04 */	stw r0, 4(r1)
/* 801088F4 00104814  38 03 21 FB */	addi r0, r3, 0x3FE921FB@l
/* 801088F8 00104818  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801088FC 0010481C  D8 21 00 08 */	stfd f1, 8(r1)
/* 80108900 00104820  C8 42 C4 10 */	lfd f2, lbl_802F6C10@sda21(r2)
/* 80108904 00104824  80 61 00 08 */	lwz r3, 8(r1)
/* 80108908 00104828  54 63 00 7E */	clrlwi r3, r3, 1
/* 8010890C 0010482C  7C 03 00 00 */	cmpw r3, r0
/* 80108910 00104830  41 81 00 14 */	bgt lbl_80108924
/* 80108914 00104834  C8 21 00 08 */	lfd f1, 8(r1)
/* 80108918 00104838  38 60 00 00 */	li r3, 0
/* 8010891C 0010483C  4B FF FA 9D */	bl __kernel_sin
/* 80108920 00104840  48 00 00 9C */	b lbl_801089BC
lbl_80108924:
/* 80108924 00104844  3C 00 7F F0 */	lis r0, 0x7ff0
/* 80108928 00104848  7C 03 00 00 */	cmpw r3, r0
/* 8010892C 0010484C  41 80 00 10 */	blt lbl_8010893C
/* 80108930 00104850  C8 01 00 08 */	lfd f0, 8(r1)
/* 80108934 00104854  FC 20 00 28 */	fsub f1, f0, f0
/* 80108938 00104858  48 00 00 84 */	b lbl_801089BC
lbl_8010893C:
/* 8010893C 0010485C  C8 21 00 08 */	lfd f1, 8(r1)
/* 80108940 00104860  38 61 00 10 */	addi r3, r1, 0x10
/* 80108944 00104864  4B FF E4 65 */	bl __ieee754_rem_pio2
/* 80108948 00104868  54 60 07 BE */	clrlwi r0, r3, 0x1e
/* 8010894C 0010486C  2C 00 00 01 */	cmpwi r0, 1
/* 80108950 00104870  41 82 00 34 */	beq lbl_80108984
/* 80108954 00104874  40 80 00 10 */	bge lbl_80108964
/* 80108958 00104878  2C 00 00 00 */	cmpwi r0, 0
/* 8010895C 0010487C  40 80 00 14 */	bge lbl_80108970
/* 80108960 00104880  48 00 00 4C */	b lbl_801089AC
lbl_80108964:
/* 80108964 00104884  2C 00 00 03 */	cmpwi r0, 3
/* 80108968 00104888  40 80 00 44 */	bge lbl_801089AC
/* 8010896C 0010488C  48 00 00 28 */	b lbl_80108994
lbl_80108970:
/* 80108970 00104890  C8 21 00 10 */	lfd f1, 0x10(r1)
/* 80108974 00104894  38 60 00 01 */	li r3, 1
/* 80108978 00104898  C8 41 00 18 */	lfd f2, 0x18(r1)
/* 8010897C 0010489C  4B FF FA 3D */	bl __kernel_sin
/* 80108980 001048A0  48 00 00 3C */	b lbl_801089BC
lbl_80108984:
/* 80108984 001048A4  C8 21 00 10 */	lfd f1, 0x10(r1)
/* 80108988 001048A8  C8 41 00 18 */	lfd f2, 0x18(r1)
/* 8010898C 001048AC  4B FF E8 91 */	bl __kernel_cos
/* 80108990 001048B0  48 00 00 2C */	b lbl_801089BC
lbl_80108994:
/* 80108994 001048B4  C8 21 00 10 */	lfd f1, 0x10(r1)
/* 80108998 001048B8  38 60 00 01 */	li r3, 1
/* 8010899C 001048BC  C8 41 00 18 */	lfd f2, 0x18(r1)
/* 801089A0 001048C0  4B FF FA 19 */	bl __kernel_sin
/* 801089A4 001048C4  FC 20 08 50 */	fneg f1, f1
/* 801089A8 001048C8  48 00 00 14 */	b lbl_801089BC
lbl_801089AC:
/* 801089AC 001048CC  C8 21 00 10 */	lfd f1, 0x10(r1)
/* 801089B0 001048D0  C8 41 00 18 */	lfd f2, 0x18(r1)
/* 801089B4 001048D4  4B FF E8 69 */	bl __kernel_cos
/* 801089B8 001048D8  FC 20 08 50 */	fneg f1, f1
lbl_801089BC:
/* 801089BC 001048DC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801089C0 001048E0  38 21 00 20 */	addi r1, r1, 0x20
/* 801089C4 001048E4  7C 08 03 A6 */	mtlr r0
/* 801089C8 001048E8  4E 80 00 20 */	blr

.section .sdata2

.global lbl_802F6C10
lbl_802F6C10:
	# ROM: 0x1F0630
	.4byte 0
	.4byte 0
