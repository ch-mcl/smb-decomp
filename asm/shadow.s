.include "macros.inc"

.section .text

.global func_800924CC
func_800924CC:
/* 800924CC 0008E3EC  7C 08 02 A6 */	mflr r0
/* 800924D0 0008E3F0  3C 60 80 2B */	lis r3, shadow@ha
/* 800924D4 0008E3F4  90 01 00 04 */	stw r0, 4(r1)					/* mem[r1 + 4] = r0 */
/* 800924D8 0008E3F8  38 80 00 00 */	li r4, 0						/* r4 = 0 */
/* 800924DC 0008E3FC  38 A0 00 20 */	li r5, 0x20						/* r5 = 0x20 */
/* 800924E0 0008E400  94 21 FF D0 */	stwu r1, -0x30(r1) /* Mem[r1 - 0x30] =r1 */
/* 800924E4 0008E404  93 E1 00 2C */	stw r31, 0x2c(r1) /* Mem[r1 + 0x2C] =r31 */ /* stack r31 value */
/* 800924E8 0008E408  3B E3 57 A0 */	addi r31, r3, shadow@l			/* r31 = shadow */
/* 800924EC 0008E40C  93 C1 00 28 */	stw r30, 0x28(r1) /* Mem[r1 + 0x28] = r30 */ /* stack r30 value */
/* 800924F0 0008E410  3B DF 38 00 */	addi r30, r31, 0x3800			/* r30 = r31 + 0x3800 */
/* 800924F4 0008E414  93 A1 00 24 */	stw r29, 0x24(r1) /* Mem[r1 + 0x24] = r29 */ /* stack r29 value */
/* 800924F8 0008E418  3B BF 38 20 */	addi r29, r31, 0x3820 			/* r29 = r31 + 0x3820 */
/* 800924FC 0008E41C  93 81 00 20 */	stw r28, 0x20(r1) /* Mem[r1 + 0x20] = r28 */ /* stack r28 value */
/* 80092500 0008E420  3B 9D 00 00 */	addi r28, r29, 0				/* r28 = (shadow + 0x3820) */
/* 80092504 0008E424  38 7C 00 00 */	addi r3, r28, 0					/* r3 = shadow + 0x3820 */ /* r3 = lbl_802B8FA0.imagePtrs[0] */
/* 80092508 0008E428  4B F7 0E 19 */	bl memset						/* memset((shadow + 0x3820), 0x00, 0x20) */
/* 8009250C 0008E42C  38 7C 00 20 */	addi r3, r28, 0x20				/* r3 = (shadow + 0x3820) + 0x20 */ /* r3 = lbl_802B8FA0.unk040[0] */
/* 80092510 0008E430  38 80 00 FF */	li r4, 0xff						/* r4 = 0xff */
/* 80092514 0008E434  38 A0 00 20 */	li r5, 0x20						/* r5 = 0x20 */
/* 80092518 0008E438  4B F7 0E 09 */	bl memset						/* memset(((shadow + 0x3820) + 0x20), 0xff, 0x20) */

/* sec1 */
/* 8009251C 0008E43C  C0 E2 AF 80 */	lfs f7, l_lbl_802F5780@sda21(r2)	/* f7 = 255.0f */
/* 80092520 0008E440  38 C0 00 04 */	li r6, 4 						/* r6 = 4 */
/* 80092524 0008E444  C0 C2 AF 84 */	lfs f6, l_lbl_802F5784@sda21(r2)	/* f6 = 0.021276595f */
/* 80092528 0008E448  3C 60 43 30 */	lis r3, 0x4330 /* r3 = 0x4330 */
/* 8009252C 0008E44C  C8 A2 AF 90 */	lfd f5, l_shadow_s32_to_float@sda21(r2)	/* f5 = l_shadow_s32_to_float */
/* 80092530 0008E450  3B 9C 00 40 */	addi r28, r28, 0x40				/* r28 = (shadow + 0x3820) + 0x40 */

/*
int i; // sp9(ctr)
int j;
for (
	i = 4;
	i > 0;
	i--;
) {
	for (
		j = 2;
		j 
		j--;
	) {

	}
}


{
	{ [], [], [], [] }, <- next
	{ [], [], [], [] }  <- first
}

*/
lbl_80092534:
/* 80092534 0008E454  38 00 00 02 */	li r0, 2 /* r0 = 2 */
/* 80092538 0008E458  7C 09 03 A6 */	mtctr r0 /* mtspr 9, r0 */ /* ctr = 2 */
/* 8009253C 0008E45C  38 A0 00 08 */	li r5, 8						/* r5 = 8 */
lbl_80092540:
/* 80092540 0008E460  38 85 00 27 */	addi r4, r5, 0x27 /* r4 = r5 + 0x27 */
/* 80092544 0008E464  6C 80 80 00 */	xoris r0, r4, 0x8000 /* r0 = (r5 + 0x27) xor 0x8000 */
/* 80092548 0008E468  90 01 00 1C */	stw r0, 0x1c(r1)				/* Mem[r1 + 0x1C] = (r5 + 0x27) xor 0x8000 */

/* 8009254C 0008E46C  38 85 00 26 */	addi r4, r5, 0x26 /* r4 = r5 + 0x26 */
/* 80092550 0008E470  6C 80 80 00 */	xoris r0, r4, 0x8000 /* r0 = (r5 + 0x26) xor 0x8000 */
/* 80092554 0008E474  90 61 00 18 */	stw r3, 0x18(r1) /* Mem[r1 + 0x18] = 0x4330 */

/* 80092558 0008E478  38 85 00 25 */	addi r4, r5, 0x25 /* r4 = r5 + 0x25 */
/* 8009255C 0008E47C  C8 81 00 18 */	lfd f4, 0x18(r1) /* f4 = Mem[r1 + 0x18] */
/* 80092560 0008E480  90 01 00 1C */	stw r0, 0x1c(r1)				/* Mem[r1 + 0x1C] = (r5 + 0x26) xor 0x8000 */
/* 80092564 0008E484  EC 64 28 28 */	fsubs f3, f4, f5 /* f3 = f4 - f5 */ /* f3 = (Mem[r1 + 0x18]) - l_shadow_s32_to_float */
/* 80092568 0008E488  6C 80 80 00 */	xoris r0, r4, 0x8000 /* r0 = (r5 + 0x25) xor 0x8000 */
/* 8009256C 0008E48C  90 61 00 18 */	stw r3, 0x18(r1)				/* Mem[r1 + 0x18] = 0x4330 */

/* 80092570 0008E490  38 85 00 24 */	addi r4, r5, 0x24 /* r4 = r5 + 0x24 */
/* 80092574 0008E494  EC 46 00 F2 */	fmuls f2, f6, f3 /* f2 = 0.021276595f * ( (Mem[r1 + 0x18]) - l_shadow_s32_to_float ) */
/* 80092578 0008E498  C8 81 00 18 */	lfd f4, 0x18(r1) /* f4 = Mem[r1 + 0x18] */
/* 8009257C 0008E49C  38 A5 FF FC */	addi r5, r5, -4 /* r5 -= 4 */
/* 80092580 0008E4A0  90 01 00 1C */	stw r0, 0x1c(r1)				/* Mem[r1 + 0x1C] = (r5 + 0x25) xor 0x8000 */
/* 80092584 0008E4A4  EC 27 00 B2 */	fmuls f1, f7, f2 /* f1 = 255.0f * ( 0.021276595f * Mem[r1 + 0x18] ) */
/* 80092588 0008E4A8  EC 64 28 28 */	fsubs f3, f4, f5 /* f3 = Mem[r1 + 0x18] - l_shadow_s32_to_float */
/* 8009258C 0008E4AC  6C 80 80 00 */	xoris r0, r4, 0x8000 /* r0 = (r5 + 0x24) xor 0x8000 */
/* 80092590 0008E4B0  90 61 00 18 */	stw r3, 0x18(r1) /* Mem[r1 + 0x18] = 0x4330 */
/* 80092594 0008E4B4  FC 00 08 1E */	fctiwz f0, f1 /* ??? f0 ? f1*/
/* 80092598 0008E4B8  C8 81 00 18 */	lfd f4, 0x18(r1) /* f4 = Mem[r1 + 0x18] */
/* 8009259C 0008E4BC  EC 46 00 F2 */	fmuls f2, f6, f3 /* f2 = 0.021276595f * ( Mem[r1 + 0x18] - l_shadow_s32_to_float ) */
/* 800925A0 0008E4C0  90 01 00 1C */	stw r0, 0x1c(r1)				/* Mem[r1 + 0x1C] = (r5 + 0x24) xor 0x8000 */
/* 800925A4 0008E4C4  EC 64 28 28 */	fsubs f3, f4, f5 /* f3 = Mem[r1 + 0x18] - l_shadow_s32_to_float */
/* 800925A8 0008E4C8  90 61 00 18 */	stw r3, 0x18(r1) /* Mem[r1 + 0x18] = 0x4330 */
/* 800925AC 0008E4CC  EC 27 00 B2 */	fmuls f1, f7, f2 /* f1 = 255.0f * (0.021276595f * ( Mem[r1 + 0x18]) */
/* 800925B0 0008E4D0  EC 46 00 F2 */	fmuls f2, f6, f3 /* f2 = 0.021276595f * ( Mem[r1 + 0x18] - l_shadow_s32_to_float ) */
/* 800925B4 0008E4D4  C8 81 00 18 */	lfd f4, 0x18(r1)
/* 800925B8 0008E4D8  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 800925BC 0008E4DC  FC 00 08 1E */	fctiwz f0, f1
/* 800925C0 0008E4E0  EC 64 28 28 */	fsubs f3, f4, f5
/* 800925C4 0008E4E4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800925C8 0008E4E8  EC 27 00 B2 */	fmuls f1, f7, f2
/* 800925CC 0008E4EC  EC 46 00 F2 */	fmuls f2, f6, f3
/* 800925D0 0008E4F0  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 800925D4 0008E4F4  FC 00 08 1E */	fctiwz f0, f1
/* 800925D8 0008E4F8  98 1C 00 00 */	stb r0, 0(r28)
/* 800925DC 0008E4FC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800925E0 0008E500  EC 27 00 B2 */	fmuls f1, f7, f2
/* 800925E4 0008E504  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 800925E8 0008E508  98 1C 00 01 */	stb r0, 1(r28)
/* 800925EC 0008E50C  FC 00 08 1E */	fctiwz f0, f1
/* 800925F0 0008E510  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800925F4 0008E514  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 800925F8 0008E518  98 1C 00 02 */	stb r0, 2(r28)
/* 800925FC 0008E51C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80092600 0008E520  98 1C 00 03 */	stb r0, 3(r28)
/* 80092604 0008E524  3B 9C 00 04 */	addi r28, r28, 4 /* r28 += 4*/
/* 80092608 0008E528  42 00 FF 38 */	bdnz lbl_80092540 /* ctr != 0 */
/* 8009260C 0008E52C  34 C6 FF FF */	addic. r6, r6, -1 /* r6 -- */
/* 80092610 0008E530  41 81 FF 24 */	bgt lbl_80092534 /* ? r0 > 0 ? */


/* sec2 */
/* 80092614 0008E534  C0 E2 AF 80 */	lfs f7, l_lbl_802F5780@sda21(r2)
/* 80092618 0008E538  38 A0 00 04 */	li r5, 4
/* 8009261C 0008E53C  C0 C2 AF 84 */	lfs f6, l_lbl_802F5784@sda21(r2)
/* 80092620 0008E540  3C 60 43 30 */	lis r3, 0x4330
/* 80092624 0008E544  C8 A2 AF 90 */	lfd f5, l_shadow_s32_to_float@sda21(r2)
lbl_80092628:
/* 80092628 0008E548  38 00 00 02 */	li r0, 2
/* 8009262C 0008E54C  7C 09 03 A6 */	mtctr r0
/* 80092630 0008E550  38 C0 00 08 */	li r6, 8
lbl_80092634:
/* 80092634 0008E554  38 86 00 1F */	addi r4, r6, 0x1f
/* 80092638 0008E558  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 8009263C 0008E55C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80092640 0008E560  38 86 00 1E */	addi r4, r6, 0x1e
/* 80092644 0008E564  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 80092648 0008E568  90 61 00 10 */	stw r3, 0x10(r1)
/* 8009264C 0008E56C  38 86 00 1D */	addi r4, r6, 0x1d
/* 80092650 0008E570  C8 81 00 10 */	lfd f4, 0x10(r1)
/* 80092654 0008E574  90 01 00 14 */	stw r0, 0x14(r1)
/* 80092658 0008E578  EC 64 28 28 */	fsubs f3, f4, f5
/* 8009265C 0008E57C  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 80092660 0008E580  90 61 00 10 */	stw r3, 0x10(r1)
/* 80092664 0008E584  38 86 00 1C */	addi r4, r6, 0x1c
/* 80092668 0008E588  EC 46 00 F2 */	fmuls f2, f6, f3
/* 8009266C 0008E58C  C8 81 00 10 */	lfd f4, 0x10(r1)
/* 80092670 0008E590  38 C6 FF FC */	addi r6, r6, -4
/* 80092674 0008E594  90 01 00 14 */	stw r0, 0x14(r1)
/* 80092678 0008E598  EC 27 00 B2 */	fmuls f1, f7, f2
/* 8009267C 0008E59C  EC 64 28 28 */	fsubs f3, f4, f5
/* 80092680 0008E5A0  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 80092684 0008E5A4  90 61 00 10 */	stw r3, 0x10(r1)
/* 80092688 0008E5A8  FC 00 08 1E */	fctiwz f0, f1
/* 8009268C 0008E5AC  C8 81 00 10 */	lfd f4, 0x10(r1)
/* 80092690 0008E5B0  EC 46 00 F2 */	fmuls f2, f6, f3
/* 80092694 0008E5B4  90 01 00 14 */	stw r0, 0x14(r1)
/* 80092698 0008E5B8  EC 64 28 28 */	fsubs f3, f4, f5
/* 8009269C 0008E5BC  90 61 00 10 */	stw r3, 0x10(r1)
/* 800926A0 0008E5C0  EC 27 00 B2 */	fmuls f1, f7, f2
/* 800926A4 0008E5C4  EC 46 00 F2 */	fmuls f2, f6, f3
/* 800926A8 0008E5C8  C8 81 00 10 */	lfd f4, 0x10(r1)
/* 800926AC 0008E5CC  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 800926B0 0008E5D0  FC 00 08 1E */	fctiwz f0, f1
/* 800926B4 0008E5D4  EC 64 28 28 */	fsubs f3, f4, f5
/* 800926B8 0008E5D8  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800926BC 0008E5DC  EC 27 00 B2 */	fmuls f1, f7, f2
/* 800926C0 0008E5E0  EC 46 00 F2 */	fmuls f2, f6, f3
/* 800926C4 0008E5E4  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 800926C8 0008E5E8  FC 00 08 1E */	fctiwz f0, f1
/* 800926CC 0008E5EC  98 1C 00 00 */	stb r0, 0(r28)
/* 800926D0 0008E5F0  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800926D4 0008E5F4  EC 27 00 B2 */	fmuls f1, f7, f2
/* 800926D8 0008E5F8  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 800926DC 0008E5FC  98 1C 00 01 */	stb r0, 1(r28)
/* 800926E0 0008E600  FC 00 08 1E */	fctiwz f0, f1
/* 800926E4 0008E604  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800926E8 0008E608  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 800926EC 0008E60C  98 1C 00 02 */	stb r0, 2(r28)
/* 800926F0 0008E610  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800926F4 0008E614  98 1C 00 03 */	stb r0, 3(r28)
/* 800926F8 0008E618  3B 9C 00 04 */	addi r28, r28, 4
/* 800926FC 0008E61C  42 00 FF 38 */	bdnz lbl_80092634
/* 80092700 0008E620  34 A5 FF FF */	addic. r5, r5, -1
/* 80092704 0008E624  41 81 FF 24 */	bgt lbl_80092628
/* 80092708 0008E628  C0 E2 AF 80 */	lfs f7, l_lbl_802F5780@sda21(r2)
/* 8009270C 0008E62C  38 A0 00 04 */	li r5, 4
/* 80092710 0008E630  C0 C2 AF 84 */	lfs f6, l_lbl_802F5784@sda21(r2)
/* 80092714 0008E634  3C 60 43 30 */	lis r3, 0x4330
/* 80092718 0008E638  C8 A2 AF 90 */	lfd f5, l_shadow_s32_to_float@sda21(r2)
lbl_8009271C:
/* 8009271C 0008E63C  38 00 00 02 */	li r0, 2
/* 80092720 0008E640  7C 09 03 A6 */	mtctr r0
/* 80092724 0008E644  38 C0 00 08 */	li r6, 8
lbl_80092728:
/* 80092728 0008E648  38 86 00 17 */	addi r4, r6, 0x17
/* 8009272C 0008E64C  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 80092730 0008E650  90 01 00 14 */	stw r0, 0x14(r1)
/* 80092734 0008E654  38 86 00 16 */	addi r4, r6, 0x16
/* 80092738 0008E658  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 8009273C 0008E65C  90 61 00 10 */	stw r3, 0x10(r1)
/* 80092740 0008E660  38 86 00 15 */	addi r4, r6, 0x15
/* 80092744 0008E664  C8 81 00 10 */	lfd f4, 0x10(r1)
/* 80092748 0008E668  90 01 00 14 */	stw r0, 0x14(r1)
/* 8009274C 0008E66C  EC 64 28 28 */	fsubs f3, f4, f5
/* 80092750 0008E670  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 80092754 0008E674  90 61 00 10 */	stw r3, 0x10(r1)
/* 80092758 0008E678  38 86 00 14 */	addi r4, r6, 0x14
/* 8009275C 0008E67C  EC 46 00 F2 */	fmuls f2, f6, f3
/* 80092760 0008E680  C8 81 00 10 */	lfd f4, 0x10(r1)
/* 80092764 0008E684  38 C6 FF FC */	addi r6, r6, -4
/* 80092768 0008E688  90 01 00 14 */	stw r0, 0x14(r1)
/* 8009276C 0008E68C  EC 27 00 B2 */	fmuls f1, f7, f2
/* 80092770 0008E690  EC 64 28 28 */	fsubs f3, f4, f5
/* 80092774 0008E694  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 80092778 0008E698  90 61 00 10 */	stw r3, 0x10(r1)
/* 8009277C 0008E69C  FC 00 08 1E */	fctiwz f0, f1
/* 80092780 0008E6A0  C8 81 00 10 */	lfd f4, 0x10(r1)
/* 80092784 0008E6A4  EC 46 00 F2 */	fmuls f2, f6, f3
/* 80092788 0008E6A8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8009278C 0008E6AC  EC 64 28 28 */	fsubs f3, f4, f5
/* 80092790 0008E6B0  90 61 00 10 */	stw r3, 0x10(r1)
/* 80092794 0008E6B4  EC 27 00 B2 */	fmuls f1, f7, f2
/* 80092798 0008E6B8  EC 46 00 F2 */	fmuls f2, f6, f3
/* 8009279C 0008E6BC  C8 81 00 10 */	lfd f4, 0x10(r1)
/* 800927A0 0008E6C0  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 800927A4 0008E6C4  FC 00 08 1E */	fctiwz f0, f1
/* 800927A8 0008E6C8  EC 64 28 28 */	fsubs f3, f4, f5
/* 800927AC 0008E6CC  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800927B0 0008E6D0  EC 27 00 B2 */	fmuls f1, f7, f2
/* 800927B4 0008E6D4  EC 46 00 F2 */	fmuls f2, f6, f3
/* 800927B8 0008E6D8  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 800927BC 0008E6DC  FC 00 08 1E */	fctiwz f0, f1
/* 800927C0 0008E6E0  98 1C 00 00 */	stb r0, 0(r28)
/* 800927C4 0008E6E4  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800927C8 0008E6E8  EC 27 00 B2 */	fmuls f1, f7, f2
/* 800927CC 0008E6EC  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 800927D0 0008E6F0  98 1C 00 01 */	stb r0, 1(r28)
/* 800927D4 0008E6F4  FC 00 08 1E */	fctiwz f0, f1
/* 800927D8 0008E6F8  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800927DC 0008E6FC  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 800927E0 0008E700  98 1C 00 02 */	stb r0, 2(r28)
/* 800927E4 0008E704  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800927E8 0008E708  98 1C 00 03 */	stb r0, 3(r28)
/* 800927EC 0008E70C  3B 9C 00 04 */	addi r28, r28, 4
/* 800927F0 0008E710  42 00 FF 38 */	bdnz lbl_80092728
/* 800927F4 0008E714  34 A5 FF FF */	addic. r5, r5, -1
/* 800927F8 0008E718  41 81 FF 24 */	bgt lbl_8009271C
/* 800927FC 0008E71C  C0 E2 AF 80 */	lfs f7, l_lbl_802F5780@sda21(r2)
/* 80092800 0008E720  38 A0 00 04 */	li r5, 4
/* 80092804 0008E724  C0 C2 AF 84 */	lfs f6, l_lbl_802F5784@sda21(r2)
/* 80092808 0008E728  3C 60 43 30 */	lis r3, 0x4330
/* 8009280C 0008E72C  C8 A2 AF 90 */	lfd f5, l_shadow_s32_to_float@sda21(r2)
lbl_80092810:
/* 80092810 0008E730  38 00 00 02 */	li r0, 2
/* 80092814 0008E734  7C 09 03 A6 */	mtctr r0
/* 80092818 0008E738  38 C0 00 08 */	li r6, 8
lbl_8009281C:
/* 8009281C 0008E73C  38 86 00 0F */	addi r4, r6, 0xf
/* 80092820 0008E740  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 80092824 0008E744  90 01 00 14 */	stw r0, 0x14(r1)
/* 80092828 0008E748  38 86 00 0E */	addi r4, r6, 0xe
/* 8009282C 0008E74C  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 80092830 0008E750  90 61 00 10 */	stw r3, 0x10(r1)
/* 80092834 0008E754  38 86 00 0D */	addi r4, r6, 0xd
/* 80092838 0008E758  C8 81 00 10 */	lfd f4, 0x10(r1)
/* 8009283C 0008E75C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80092840 0008E760  EC 64 28 28 */	fsubs f3, f4, f5
/* 80092844 0008E764  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 80092848 0008E768  90 61 00 10 */	stw r3, 0x10(r1)
/* 8009284C 0008E76C  38 86 00 0C */	addi r4, r6, 0xc
/* 80092850 0008E770  EC 46 00 F2 */	fmuls f2, f6, f3
/* 80092854 0008E774  C8 81 00 10 */	lfd f4, 0x10(r1)
/* 80092858 0008E778  38 C6 FF FC */	addi r6, r6, -4
/* 8009285C 0008E77C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80092860 0008E780  EC 27 00 B2 */	fmuls f1, f7, f2
/* 80092864 0008E784  EC 64 28 28 */	fsubs f3, f4, f5
/* 80092868 0008E788  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 8009286C 0008E78C  90 61 00 10 */	stw r3, 0x10(r1)
/* 80092870 0008E790  FC 00 08 1E */	fctiwz f0, f1
/* 80092874 0008E794  C8 81 00 10 */	lfd f4, 0x10(r1)
/* 80092878 0008E798  EC 46 00 F2 */	fmuls f2, f6, f3
/* 8009287C 0008E79C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80092880 0008E7A0  EC 64 28 28 */	fsubs f3, f4, f5
/* 80092884 0008E7A4  90 61 00 10 */	stw r3, 0x10(r1)
/* 80092888 0008E7A8  EC 27 00 B2 */	fmuls f1, f7, f2
/* 8009288C 0008E7AC  EC 46 00 F2 */	fmuls f2, f6, f3
/* 80092890 0008E7B0  C8 81 00 10 */	lfd f4, 0x10(r1)
/* 80092894 0008E7B4  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 80092898 0008E7B8  FC 00 08 1E */	fctiwz f0, f1
/* 8009289C 0008E7BC  EC 64 28 28 */	fsubs f3, f4, f5
/* 800928A0 0008E7C0  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800928A4 0008E7C4  EC 27 00 B2 */	fmuls f1, f7, f2
/* 800928A8 0008E7C8  EC 46 00 F2 */	fmuls f2, f6, f3
/* 800928AC 0008E7CC  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 800928B0 0008E7D0  FC 00 08 1E */	fctiwz f0, f1
/* 800928B4 0008E7D4  98 1C 00 00 */	stb r0, 0(r28)
/* 800928B8 0008E7D8  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800928BC 0008E7DC  EC 27 00 B2 */	fmuls f1, f7, f2
/* 800928C0 0008E7E0  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 800928C4 0008E7E4  98 1C 00 01 */	stb r0, 1(r28)
/* 800928C8 0008E7E8  FC 00 08 1E */	fctiwz f0, f1
/* 800928CC 0008E7EC  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800928D0 0008E7F0  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 800928D4 0008E7F4  98 1C 00 02 */	stb r0, 2(r28)
/* 800928D8 0008E7F8  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800928DC 0008E7FC  98 1C 00 03 */	stb r0, 3(r28)
/* 800928E0 0008E800  3B 9C 00 04 */	addi r28, r28, 4
/* 800928E4 0008E804  42 00 FF 38 */	bdnz lbl_8009281C
/* 800928E8 0008E808  34 A5 FF FF */	addic. r5, r5, -1
/* 800928EC 0008E80C  41 81 FF 24 */	bgt lbl_80092810
/* 800928F0 0008E810  C0 E2 AF 80 */	lfs f7, l_lbl_802F5780@sda21(r2)
/* 800928F4 0008E814  38 A0 00 04 */	li r5, 4
/* 800928F8 0008E818  C0 C2 AF 84 */	lfs f6, l_lbl_802F5784@sda21(r2)
/* 800928FC 0008E81C  3C 60 43 30 */	lis r3, 0x4330
/* 80092900 0008E820  C8 A2 AF 90 */	lfd f5, l_shadow_s32_to_float@sda21(r2)
lbl_80092904:
/* 80092904 0008E824  38 00 00 02 */	li r0, 2
/* 80092908 0008E828  7C 09 03 A6 */	mtctr r0
/* 8009290C 0008E82C  38 C0 00 08 */	li r6, 8
lbl_80092910:
/* 80092910 0008E830  38 86 00 07 */	addi r4, r6, 7
/* 80092914 0008E834  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 80092918 0008E838  90 01 00 14 */	stw r0, 0x14(r1)
/* 8009291C 0008E83C  38 86 00 06 */	addi r4, r6, 6
/* 80092920 0008E840  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 80092924 0008E844  90 61 00 10 */	stw r3, 0x10(r1)
/* 80092928 0008E848  38 86 00 05 */	addi r4, r6, 5
/* 8009292C 0008E84C  C8 81 00 10 */	lfd f4, 0x10(r1)
/* 80092930 0008E850  90 01 00 14 */	stw r0, 0x14(r1)
/* 80092934 0008E854  EC 64 28 28 */	fsubs f3, f4, f5
/* 80092938 0008E858  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 8009293C 0008E85C  90 61 00 10 */	stw r3, 0x10(r1)
/* 80092940 0008E860  38 86 00 04 */	addi r4, r6, 4
/* 80092944 0008E864  EC 46 00 F2 */	fmuls f2, f6, f3
/* 80092948 0008E868  C8 81 00 10 */	lfd f4, 0x10(r1)
/* 8009294C 0008E86C  38 C6 FF FC */	addi r6, r6, -4
/* 80092950 0008E870  90 01 00 14 */	stw r0, 0x14(r1)
/* 80092954 0008E874  EC 27 00 B2 */	fmuls f1, f7, f2
/* 80092958 0008E878  EC 64 28 28 */	fsubs f3, f4, f5
/* 8009295C 0008E87C  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 80092960 0008E880  90 61 00 10 */	stw r3, 0x10(r1)
/* 80092964 0008E884  FC 00 08 1E */	fctiwz f0, f1
/* 80092968 0008E888  C8 81 00 10 */	lfd f4, 0x10(r1)
/* 8009296C 0008E88C  EC 46 00 F2 */	fmuls f2, f6, f3
/* 80092970 0008E890  90 01 00 14 */	stw r0, 0x14(r1)
/* 80092974 0008E894  EC 64 28 28 */	fsubs f3, f4, f5
/* 80092978 0008E898  90 61 00 10 */	stw r3, 0x10(r1)
/* 8009297C 0008E89C  EC 27 00 B2 */	fmuls f1, f7, f2
/* 80092980 0008E8A0  EC 46 00 F2 */	fmuls f2, f6, f3
/* 80092984 0008E8A4  C8 81 00 10 */	lfd f4, 0x10(r1)
/* 80092988 0008E8A8  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 8009298C 0008E8AC  FC 00 08 1E */	fctiwz f0, f1
/* 80092990 0008E8B0  EC 64 28 28 */	fsubs f3, f4, f5
/* 80092994 0008E8B4  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80092998 0008E8B8  EC 27 00 B2 */	fmuls f1, f7, f2
/* 8009299C 0008E8BC  EC 46 00 F2 */	fmuls f2, f6, f3
/* 800929A0 0008E8C0  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 800929A4 0008E8C4  FC 00 08 1E */	fctiwz f0, f1
/* 800929A8 0008E8C8  98 1C 00 00 */	stb r0, 0(r28)
/* 800929AC 0008E8CC  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800929B0 0008E8D0  EC 27 00 B2 */	fmuls f1, f7, f2
/* 800929B4 0008E8D4  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 800929B8 0008E8D8  98 1C 00 01 */	stb r0, 1(r28)
/* 800929BC 0008E8DC  FC 00 08 1E */	fctiwz f0, f1
/* 800929C0 0008E8E0  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800929C4 0008E8E4  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 800929C8 0008E8E8  98 1C 00 02 */	stb r0, 2(r28)
/* 800929CC 0008E8EC  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800929D0 0008E8F0  98 1C 00 03 */	stb r0, 3(r28)
/* 800929D4 0008E8F4  3B 9C 00 04 */	addi r28, r28, 4
/* 800929D8 0008E8F8  42 00 FF 38 */	bdnz lbl_80092910
/* 800929DC 0008E8FC  34 A5 FF FF */	addic. r5, r5, -1
/* 800929E0 0008E900  41 81 FF 24 */	bgt lbl_80092904
/* 800929E4 0008E904  C0 E2 AF 80 */	lfs f7, l_lbl_802F5780@sda21(r2)
/* 800929E8 0008E908  38 A0 00 04 */	li r5, 4
/* 800929EC 0008E90C  C0 C2 AF 84 */	lfs f6, l_lbl_802F5784@sda21(r2)
/* 800929F0 0008E910  3C 60 43 30 */	lis r3, 0x4330
/* 800929F4 0008E914  C8 A2 AF 90 */	lfd f5, l_shadow_s32_to_float@sda21(r2)
lbl_800929F8:
/* 800929F8 0008E918  38 00 00 02 */	li r0, 2
/* 800929FC 0008E91C  7C 09 03 A6 */	mtctr r0
/* 80092A00 0008E920  38 C0 00 08 */	li r6, 8
lbl_80092A04:
/* 80092A04 0008E924  38 86 FF FF */	addi r4, r6, -1
/* 80092A08 0008E928  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 80092A0C 0008E92C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80092A10 0008E930  38 86 FF FE */	addi r4, r6, -2
/* 80092A14 0008E934  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 80092A18 0008E938  90 61 00 10 */	stw r3, 0x10(r1)
/* 80092A1C 0008E93C  38 86 FF FD */	addi r4, r6, -3
/* 80092A20 0008E940  C8 81 00 10 */	lfd f4, 0x10(r1)
/* 80092A24 0008E944  90 01 00 14 */	stw r0, 0x14(r1)
/* 80092A28 0008E948  EC 64 28 28 */	fsubs f3, f4, f5
/* 80092A2C 0008E94C  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 80092A30 0008E950  90 61 00 10 */	stw r3, 0x10(r1)
/* 80092A34 0008E954  38 86 FF FC */	addi r4, r6, -4
/* 80092A38 0008E958  EC 46 00 F2 */	fmuls f2, f6, f3
/* 80092A3C 0008E95C  C8 81 00 10 */	lfd f4, 0x10(r1)
/* 80092A40 0008E960  38 C6 FF FC */	addi r6, r6, -4
/* 80092A44 0008E964  90 01 00 14 */	stw r0, 0x14(r1)
/* 80092A48 0008E968  EC 27 00 B2 */	fmuls f1, f7, f2
/* 80092A4C 0008E96C  EC 64 28 28 */	fsubs f3, f4, f5
/* 80092A50 0008E970  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 80092A54 0008E974  90 61 00 10 */	stw r3, 0x10(r1)
/* 80092A58 0008E978  FC 00 08 1E */	fctiwz f0, f1
/* 80092A5C 0008E97C  C8 81 00 10 */	lfd f4, 0x10(r1)
/* 80092A60 0008E980  EC 46 00 F2 */	fmuls f2, f6, f3
/* 80092A64 0008E984  90 01 00 14 */	stw r0, 0x14(r1)
/* 80092A68 0008E988  EC 64 28 28 */	fsubs f3, f4, f5
/* 80092A6C 0008E98C  90 61 00 10 */	stw r3, 0x10(r1)
/* 80092A70 0008E990  EC 27 00 B2 */	fmuls f1, f7, f2
/* 80092A74 0008E994  EC 46 00 F2 */	fmuls f2, f6, f3
/* 80092A78 0008E998  C8 81 00 10 */	lfd f4, 0x10(r1)
/* 80092A7C 0008E99C  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 80092A80 0008E9A0  FC 00 08 1E */	fctiwz f0, f1
/* 80092A84 0008E9A4  EC 64 28 28 */	fsubs f3, f4, f5
/* 80092A88 0008E9A8  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80092A8C 0008E9AC  EC 27 00 B2 */	fmuls f1, f7, f2
/* 80092A90 0008E9B0  EC 46 00 F2 */	fmuls f2, f6, f3
/* 80092A94 0008E9B4  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 80092A98 0008E9B8  FC 00 08 1E */	fctiwz f0, f1
/* 80092A9C 0008E9BC  98 1C 00 00 */	stb r0, 0(r28)
/* 80092AA0 0008E9C0  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80092AA4 0008E9C4  EC 27 00 B2 */	fmuls f1, f7, f2
/* 80092AA8 0008E9C8  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 80092AAC 0008E9CC  98 1C 00 01 */	stb r0, 1(r28)
/* 80092AB0 0008E9D0  FC 00 08 1E */	fctiwz f0, f1
/* 80092AB4 0008E9D4  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80092AB8 0008E9D8  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 80092ABC 0008E9DC  98 1C 00 02 */	stb r0, 2(r28)
/* 80092AC0 0008E9E0  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80092AC4 0008E9E4  98 1C 00 03 */	stb r0, 3(r28)
/* 80092AC8 0008E9E8  3B 9C 00 04 */	addi r28, r28, 4
/* 80092ACC 0008E9EC  42 00 FF 38 */	bdnz lbl_80092A04
/* 80092AD0 0008E9F0  34 A5 FF FF */	addic. r5, r5, -1
/* 80092AD4 0008E9F4  41 81 FF 24 */	bgt lbl_800929F8
/* 80092AD8 0008E9F8  38 7D 00 00 */	addi r3, r29, 0
/* 80092ADC 0008E9FC  38 80 01 00 */	li r4, 0x100
/* 80092AE0 0008EA00  48 03 04 81 */	bl DCFlushRange
/* 80092AE4 0008EA04  38 7E 00 00 */	addi r3, r30, 0
/* 80092AE8 0008EA08  38 9D 00 00 */	addi r4, r29, 0
/* 80092AEC 0008EA0C  38 A0 00 40 */	li r5, 0x40
/* 80092AF0 0008EA10  38 C0 00 04 */	li r6, 4
/* 80092AF4 0008EA14  38 E0 00 01 */	li r7, 1
/* 80092AF8 0008EA18  39 00 00 00 */	li r8, 0
/* 80092AFC 0008EA1C  39 20 00 00 */	li r9, 0
/* 80092B00 0008EA20  39 40 00 00 */	li r10, 0
/* 80092B04 0008EA24  48 04 E6 25 */	bl GXInitTexObj
/* 80092B08 0008EA28  C0 22 AF 88 */	lfs f1, l_lbl_802F5788@sda21(r2)
/* 80092B0C 0008EA2C  38 7E 00 00 */	addi r3, r30, 0
/* 80092B10 0008EA30  38 80 00 01 */	li r4, 1
/* 80092B14 0008EA34  FC 40 08 90 */	fmr f2, f1
/* 80092B18 0008EA38  38 A0 00 01 */	li r5, 1
/* 80092B1C 0008EA3C  FC 60 08 90 */	fmr f3, f1
/* 80092B20 0008EA40  38 C0 00 00 */	li r6, 0
/* 80092B24 0008EA44  38 E0 00 00 */	li r7, 0
/* 80092B28 0008EA48  39 00 00 00 */	li r8, 0
/* 80092B2C 0008EA4C  48 04 E8 51 */	bl GXInitTexObjLOD
/* 80092B30 0008EA50  C0 02 AF 88 */	lfs f0, l_lbl_802F5788@sda21(r2)
/* 80092B34 0008EA54  D0 1F 39 20 */	stfs f0, 0x3920(r31)
/* 80092B38 0008EA58  D0 1F 39 24 */	stfs f0, 0x3924(r31)
/* 80092B3C 0008EA5C  D0 1F 39 30 */	stfs f0, 0x3930(r31)
/* 80092B40 0008EA60  D0 1F 39 34 */	stfs f0, 0x3934(r31)
/* 80092B44 0008EA64  D0 1F 39 38 */	stfs f0, 0x3938(r31)
/* 80092B48 0008EA68  D0 1F 39 3C */	stfs f0, 0x393c(r31)
/* 80092B4C 0008EA6C  D0 1F 39 40 */	stfs f0, 0x3940(r31)
/* 80092B50 0008EA70  D0 1F 39 44 */	stfs f0, 0x3944(r31)
/* 80092B54 0008EA74  D0 1F 39 48 */	stfs f0, 0x3948(r31)
/* 80092B58 0008EA78  C0 02 AF 8C */	lfs f0, l_lbl_802F578C@sda21(r2)
/* 80092B5C 0008EA7C  D0 1F 39 4C */	stfs f0, 0x394c(r31)
/* 80092B60 0008EA80  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80092B64 0008EA84  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 80092B68 0008EA88  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 80092B6C 0008EA8C  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 80092B70 0008EA90  83 81 00 20 */	lwz r28, 0x20(r1)
/* 80092B74 0008EA94  38 21 00 30 */	addi r1, r1, 0x30
/* 80092B78 0008EA98  7C 08 03 A6 */	mtlr r0
/* 80092B7C 0008EA9C  4E 80 00 20 */	blr





.global shadowerase_main
shadowerase_main:
/* 80092B80 0008EAA0  3C 60 80 2B */	lis r3, shadow@ha
/* 80092B84 0008EAA4  38 03 57 A0 */	addi r0, r3, shadow@l
/* 80092B88 0008EAA8  38 60 00 00 */	li r3, 0
/* 80092B8C 0008EAAC  90 0D 9F 74 */	stw r0, l_ptr_shadow@sda21(r13) /* Mem[ l_ptr_shadow + 0 ] = shadow */
/* 80092B90 0008EAB0  90 6D 9F 70 */	stw r3, l_lbl_802F2150@sda21(r13) /* Mem[ l_lbl_802F2150 + 0 ] = 0 */
/* 80092B94 0008EAB4  4E 80 00 20 */	blr

.global u_init_shadow_stuff_probably
u_init_shadow_stuff_probably:
/* 80092B98 0008EAB8  7C 08 02 A6 */	mflr r0
/* 80092B9C 0008EABC  90 01 00 04 */	stw r0, 4(r1)
/* 80092BA0 0008EAC0  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80092BA4 0008EAC4  DB E1 00 28 */	stfd f31, 0x28(r1)
/* 80092BA8 0008EAC8  DB C1 00 20 */	stfd f30, 0x20(r1)
/* 80092BAC 0008EACC  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80092BB0 0008EAD0  3B E3 00 00 */	addi r31, r3, 0
/* 80092BB4 0008EAD4  80 0D 9F 70 */	lwz r0, l_lbl_802F2150@sda21(r13)
/* 80092BB8 0008EAD8  2C 00 00 40 */	cmpwi r0, 0x40
/* 80092BBC 0008EADC  40 81 00 0C */	ble lbl_80092BC8
/* 80092BC0 0008EAE0  38 60 00 00 */	li r3, 0
/* 80092BC4 0008EAE4  48 00 01 54 */	b lbl_80092D18
lbl_80092BC8:
/* 80092BC8 0008EAE8  C0 7F 00 00 */	lfs f3, 0(r31)
/* 80092BCC 0008EAEC  C0 5F 00 10 */	lfs f2, 0x10(r31)
/* 80092BD0 0008EAF0  C0 3F 00 04 */	lfs f1, 4(r31)
/* 80092BD4 0008EAF4  C0 1F 00 14 */	lfs f0, 0x14(r31)
/* 80092BD8 0008EAF8  EC 43 10 28 */	fsubs f2, f3, f2
/* 80092BDC 0008EAFC  C0 7F 00 08 */	lfs f3, 8(r31)
/* 80092BE0 0008EB00  EC 21 00 28 */	fsubs f1, f1, f0
/* 80092BE4 0008EB04  C0 1F 00 18 */	lfs f0, 0x18(r31)
/* 80092BE8 0008EB08  EC 42 00 B2 */	fmuls f2, f2, f2
/* 80092BEC 0008EB0C  EC 63 00 28 */	fsubs f3, f3, f0
/* 80092BF0 0008EB10  C0 9F 00 1C */	lfs f4, 0x1c(r31)
/* 80092BF4 0008EB14  EC 21 00 72 */	fmuls f1, f1, f1
/* 80092BF8 0008EB18  C0 02 AF 88 */	lfs f0, l_lbl_802F5788@sda21(r2)
/* 80092BFC 0008EB1C  EC 63 00 F2 */	fmuls f3, f3, f3
/* 80092C00 0008EB20  EC 84 01 32 */	fmuls f4, f4, f4
/* 80092C04 0008EB24  EC 22 08 2A */	fadds f1, f2, f1
/* 80092C08 0008EB28  EC 43 08 2A */	fadds f2, f3, f1
/* 80092C0C 0008EB2C  EC 22 20 28 */	fsubs f1, f2, f4
/* 80092C10 0008EB30  FF E0 10 90 */	fmr f31, f2
/* 80092C14 0008EB34  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 80092C18 0008EB38  40 81 00 14 */	ble lbl_80092C2C
/* 80092C1C 0008EB3C  EC 24 08 24 */	fdivs f1, f4, f1
/* 80092C20 0008EB40  4B F7 44 D9 */	bl mathutil_sqrt
/* 80092C24 0008EB44  FF C0 08 90 */	fmr f30, f1
/* 80092C28 0008EB48  48 00 00 08 */	b lbl_80092C30
lbl_80092C2C:
/* 80092C2C 0008EB4C  C3 C2 AF 98 */	lfs f30, l_lbl_802F5798@sda21(r2)
lbl_80092C30:
/* 80092C30 0008EB50  80 6D 9F 74 */	lwz r3, l_ptr_shadow@sda21(r13)
/* 80092C34 0008EB54  38 9F 00 00 */	addi r4, r31, 0
/* 80092C38 0008EB58  38 A0 00 40 */	li r5, 0x40
/* 80092C3C 0008EB5C  4B F7 07 D9 */	bl memcpy
/* 80092C40 0008EB60  80 6D 9F 74 */	lwz r3, l_ptr_shadow@sda21(r13)
/* 80092C44 0008EB64  FC 20 F8 90 */	fmr f1, f31
/* 80092C48 0008EB68  D3 C3 00 50 */	stfs f30, 0x50(r3)
/* 80092C4C 0008EB6C  C0 02 AF 8C */	lfs f0, l_lbl_802F578C@sda21(r2)
/* 80092C50 0008EB70  80 6D 9F 74 */	lwz r3, l_ptr_shadow@sda21(r13)
/* 80092C54 0008EB74  EC 00 F0 24 */	fdivs f0, f0, f30
/* 80092C58 0008EB78  D0 03 00 54 */	stfs f0, 0x54(r3)
/* 80092C5C 0008EB7C  4B F7 44 9D */	bl mathutil_sqrt
/* 80092C60 0008EB80  80 AD 9F 74 */	lwz r5, l_ptr_shadow@sda21(r13)
/* 80092C64 0008EB84  38 61 00 0C */	addi r3, r1, 0xc
/* 80092C68 0008EB88  38 83 00 00 */	addi r4, r3, 0
/* 80092C6C 0008EB8C  D0 25 00 58 */	stfs f1, 0x58(r5)
/* 80092C70 0008EB90  C0 3F 00 10 */	lfs f1, 0x10(r31)
/* 80092C74 0008EB94  C0 1F 00 00 */	lfs f0, 0(r31)
/* 80092C78 0008EB98  EC 01 00 28 */	fsubs f0, f1, f0
/* 80092C7C 0008EB9C  D0 01 00 0C */	stfs f0, 0xc(r1)
/* 80092C80 0008EBA0  C0 3F 00 14 */	lfs f1, 0x14(r31)
/* 80092C84 0008EBA4  C0 1F 00 04 */	lfs f0, 4(r31)
/* 80092C88 0008EBA8  EC 01 00 28 */	fsubs f0, f1, f0
/* 80092C8C 0008EBAC  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 80092C90 0008EBB0  C0 3F 00 18 */	lfs f1, 0x18(r31)
/* 80092C94 0008EBB4  C0 1F 00 08 */	lfs f0, 8(r31)
/* 80092C98 0008EBB8  EC 01 00 28 */	fsubs f0, f1, f0
/* 80092C9C 0008EBBC  D0 01 00 14 */	stfs f0, 0x14(r1)
/* 80092CA0 0008EBC0  C0 22 AF 9C */	lfs f1, l_lbl_802F579C@sda21(r2)
/* 80092CA4 0008EBC4  C0 1F 00 0C */	lfs f0, 0xc(r31)
/* 80092CA8 0008EBC8  EC 21 00 32 */	fmuls f1, f1, f0
/* 80092CAC 0008EBCC  4B F7 54 C9 */	bl mathutil_vec_set_len
/* 80092CB0 0008EBD0  C0 21 00 0C */	lfs f1, 0xc(r1)
/* 80092CB4 0008EBD4  38 60 00 01 */	li r3, 1
/* 80092CB8 0008EBD8  C0 1F 00 10 */	lfs f0, 0x10(r31)
/* 80092CBC 0008EBDC  EC 01 00 2A */	fadds f0, f1, f0
/* 80092CC0 0008EBE0  D0 01 00 0C */	stfs f0, 0xc(r1)
/* 80092CC4 0008EBE4  C0 21 00 10 */	lfs f1, 0x10(r1)
/* 80092CC8 0008EBE8  C0 1F 00 14 */	lfs f0, 0x14(r31)
/* 80092CCC 0008EBEC  EC 01 00 2A */	fadds f0, f1, f0
/* 80092CD0 0008EBF0  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 80092CD4 0008EBF4  C0 21 00 14 */	lfs f1, 0x14(r1)
/* 80092CD8 0008EBF8  C0 1F 00 18 */	lfs f0, 0x18(r31)
/* 80092CDC 0008EBFC  EC 01 00 2A */	fadds f0, f1, f0
/* 80092CE0 0008EC00  D0 01 00 14 */	stfs f0, 0x14(r1)
/* 80092CE4 0008EC04  80 AD 9F 74 */	lwz r5, l_ptr_shadow@sda21(r13)
/* 80092CE8 0008EC08  80 81 00 0C */	lwz r4, 0xc(r1)
/* 80092CEC 0008EC0C  80 01 00 10 */	lwz r0, 0x10(r1)
/* 80092CF0 0008EC10  90 85 00 44 */	stw r4, 0x44(r5)
/* 80092CF4 0008EC14  90 05 00 48 */	stw r0, 0x48(r5)
/* 80092CF8 0008EC18  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80092CFC 0008EC1C  90 05 00 4C */	stw r0, 0x4c(r5)
/* 80092D00 0008EC20  80 AD 9F 74 */	lwz r5, l_ptr_shadow@sda21(r13)
/* 80092D04 0008EC24  80 8D 9F 70 */	lwz r4, l_lbl_802F2150@sda21(r13)
/* 80092D08 0008EC28  38 A5 00 E0 */	addi r5, r5, 0xe0
/* 80092D0C 0008EC2C  38 04 00 01 */	addi r0, r4, 1
/* 80092D10 0008EC30  90 AD 9F 74 */	stw r5, l_ptr_shadow@sda21(r13)
/* 80092D14 0008EC34  90 0D 9F 70 */	stw r0, l_lbl_802F2150@sda21(r13)
lbl_80092D18:
/* 80092D18 0008EC38  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80092D1C 0008EC3C  CB E1 00 28 */	lfd f31, 0x28(r1)
/* 80092D20 0008EC40  CB C1 00 20 */	lfd f30, 0x20(r1)
/* 80092D24 0008EC44  7C 08 03 A6 */	mtlr r0
/* 80092D28 0008EC48  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80092D2C 0008EC4C  38 21 00 30 */	addi r1, r1, 0x30
/* 80092D30 0008EC50  4E 80 00 20 */	blr

.global func_80092D34
func_80092D34:
/* 80092D34 0008EC54  80 6D 9F 70 */	lwz r3, l_lbl_802F2150@sda21(r13)
/* 80092D38 0008EC58  4E 80 00 20 */	blr

.global u_draw_ball_shadow
u_draw_ball_shadow:
/* 80092D3C 0008EC5C  7C 08 02 A6 */	mflr r0
/* 80092D40 0008EC60  3C 60 80 2B */	lis r3, shadow@ha
/* 80092D44 0008EC64  90 01 00 04 */	stw r0, 4(r1)
/* 80092D48 0008EC68  94 21 FF 58 */	stwu r1, -0xa8(r1)
/* 80092D4C 0008EC6C  DB E1 00 A0 */	stfd f31, 0xa0(r1)
/* 80092D50 0008EC70  DB C1 00 98 */	stfd f30, 0x98(r1)
/* 80092D54 0008EC74  DB A1 00 90 */	stfd f29, 0x90(r1)
/* 80092D58 0008EC78  DB 81 00 88 */	stfd f28, 0x88(r1)
/* 80092D5C 0008EC7C  DB 61 00 80 */	stfd f27, 0x80(r1)
/* 80092D60 0008EC80  DB 41 00 78 */	stfd f26, 0x78(r1)
/* 80092D64 0008EC84  93 E1 00 74 */	stw r31, 0x74(r1)
/* 80092D68 0008EC88  3B E3 57 A0 */	addi r31, r3, shadow@l
/* 80092D6C 0008EC8C  93 C1 00 70 */	stw r30, 0x70(r1)
/* 80092D70 0008EC90  93 A1 00 6C */	stw r29, 0x6c(r1)
/* 80092D74 0008EC94  93 81 00 68 */	stw r28, 0x68(r1)
/* 80092D78 0008EC98  4B F7 4A 79 */	bl mathutil_mtxA_push
/* 80092D7C 0008EC9C  80 6D 9A 5C */	lwz r3, currentCameraStructPtr@sda21(r13)
/* 80092D80 0008ECA0  38 80 00 01 */	li r4, 1
/* 80092D84 0008ECA4  80 03 02 04 */	lwz r0, 0x204(r3)
/* 80092D88 0008ECA8  7C 80 00 30 */	slw r0, r4, r0
/* 80092D8C 0008ECAC  54 1C 04 3E */	clrlwi r28, r0, 0x10
/* 80092D90 0008ECB0  4B F7 47 D5 */	bl mathutil_mtxA_from_identity
/* 80092D94 0008ECB4  C0 02 AF 9C */	lfs f0, l_lbl_802F579C@sda21(r2)
/* 80092D98 0008ECB8  38 61 00 38 */	addi r3, r1, 0x38
/* 80092D9C 0008ECBC  80 8D 99 80 */	lwz r4, mathutilData@sda21(r13)
/* 80092DA0 0008ECC0  D0 04 00 08 */	stfs f0, 8(r4)
/* 80092DA4 0008ECC4  80 8D 99 80 */	lwz r4, mathutilData@sda21(r13)
/* 80092DA8 0008ECC8  D0 04 00 18 */	stfs f0, 0x18(r4)
/* 80092DAC 0008ECCC  4B F7 4A CD */	bl mathutil_mtxA_to_mtx
/* 80092DB0 0008ECD0  80 6D 9A 5C */	lwz r3, currentCameraStructPtr@sda21(r13)
/* 80092DB4 0008ECD4  7F FD FB 78 */	mr r29, r31
/* 80092DB8 0008ECD8  83 CD 9F 70 */	lwz r30, l_lbl_802F2150@sda21(r13)
/* 80092DBC 0008ECDC  C3 A3 00 3C */	lfs f29, 0x3c(r3)
/* 80092DC0 0008ECE0  C3 82 AF 9C */	lfs f28, l_lbl_802F579C@sda21(r2)
/* 80092DC4 0008ECE4  C3 E2 AF 8C */	lfs f31, l_lbl_802F578C@sda21(r2)
/* 80092DC8 0008ECE8  C3 42 AF A0 */	lfs f26, l_lbl_802F57A0@sda21(r2)
/* 80092DCC 0008ECEC  C3 62 AF A4 */	lfs f27, l_lbl_802F57A4@sda21(r2)
/* 80092DD0 0008ECF0  C3 C2 AF 88 */	lfs f30, l_lbl_802F5788@sda21(r2)
/* 80092DD4 0008ECF4  48 00 01 78 */	b lbl_80092F4C
lbl_80092DD8:
/* 80092DD8 0008ECF8  D3 DD 00 40 */	stfs f30, 0x40(r29)
/* 80092DDC 0008ECFC  A0 1D 00 2E */	lhz r0, 0x2e(r29)
/* 80092DE0 0008ED00  7C 00 E0 39 */	and. r0, r0, r28
/* 80092DE4 0008ED04  41 82 01 60 */	beq lbl_80092F44
/* 80092DE8 0008ED08  4B F7 4B C5 */	bl mathutil_mtxA_from_mtxB
/* 80092DEC 0008ED0C  C0 1D 00 0C */	lfs f0, 0xc(r29)
/* 80092DF0 0008ED10  38 7D 00 44 */	addi r3, r29, 0x44
/* 80092DF4 0008ED14  EC 3C 00 32 */	fmuls f1, f28, f0
/* 80092DF8 0008ED18  4B F8 DF BD */	bl func_80020DB4
/* 80092DFC 0008ED1C  2C 03 00 00 */	cmpwi r3, 0
/* 80092E00 0008ED20  41 82 01 44 */	beq lbl_80092F44
/* 80092E04 0008ED24  38 7D 00 10 */	addi r3, r29, 0x10
/* 80092E08 0008ED28  38 9D 00 68 */	addi r4, r29, 0x68
/* 80092E0C 0008ED2C  4B F7 50 21 */	bl mathutil_mtxA_tf_point
/* 80092E10 0008ED30  38 7D 00 68 */	addi r3, r29, 0x68
/* 80092E14 0008ED34  C0 23 00 00 */	lfs f1, 0(r3)
/* 80092E18 0008ED38  C0 43 00 04 */	lfs f2, 4(r3)
/* 80092E1C 0008ED3C  C0 03 00 08 */	lfs f0, 8(r3)
/* 80092E20 0008ED40  EC 21 00 72 */	fmuls f1, f1, f1
/* 80092E24 0008ED44  EC 22 08 BA */	fmadds f1, f2, f2, f1
/* 80092E28 0008ED48  EC 20 08 3A */	fmadds f1, f0, f0, f1
/* 80092E2C 0008ED4C  4B F7 42 CD */	bl mathutil_sqrt /* get magnitude/distance */
/* 80092E30 0008ED50  C0 1D 00 1C */	lfs f0, 0x1c(r29)
/* 80092E34 0008ED54  C0 5D 00 30 */	lfs f2, 0x30(r29)
/* 80092E38 0008ED58  EC 00 07 72 */	fmuls f0, f0, f29
/* 80092E3C 0008ED5C  EC 00 08 24 */	fdivs f0, f0, f1
/* 80092E40 0008ED60  FC 00 10 40 */	fcmpo cr0, f0, f2
/* 80092E44 0008ED64  41 80 01 00 */	blt lbl_80092F44
/* 80092E48 0008ED68  C0 7D 00 34 */	lfs f3, 0x34(r29)
/* 80092E4C 0008ED6C  FC 00 18 40 */	fcmpo cr0, f0, f3
/* 80092E50 0008ED70  40 81 00 0C */	ble lbl_80092E5C
/* 80092E54 0008ED74  D3 FD 00 40 */	stfs f31, 0x40(r29)
/* 80092E58 0008ED78  48 00 00 14 */	b lbl_80092E6C
lbl_80092E5C:
/* 80092E5C 0008ED7C  EC 20 10 28 */	fsubs f1, f0, f2
/* 80092E60 0008ED80  EC 03 10 28 */	fsubs f0, f3, f2
/* 80092E64 0008ED84  EC 01 00 24 */	fdivs f0, f1, f0
/* 80092E68 0008ED88  D0 1D 00 40 */	stfs f0, 0x40(r29)
lbl_80092E6C:
/* 80092E6C 0008ED8C  38 7D 00 00 */	addi r3, r29, 0
/* 80092E70 0008ED90  38 9D 00 5C */	addi r4, r29, 0x5c
/* 80092E74 0008ED94  4B F7 4F B9 */	bl mathutil_mtxA_tf_point
/* 80092E78 0008ED98  38 7D 00 20 */	addi r3, r29, 0x20
/* 80092E7C 0008ED9C  38 9D 00 74 */	addi r4, r29, 0x74
/* 80092E80 0008EDA0  4B F7 4F BD */	bl mathutil_mtxA_tf_vec
/* 80092E84 0008EDA4  38 61 00 08 */	addi r3, r1, 8
/* 80092E88 0008EDA8  38 9D 00 5C */	addi r4, r29, 0x5c
/* 80092E8C 0008EDAC  38 BD 00 74 */	addi r5, r29, 0x74
/* 80092E90 0008EDB0  38 DD 00 68 */	addi r6, r29, 0x68
/* 80092E94 0008EDB4  48 03 76 35 */	bl C_MTXLookAt
/* 80092E98 0008EDB8  38 61 00 08 */	addi r3, r1, 8
/* 80092E9C 0008EDBC  4B F7 4A 15 */	bl mathutil_mtxA_from_mtx
/* 80092EA0 0008EDC0  C0 1D 00 0C */	lfs f0, 0xc(r29)
/* 80092EA4 0008EDC4  38 7F 39 20 */	addi r3, r31, 0x3920
/* 80092EA8 0008EDC8  EC 1A 00 24 */	fdivs f0, f26, f0
/* 80092EAC 0008EDCC  D0 1F 39 28 */	stfs f0, 0x3928(r31)
/* 80092EB0 0008EDD0  C0 3D 00 58 */	lfs f1, 0x58(r29)
/* 80092EB4 0008EDD4  C0 1D 00 0C */	lfs f0, 0xc(r29)
/* 80092EB8 0008EDD8  EC 3A 00 72 */	fmuls f1, f26, f1
/* 80092EBC 0008EDDC  EC 01 00 24 */	fdivs f0, f1, f0
/* 80092EC0 0008EDE0  EC 1B 00 2A */	fadds f0, f27, f0
/* 80092EC4 0008EDE4  D0 1F 39 2C */	stfs f0, 0x392c(r31)
/* 80092EC8 0008EDE8  4B F7 4D 8D */	bl mathutil_mtxA_mult_left
/* 80092ECC 0008EDEC  38 7D 00 B0 */	addi r3, r29, 0xb0
/* 80092ED0 0008EDF0  4B F7 49 A9 */	bl mathutil_mtxA_to_mtx
/* 80092ED4 0008EDF4  38 61 00 38 */	addi r3, r1, 0x38
/* 80092ED8 0008EDF8  4B F7 49 D9 */	bl mathutil_mtxA_from_mtx
/* 80092EDC 0008EDFC  80 7D 00 3C */	lwz r3, 0x3c(r29)
/* 80092EE0 0008EE00  88 03 00 00 */	lbz r0, 0(r3)
/* 80092EE4 0008EE04  2C 00 00 00 */	cmpwi r0, 0
/* 80092EE8 0008EE08  41 82 00 08 */	beq lbl_80092EF0
/* 80092EEC 0008EE0C  48 00 00 1C */	b lbl_80092F08
lbl_80092EF0:
/* 80092EF0 0008EE10  C0 1D 00 54 */	lfs f0, 0x54(r29)
/* 80092EF4 0008EE14  C0 62 AF 8C */	lfs f3, l_lbl_802F578C@sda21(r2)
/* 80092EF8 0008EE18  EC 3C 00 32 */	fmuls f1, f28, f0
/* 80092EFC 0008EE1C  FC 40 08 90 */	fmr f2, f1
/* 80092F00 0008EE20  4B F7 4E D9 */	bl mathutil_mtxA_scale_xyz
/* 80092F04 0008EE24  48 00 00 30 */	b lbl_80092F34
lbl_80092F08:
/* 80092F08 0008EE28  C0 1D 00 1C */	lfs f0, 0x1c(r29)
/* 80092F0C 0008EE2C  C0 62 AF 88 */	lfs f3, l_lbl_802F5788@sda21(r2)
/* 80092F10 0008EE30  EC 3C 00 24 */	fdivs f1, f28, f0
/* 80092F14 0008EE34  FC 40 08 90 */	fmr f2, f1
/* 80092F18 0008EE38  4B F7 4E C1 */	bl mathutil_mtxA_scale_xyz
/* 80092F1C 0008EE3C  80 6D 99 80 */	lwz r3, mathutilData@sda21(r13)
/* 80092F20 0008EE40  D3 83 00 0C */	stfs f28, 0xc(r3)
/* 80092F24 0008EE44  80 6D 99 80 */	lwz r3, mathutilData@sda21(r13)
/* 80092F28 0008EE48  D3 83 00 1C */	stfs f28, 0x1c(r3)
/* 80092F2C 0008EE4C  80 6D 99 80 */	lwz r3, mathutilData@sda21(r13)
/* 80092F30 0008EE50  D3 E3 00 2C */	stfs f31, 0x2c(r3)
lbl_80092F34:
/* 80092F34 0008EE54  38 61 00 08 */	addi r3, r1, 8
/* 80092F38 0008EE58  4B F7 4D 09 */	bl mathutil_mtxA_mult_right
/* 80092F3C 0008EE5C  38 7D 00 80 */	addi r3, r29, 0x80
/* 80092F40 0008EE60  4B F7 49 39 */	bl mathutil_mtxA_to_mtx
lbl_80092F44:
/* 80092F44 0008EE64  3B DE FF FF */	addi r30, r30, -1
/* 80092F48 0008EE68  3B BD 00 E0 */	addi r29, r29, 0xe0
lbl_80092F4C:
/* 80092F4C 0008EE6C  2C 1E 00 00 */	cmpwi r30, 0
/* 80092F50 0008EE70  41 81 FE 88 */	bgt lbl_80092DD8
/* 80092F54 0008EE74  4B F7 48 E1 */	bl mathutil_mtxA_pop
/* 80092F58 0008EE78  80 01 00 AC */	lwz r0, 0xac(r1)
/* 80092F5C 0008EE7C  CB E1 00 A0 */	lfd f31, 0xa0(r1)
/* 80092F60 0008EE80  CB C1 00 98 */	lfd f30, 0x98(r1)
/* 80092F64 0008EE84  7C 08 03 A6 */	mtlr r0
/* 80092F68 0008EE88  CB A1 00 90 */	lfd f29, 0x90(r1)
/* 80092F6C 0008EE8C  CB 81 00 88 */	lfd f28, 0x88(r1)
/* 80092F70 0008EE90  CB 61 00 80 */	lfd f27, 0x80(r1)
/* 80092F74 0008EE94  CB 41 00 78 */	lfd f26, 0x78(r1)
/* 80092F78 0008EE98  83 E1 00 74 */	lwz r31, 0x74(r1)
/* 80092F7C 0008EE9C  83 C1 00 70 */	lwz r30, 0x70(r1)
/* 80092F80 0008EEA0  83 A1 00 6C */	lwz r29, 0x6c(r1)
/* 80092F84 0008EEA4  83 81 00 68 */	lwz r28, 0x68(r1)
/* 80092F88 0008EEA8  38 21 00 A8 */	addi r1, r1, 0xa8
/* 80092F8C 0008EEAC  4E 80 00 20 */	blr

.global func_80092F90
func_80092F90:
/* 80092F90 0008EEB0  7C 08 02 A6 */	mflr r0
/* 80092F94 0008EEB4  90 01 00 04 */	stw r0, 4(r1)
/* 80092F98 0008EEB8  94 21 FF 20 */	stwu r1, -0xe0(r1)
/* 80092F9C 0008EEBC  DB E1 00 D8 */	stfd f31, 0xd8(r1)
/* 80092FA0 0008EEC0  DB C1 00 D0 */	stfd f30, 0xd0(r1)
/* 80092FA4 0008EEC4  DB A1 00 C8 */	stfd f29, 0xc8(r1)
/* 80092FA8 0008EEC8  DB 81 00 C0 */	stfd f28, 0xc0(r1)
/* 80092FAC 0008EECC  DB 61 00 B8 */	stfd f27, 0xb8(r1)
/* 80092FB0 0008EED0  BF 01 00 98 */	stmw r24, 0x98(r1)
/* 80092FB4 0008EED4  80 0D 9F 70 */	lwz r0, l_lbl_802F2150@sda21(r13)
/* 80092FB8 0008EED8  2C 00 00 00 */	cmpwi r0, 0
/* 80092FBC 0008EEDC  41 82 04 CC */	beq lbl_80093488
/* 80092FC0 0008EEE0  80 83 00 00 */	lwz r4, 0(r3)
/* 80092FC4 0008EEE4  80 03 00 04 */	lwz r0, 4(r3)
/* 80092FC8 0008EEE8  90 81 00 60 */	stw r4, 0x60(r1)
/* 80092FCC 0008EEEC  90 01 00 64 */	stw r0, 0x64(r1)
/* 80092FD0 0008EEF0  A0 01 00 62 */	lhz r0, 0x62(r1)
/* 80092FD4 0008EEF4  28 00 00 03 */	cmplwi r0, 3
/* 80092FD8 0008EEF8  41 80 00 14 */	blt lbl_80092FEC
/* 80092FDC 0008EEFC  3C 60 80 09 */	lis r3, lbl_80093A0C@ha
/* 80092FE0 0008EF00  38 63 3A 0C */	addi r3, r3, lbl_80093A0C@l
/* 80092FE4 0008EF04  4B FF B6 05 */	bl u_avdisp_set_some_func_2
/* 80092FE8 0008EF08  7C 7A 1B 78 */	mr r26, r3
lbl_80092FEC:
/* 80092FEC 0008EF0C  A0 01 00 62 */	lhz r0, 0x62(r1)
/* 80092FF0 0008EF10  2C 00 00 03 */	cmpwi r0, 3
/* 80092FF4 0008EF14  40 80 00 34 */	bge lbl_80093028
/* 80092FF8 0008EF18  2C 00 00 00 */	cmpwi r0, 0
/* 80092FFC 0008EF1C  40 80 00 08 */	bge lbl_80093004
/* 80093000 0008EF20  48 00 00 28 */	b lbl_80093028
lbl_80093004:
/* 80093004 0008EF24  80 81 00 64 */	lwz r4, 0x64(r1)
/* 80093008 0008EF28  80 64 00 08 */	lwz r3, 8(r4)
/* 8009300C 0008EF2C  80 04 00 0C */	lwz r0, 0xc(r4)
/* 80093010 0008EF30  90 61 00 54 */	stw r3, 0x54(r1)
/* 80093014 0008EF34  90 01 00 58 */	stw r0, 0x58(r1)
/* 80093018 0008EF38  80 04 00 10 */	lwz r0, 0x10(r4)
/* 8009301C 0008EF3C  90 01 00 5C */	stw r0, 0x5c(r1)
/* 80093020 0008EF40  C3 A4 00 14 */	lfs f29, 0x14(r4)
/* 80093024 0008EF44  48 00 00 24 */	b lbl_80093048
lbl_80093028:
/* 80093028 0008EF48  80 81 00 64 */	lwz r4, 0x64(r1)
/* 8009302C 0008EF4C  80 64 00 08 */	lwz r3, 8(r4)
/* 80093030 0008EF50  80 04 00 0C */	lwz r0, 0xc(r4)
/* 80093034 0008EF54  90 61 00 54 */	stw r3, 0x54(r1)
/* 80093038 0008EF58  90 01 00 58 */	stw r0, 0x58(r1)
/* 8009303C 0008EF5C  80 04 00 10 */	lwz r0, 0x10(r4)
/* 80093040 0008EF60  90 01 00 5C */	stw r0, 0x5c(r1)
/* 80093044 0008EF64  C3 A4 00 14 */	lfs f29, 0x14(r4)
lbl_80093048:
/* 80093048 0008EF68  48 00 04 69 */	bl func_800934B0
/* 8009304C 0008EF6C  38 C0 00 00 */	li r6, 0
/* 80093050 0008EF70  FF E0 E8 50 */	fneg f31, f29
/* 80093054 0008EF74  90 C1 00 14 */	stw r6, 0x14(r1)
/* 80093058 0008EF78  3C 60 80 2B */	lis r3, shadow@ha
/* 8009305C 0008EF7C  38 03 57 A0 */	addi r0, r3, shadow@l
/* 80093060 0008EF80  83 8D 9F 70 */	lwz r28, l_lbl_802F2150@sda21(r13)
/* 80093064 0008EF84  90 C1 00 18 */	stw r6, 0x18(r1)
/* 80093068 0008EF88  3C 60 80 09 */	lis r3, lbl_800939F0@ha
/* 8009306C 0008EF8C  3C 80 80 2C */	lis r4, lbl_802B8FA0@ha
/* 80093070 0008EF90  CB 62 AF B0 */	lfd f27, l_lbl_802F57B0@sda21(r2)
/* 80093074 0008EF94  90 C1 00 1C */	stw r6, 0x1c(r1)
/* 80093078 0008EF98  38 A0 00 1E */	li r5, 0x1e
/* 8009307C 0008EF9C  CB C2 AF A8 */	lfd f30, l_lbl_802F57A8@sda21(r2) /* 0.0 */
/* 80093080 0008EFA0  90 A1 00 20 */	stw r5, 0x20(r1)
/* 80093084 0008EFA4  38 A0 00 FF */	li r5, 0xff
/* 80093088 0008EFA8  7C 1B 03 78 */	mr r27, r0
/* 8009308C 0008EFAC  90 C1 00 24 */	stw r6, 0x24(r1)
/* 80093090 0008EFB0  3B 23 39 F0 */	addi r25, r3, lbl_800939F0@l
/* 80093094 0008EFB4  3B A1 00 0C */	addi r29, r1, 0xc
/* 80093098 0008EFB8  90 C1 00 28 */	stw r6, 0x28(r1)
/* 8009309C 0008EFBC  3B E4 8F A0 */	addi r31, r4, lbl_802B8FA0@l
/* 800930A0 0008EFC0  3F C0 43 30 */	lis r30, 0x4330
/* 800930A4 0008EFC4  98 A1 00 2C */	stb r5, 0x2c(r1)
/* 800930A8 0008EFC8  98 A1 00 2D */	stb r5, 0x2d(r1)
/* 800930AC 0008EFCC  48 00 03 34 */	b lbl_800933E0
lbl_800930B0:
/* 800930B0 0008EFD0  C0 1B 00 40 */	lfs f0, 0x40(r27)
/* 800930B4 0008EFD4  FC 1E 00 00 */	fcmpu cr0, f30, f0
/* 800930B8 0008EFD8  41 82 03 20 */	beq lbl_800933D8
/* 800930BC 0008EFDC  A0 7B 00 2C */	lhz r3, 0x2c(r27)
/* 800930C0 0008EFE0  A0 01 00 60 */	lhz r0, 0x60(r1)
/* 800930C4 0008EFE4  7C 60 00 39 */	and. r0, r3, r0
/* 800930C8 0008EFE8  41 82 03 10 */	beq lbl_800933D8
/* 800930CC 0008EFEC  C3 9B 00 0C */	lfs f28, 0xc(r27)
/* 800930D0 0008EFF0  38 7B 00 68 */	addi r3, r27, 0x68
/* 800930D4 0008EFF4  38 81 00 48 */	addi r4, r1, 0x48
/* 800930D8 0008EFF8  4B F7 4D F5 */	bl mathutil_mtxA_rigid_inv_tf_point
/* 800930DC 0008EFFC  38 7B 00 5C */	addi r3, r27, 0x5c
/* 800930E0 0008F000  38 81 00 30 */	addi r4, r1, 0x30
/* 800930E4 0008F004  4B F7 4D E9 */	bl mathutil_mtxA_rigid_inv_tf_point
/* 800930E8 0008F008  C0 21 00 48 */	lfs f1, 0x48(r1)
/* 800930EC 0008F00C  38 61 00 3C */	addi r3, r1, 0x3c
/* 800930F0 0008F010  C0 01 00 30 */	lfs f0, 0x30(r1)
/* 800930F4 0008F014  C0 61 00 4C */	lfs f3, 0x4c(r1)
/* 800930F8 0008F018  EC 81 00 28 */	fsubs f4, f1, f0
/* 800930FC 0008F01C  C0 41 00 34 */	lfs f2, 0x34(r1)
/* 80093100 0008F020  C0 21 00 50 */	lfs f1, 0x50(r1)
/* 80093104 0008F024  C0 01 00 38 */	lfs f0, 0x38(r1)
/* 80093108 0008F028  EC 43 10 28 */	fsubs f2, f3, f2
/* 8009310C 0008F02C  D0 81 00 3C */	stfs f4, 0x3c(r1)
/* 80093110 0008F030  EC 01 00 28 */	fsubs f0, f1, f0
/* 80093114 0008F034  D0 41 00 40 */	stfs f2, 0x40(r1)
/* 80093118 0008F038  D0 01 00 44 */	stfs f0, 0x44(r1)
/* 8009311C 0008F03C  4B F7 4F E1 */	bl mathutil_vec_normalize_len
/* 80093120 0008F040  C0 21 00 54 */	lfs f1, 0x54(r1)
/* 80093124 0008F044  C0 01 00 48 */	lfs f0, 0x48(r1)
/* 80093128 0008F048  C0 61 00 58 */	lfs f3, 0x58(r1)
/* 8009312C 0008F04C  EC 81 00 28 */	fsubs f4, f1, f0
/* 80093130 0008F050  C0 41 00 4C */	lfs f2, 0x4c(r1)
/* 80093134 0008F054  C0 21 00 5C */	lfs f1, 0x5c(r1)
/* 80093138 0008F058  C0 01 00 50 */	lfs f0, 0x50(r1)
/* 8009313C 0008F05C  EC 43 10 28 */	fsubs f2, f3, f2
/* 80093140 0008F060  D0 81 00 30 */	stfs f4, 0x30(r1)
/* 80093144 0008F064  EC 01 00 28 */	fsubs f0, f1, f0
/* 80093148 0008F068  D0 41 00 34 */	stfs f2, 0x34(r1)
/* 8009314C 0008F06C  D0 01 00 38 */	stfs f0, 0x38(r1)
/* 80093150 0008F070  C0 A1 00 3C */	lfs f5, 0x3c(r1)
/* 80093154 0008F074  C0 81 00 30 */	lfs f4, 0x30(r1)
/* 80093158 0008F078  C0 21 00 40 */	lfs f1, 0x40(r1)
/* 8009315C 0008F07C  C0 61 00 34 */	lfs f3, 0x34(r1)
/* 80093160 0008F080  C0 01 00 44 */	lfs f0, 0x44(r1)
/* 80093164 0008F084  C0 41 00 38 */	lfs f2, 0x38(r1)
/* 80093168 0008F088  EC A5 01 32 */	fmuls f5, f5, f4
/* 8009316C 0008F08C  EC A1 28 FA */	fmadds f5, f1, f3, f5
/* 80093170 0008F090  EC A0 28 BA */	fmadds f5, f0, f2, f5
/* 80093174 0008F094  FC 05 F8 40 */	fcmpo cr0, f5, f31
/* 80093178 0008F098  41 80 02 60 */	blt lbl_800933D8
/* 8009317C 0008F09C  EC 1C E8 2A */	fadds f0, f28, f29
/* 80093180 0008F0A0  FC 05 00 40 */	fcmpo cr0, f5, f0
/* 80093184 0008F0A4  41 81 02 54 */	bgt lbl_800933D8
/* 80093188 0008F0A8  C0 1B 00 50 */	lfs f0, 0x50(r27)
/* 8009318C 0008F0AC  C0 3B 00 1C */	lfs f1, 0x1c(r27)
/* 80093190 0008F0B0  EC 00 07 32 */	fmuls f0, f0, f28
/* 80093194 0008F0B4  EC 01 00 2A */	fadds f0, f1, f0
/* 80093198 0008F0B8  EC 84 01 32 */	fmuls f4, f4, f4
/* 8009319C 0008F0BC  EC 83 20 FA */	fmadds f4, f3, f3, f4
/* 800931A0 0008F0C0  EC 82 20 BA */	fmadds f4, f2, f2, f4
/* 800931A4 0008F0C4  EC 25 01 72 */	fmuls f1, f5, f5
/* 800931A8 0008F0C8  EC 00 E8 2A */	fadds f0, f0, f29
/* 800931AC 0008F0CC  EC 24 08 28 */	fsubs f1, f4, f1
/* 800931B0 0008F0D0  EC 00 00 32 */	fmuls f0, f0, f0
/* 800931B4 0008F0D4  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800931B8 0008F0D8  41 81 02 20 */	bgt lbl_800933D8
/* 800931BC 0008F0DC  88 1B 00 38 */	lbz r0, 0x38(r27)
/* 800931C0 0008F0E0  7F A4 EB 78 */	mr r4, r29
/* 800931C4 0008F0E4  C0 3B 00 40 */	lfs f1, 0x40(r27)
/* 800931C8 0008F0E8  90 01 00 94 */	stw r0, 0x94(r1)
/* 800931CC 0008F0EC  80 61 00 24 */	lwz r3, 0x24(r1)
/* 800931D0 0008F0F0  93 C1 00 90 */	stw r30, 0x90(r1)
/* 800931D4 0008F0F4  C8 01 00 90 */	lfd f0, 0x90(r1)
/* 800931D8 0008F0F8  EC 00 D8 28 */	fsubs f0, f0, f27
/* 800931DC 0008F0FC  EC 00 00 72 */	fmuls f0, f0, f1
/* 800931E0 0008F100  FC 00 00 1E */	fctiwz f0, f0
/* 800931E4 0008F104  D8 01 00 88 */	stfd f0, 0x88(r1)
/* 800931E8 0008F108  80 01 00 8C */	lwz r0, 0x8c(r1)
/* 800931EC 0008F10C  98 01 00 10 */	stb r0, 0x10(r1)
/* 800931F0 0008F110  88 1B 00 39 */	lbz r0, 0x39(r27)
/* 800931F4 0008F114  90 01 00 84 */	stw r0, 0x84(r1)
/* 800931F8 0008F118  93 C1 00 80 */	stw r30, 0x80(r1)
/* 800931FC 0008F11C  C8 01 00 80 */	lfd f0, 0x80(r1)
/* 80093200 0008F120  EC 00 D8 28 */	fsubs f0, f0, f27
/* 80093204 0008F124  EC 00 00 72 */	fmuls f0, f0, f1
/* 80093208 0008F128  FC 00 00 1E */	fctiwz f0, f0
/* 8009320C 0008F12C  D8 01 00 78 */	stfd f0, 0x78(r1)
/* 80093210 0008F130  80 01 00 7C */	lwz r0, 0x7c(r1)
/* 80093214 0008F134  98 01 00 11 */	stb r0, 0x11(r1)
/* 80093218 0008F138  88 1B 00 3A */	lbz r0, 0x3a(r27)
/* 8009321C 0008F13C  90 01 00 74 */	stw r0, 0x74(r1)
/* 80093220 0008F140  93 C1 00 70 */	stw r30, 0x70(r1)
/* 80093224 0008F144  C8 01 00 70 */	lfd f0, 0x70(r1)
/* 80093228 0008F148  EC 00 D8 28 */	fsubs f0, f0, f27
/* 8009322C 0008F14C  EC 00 00 72 */	fmuls f0, f0, f1
/* 80093230 0008F150  FC 00 00 1E */	fctiwz f0, f0
/* 80093234 0008F154  D8 01 00 68 */	stfd f0, 0x68(r1)
/* 80093238 0008F158  80 01 00 6C */	lwz r0, 0x6c(r1)
/* 8009323C 0008F15C  98 01 00 12 */	stb r0, 0x12(r1)
/* 80093240 0008F160  80 01 00 10 */	lwz r0, 0x10(r1)
/* 80093244 0008F164  90 01 00 0C */	stw r0, 0xc(r1)
/* 80093248 0008F168  48 00 C0 F5 */	bl GXSetTevKColor_cached
/* 8009324C 0008F16C  80 61 00 24 */	lwz r3, 0x24(r1)
/* 80093250 0008F170  38 03 00 01 */	addi r0, r3, 1
/* 80093254 0008F174  90 01 00 24 */	stw r0, 0x24(r1)
/* 80093258 0008F178  4B F7 45 99 */	bl mathutil_mtxA_push
/* 8009325C 0008F17C  38 7B 00 80 */	addi r3, r27, 0x80
/* 80093260 0008F180  4B F7 49 F5 */	bl mathutil_mtxA_mult_left
/* 80093264 0008F184  80 6D 99 80 */	lwz r3, mathutilData@sda21(r13)
/* 80093268 0008F188  38 A0 00 00 */	li r5, 0
/* 8009326C 0008F18C  80 81 00 20 */	lwz r4, 0x20(r1)
/* 80093270 0008F190  48 05 13 C9 */	bl GXLoadTexMtxImm
/* 80093274 0008F194  80 61 00 20 */	lwz r3, 0x20(r1)
/* 80093278 0008F198  38 03 00 03 */	addi r0, r3, 3
/* 8009327C 0008F19C  90 01 00 20 */	stw r0, 0x20(r1)
/* 80093280 0008F1A0  4B F7 45 B5 */	bl mathutil_mtxA_pop
/* 80093284 0008F1A4  4B F7 45 6D */	bl mathutil_mtxA_push
/* 80093288 0008F1A8  38 7B 00 B0 */	addi r3, r27, 0xb0
/* 8009328C 0008F1AC  4B F7 49 C9 */	bl mathutil_mtxA_mult_left
/* 80093290 0008F1B0  80 6D 99 80 */	lwz r3, mathutilData@sda21(r13)
/* 80093294 0008F1B4  38 A0 00 00 */	li r5, 0
/* 80093298 0008F1B8  80 81 00 20 */	lwz r4, 0x20(r1)
/* 8009329C 0008F1BC  48 05 13 9D */	bl GXLoadTexMtxImm
/* 800932A0 0008F1C0  80 61 00 20 */	lwz r3, 0x20(r1)
/* 800932A4 0008F1C4  38 03 00 03 */	addi r0, r3, 3
/* 800932A8 0008F1C8  90 01 00 20 */	stw r0, 0x20(r1)
/* 800932AC 0008F1CC  4B F7 45 89 */	bl mathutil_mtxA_pop
/* 800932B0 0008F1D0  80 7B 00 3C */	lwz r3, 0x3c(r27)
/* 800932B4 0008F1D4  80 81 00 28 */	lwz r4, 0x28(r1)
/* 800932B8 0008F1D8  38 63 00 04 */	addi r3, r3, 4
/* 800932BC 0008F1DC  48 00 C1 75 */	bl GXLoadTexObj_cached
/* 800932C0 0008F1E0  80 81 00 28 */	lwz r4, 0x28(r1)
/* 800932C4 0008F1E4  38 7F 00 00 */	addi r3, r31, 0
/* 800932C8 0008F1E8  38 04 00 01 */	addi r0, r4, 1
/* 800932CC 0008F1EC  90 01 00 28 */	stw r0, 0x28(r1)
/* 800932D0 0008F1F0  80 81 00 28 */	lwz r4, 0x28(r1)
/* 800932D4 0008F1F4  48 00 C1 5D */	bl GXLoadTexObj_cached
/* 800932D8 0008F1F8  80 61 00 28 */	lwz r3, 0x28(r1)
/* 800932DC 0008F1FC  38 03 00 01 */	addi r0, r3, 1
/* 800932E0 0008F200  90 01 00 28 */	stw r0, 0x28(r1)
/* 800932E4 0008F204  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800932E8 0008F208  2C 00 00 00 */	cmpwi r0, 0
/* 800932EC 0008F20C  40 82 00 14 */	bne lbl_80093300
/* 800932F0 0008F210  80 61 00 18 */	lwz r3, 0x18(r1)
/* 800932F4 0008F214  38 03 00 02 */	addi r0, r3, 2
/* 800932F8 0008F218  90 01 00 18 */	stw r0, 0x18(r1)
/* 800932FC 0008F21C  48 00 00 10 */	b lbl_8009330C
lbl_80093300:
/* 80093300 0008F220  80 61 00 18 */	lwz r3, 0x18(r1)
/* 80093304 0008F224  38 03 00 03 */	addi r0, r3, 3
/* 80093308 0008F228  90 01 00 18 */	stw r0, 0x18(r1)
lbl_8009330C:
/* 8009330C 0008F22C  80 61 00 1C */	lwz r3, 0x1c(r1)
/* 80093310 0008F230  38 03 00 02 */	addi r0, r3, 2
/* 80093314 0008F234  90 01 00 1C */	stw r0, 0x1c(r1)
/* 80093318 0008F238  80 61 00 14 */	lwz r3, 0x14(r1)
/* 8009331C 0008F23C  38 03 00 01 */	addi r0, r3, 1
/* 80093320 0008F240  90 01 00 14 */	stw r0, 0x14(r1)
/* 80093324 0008F244  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80093328 0008F248  2C 00 00 04 */	cmpwi r0, 4
/* 8009332C 0008F24C  41 80 00 AC */	blt lbl_800933D8
/* 80093330 0008F250  80 61 00 18 */	lwz r3, 0x18(r1)
/* 80093334 0008F254  88 01 00 2C */	lbz r0, 0x2c(r1)
/* 80093338 0008F258  54 78 06 3E */	clrlwi r24, r3, 0x18
/* 8009333C 0008F25C  7C 00 C0 40 */	cmplw r0, r24
/* 80093340 0008F260  41 82 00 10 */	beq lbl_80093350
/* 80093344 0008F264  7F 03 C3 78 */	mr r3, r24
/* 80093348 0008F268  48 00 BF 81 */	bl GXSetNumTevStages_cached
/* 8009334C 0008F26C  9B 01 00 2C */	stb r24, 0x2c(r1)
lbl_80093350:
/* 80093350 0008F270  80 61 00 1C */	lwz r3, 0x1c(r1)
/* 80093354 0008F274  88 01 00 2D */	lbz r0, 0x2d(r1)
/* 80093358 0008F278  54 78 06 3E */	clrlwi r24, r3, 0x18
/* 8009335C 0008F27C  7C 00 C0 40 */	cmplw r0, r24
/* 80093360 0008F280  41 82 00 10 */	beq lbl_80093370
/* 80093364 0008F284  7F 03 C3 78 */	mr r3, r24
/* 80093368 0008F288  48 04 BC FD */	bl GXSetNumTexGens
/* 8009336C 0008F28C  9B 01 00 2D */	stb r24, 0x2d(r1)
lbl_80093370:
/* 80093370 0008F290  A0 01 00 62 */	lhz r0, 0x62(r1)
/* 80093374 0008F294  2C 00 00 06 */	cmpwi r0, 6
/* 80093378 0008F298  41 82 00 38 */	beq lbl_800933B0
/* 8009337C 0008F29C  40 80 00 3C */	bge lbl_800933B8
/* 80093380 0008F2A0  2C 00 00 03 */	cmpwi r0, 3
/* 80093384 0008F2A4  40 80 00 20 */	bge lbl_800933A4
/* 80093388 0008F2A8  2C 00 00 00 */	cmpwi r0, 0
/* 8009338C 0008F2AC  40 80 00 08 */	bge lbl_80093394
/* 80093390 0008F2B0  48 00 00 28 */	b lbl_800933B8
lbl_80093394:
/* 80093394 0008F2B4  80 61 00 64 */	lwz r3, 0x64(r1)
/* 80093398 0008F2B8  7F 24 CB 78 */	mr r4, r25
/* 8009339C 0008F2BC  4B FA 0C B1 */	bl u_draw_naomi_model_with_mesh_func
/* 800933A0 0008F2C0  48 00 00 18 */	b lbl_800933B8
lbl_800933A4:
/* 800933A4 0008F2C4  80 61 00 64 */	lwz r3, 0x64(r1)
/* 800933A8 0008F2C8  4B FF BB 19 */	bl u_avdisp_draw_model_4
/* 800933AC 0008F2CC  48 00 00 0C */	b lbl_800933B8
lbl_800933B0:
/* 800933B0 0008F2D0  80 61 00 64 */	lwz r3, 0x64(r1)
/* 800933B4 0008F2D4  4B FF B6 B1 */	bl avdisp_draw_model_unculled_sort_none
lbl_800933B8:
/* 800933B8 0008F2D8  38 60 00 00 */	li r3, 0
/* 800933BC 0008F2DC  90 61 00 14 */	stw r3, 0x14(r1)
/* 800933C0 0008F2E0  38 00 00 1E */	li r0, 0x1e
/* 800933C4 0008F2E4  90 61 00 18 */	stw r3, 0x18(r1)
/* 800933C8 0008F2E8  90 61 00 1C */	stw r3, 0x1c(r1)
/* 800933CC 0008F2EC  90 01 00 20 */	stw r0, 0x20(r1)
/* 800933D0 0008F2F0  90 61 00 24 */	stw r3, 0x24(r1)
/* 800933D4 0008F2F4  90 61 00 28 */	stw r3, 0x28(r1)
lbl_800933D8:
/* 800933D8 0008F2F8  3B 9C FF FF */	addi r28, r28, -1
/* 800933DC 0008F2FC  3B 7B 00 E0 */	addi r27, r27, 0xe0
lbl_800933E0:
/* 800933E0 0008F300  2C 1C 00 00 */	cmpwi r28, 0
/* 800933E4 0008F304  41 81 FC CC */	bgt lbl_800930B0
/* 800933E8 0008F308  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800933EC 0008F30C  2C 00 00 00 */	cmpwi r0, 0
/* 800933F0 0008F310  41 82 00 80 */	beq lbl_80093470
/* 800933F4 0008F314  80 61 00 18 */	lwz r3, 0x18(r1)
/* 800933F8 0008F318  88 01 00 2C */	lbz r0, 0x2c(r1)
/* 800933FC 0008F31C  54 63 06 3E */	clrlwi r3, r3, 0x18
/* 80093400 0008F320  7C 00 18 40 */	cmplw r0, r3
/* 80093404 0008F324  41 82 00 08 */	beq lbl_8009340C
/* 80093408 0008F328  48 00 BE C1 */	bl GXSetNumTevStages_cached
lbl_8009340C:
/* 8009340C 0008F32C  80 61 00 1C */	lwz r3, 0x1c(r1)
/* 80093410 0008F330  88 01 00 2D */	lbz r0, 0x2d(r1)
/* 80093414 0008F334  54 63 06 3E */	clrlwi r3, r3, 0x18
/* 80093418 0008F338  7C 00 18 40 */	cmplw r0, r3
/* 8009341C 0008F33C  41 82 00 08 */	beq lbl_80093424
/* 80093420 0008F340  48 04 BC 45 */	bl GXSetNumTexGens
lbl_80093424:
/* 80093424 0008F344  A0 01 00 62 */	lhz r0, 0x62(r1)
/* 80093428 0008F348  2C 00 00 06 */	cmpwi r0, 6
/* 8009342C 0008F34C  41 82 00 3C */	beq lbl_80093468
/* 80093430 0008F350  40 80 00 40 */	bge lbl_80093470
/* 80093434 0008F354  2C 00 00 03 */	cmpwi r0, 3
/* 80093438 0008F358  40 80 00 24 */	bge lbl_8009345C
/* 8009343C 0008F35C  2C 00 00 00 */	cmpwi r0, 0
/* 80093440 0008F360  40 80 00 08 */	bge lbl_80093448
/* 80093444 0008F364  48 00 00 2C */	b lbl_80093470
lbl_80093448:
/* 80093448 0008F368  3C 80 80 09 */	lis r4, lbl_800939F0@ha
/* 8009344C 0008F36C  80 61 00 64 */	lwz r3, 0x64(r1)
/* 80093450 0008F370  38 84 39 F0 */	addi r4, r4, lbl_800939F0@l
/* 80093454 0008F374  4B FA 0B F9 */	bl u_draw_naomi_model_with_mesh_func
/* 80093458 0008F378  48 00 00 18 */	b lbl_80093470
lbl_8009345C:
/* 8009345C 0008F37C  80 61 00 64 */	lwz r3, 0x64(r1)
/* 80093460 0008F380  4B FF BA 61 */	bl u_avdisp_draw_model_4
/* 80093464 0008F384  48 00 00 0C */	b lbl_80093470
lbl_80093468:
/* 80093468 0008F388  80 61 00 64 */	lwz r3, 0x64(r1)
/* 8009346C 0008F38C  4B FF B5 F9 */	bl avdisp_draw_model_unculled_sort_none
lbl_80093470:
/* 80093470 0008F390  A0 01 00 62 */	lhz r0, 0x62(r1)
/* 80093474 0008F394  28 00 00 03 */	cmplwi r0, 3
/* 80093478 0008F398  41 80 00 0C */	blt lbl_80093484
/* 8009347C 0008F39C  7F 43 D3 78 */	mr r3, r26
/* 80093480 0008F3A0  4B FF B1 69 */	bl u_avdisp_set_some_func_2
lbl_80093484:
/* 80093484 0008F3A4  48 00 04 9D */	bl func_80093920
lbl_80093488:
/* 80093488 0008F3A8  BB 01 00 98 */	lmw r24, 0x98(r1)
/* 8009348C 0008F3AC  80 01 00 E4 */	lwz r0, 0xe4(r1)
/* 80093490 0008F3B0  CB E1 00 D8 */	lfd f31, 0xd8(r1)
/* 80093494 0008F3B4  CB C1 00 D0 */	lfd f30, 0xd0(r1)
/* 80093498 0008F3B8  7C 08 03 A6 */	mtlr r0
/* 8009349C 0008F3BC  CB A1 00 C8 */	lfd f29, 0xc8(r1)
/* 800934A0 0008F3C0  CB 81 00 C0 */	lfd f28, 0xc0(r1)
/* 800934A4 0008F3C4  CB 61 00 B8 */	lfd f27, 0xb8(r1)
/* 800934A8 0008F3C8  38 21 00 E0 */	addi r1, r1, 0xe0
/* 800934AC 0008F3CC  4E 80 00 20 */	blr

.global func_800934B0
func_800934B0:
/* 800934B0 0008F3D0  7C 08 02 A6 */	mflr r0
/* 800934B4 0008F3D4  38 60 00 01 */	li r3, 1
/* 800934B8 0008F3D8  90 01 00 04 */	stw r0, 4(r1)
/* 800934BC 0008F3DC  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 800934C0 0008F3E0  BF 41 00 10 */	stmw r26, 0x10(r1)
/* 800934C4 0008F3E4  48 04 D8 11 */	bl GXSetNumChans
/* 800934C8 0008F3E8  38 60 00 00 */	li r3, 0
/* 800934CC 0008F3EC  38 80 00 00 */	li r4, 0
/* 800934D0 0008F3F0  38 A0 00 00 */	li r5, 0
/* 800934D4 0008F3F4  38 C0 00 1E */	li r6, 0x1e
/* 800934D8 0008F3F8  38 E0 00 00 */	li r7, 0
/* 800934DC 0008F3FC  39 00 00 7D */	li r8, 0x7d
/* 800934E0 0008F400  48 04 B8 B5 */	bl GXSetTexCoordGen2
/* 800934E4 0008F404  38 60 00 00 */	li r3, 0
/* 800934E8 0008F408  38 80 00 00 */	li r4, 0
/* 800934EC 0008F40C  38 A0 00 00 */	li r5, 0
/* 800934F0 0008F410  38 C0 00 04 */	li r6, 4
/* 800934F4 0008F414  48 00 BB 01 */	bl GXSetTevOrder_cached
/* 800934F8 0008F418  38 60 00 00 */	li r3, 0
/* 800934FC 0008F41C  48 04 EB E1 */	bl GXSetTevDirect
/* 80093500 0008F420  38 60 00 00 */	li r3, 0
/* 80093504 0008F424  38 80 00 00 */	li r4, 0
/* 80093508 0008F428  38 A0 00 01 */	li r5, 1
/* 8009350C 0008F42C  48 00 AD BD */	bl GXSetTevSwapMode_cached
/* 80093510 0008F430  38 60 00 00 */	li r3, 0
/* 80093514 0008F434  38 80 00 0C */	li r4, 0xc
/* 80093518 0008F438  48 00 BC 69 */	bl GXSetTevKColorSel_cached
/* 8009351C 0008F43C  38 60 00 00 */	li r3, 0
/* 80093520 0008F440  38 80 00 0F */	li r4, 0xf
/* 80093524 0008F444  38 A0 00 0E */	li r5, 0xe
/* 80093528 0008F448  38 C0 00 08 */	li r6, 8
/* 8009352C 0008F44C  38 E0 00 0F */	li r7, 0xf
/* 80093530 0008F450  48 00 B0 E9 */	bl GXSetTevColorIn_cached
/* 80093534 0008F454  38 60 00 00 */	li r3, 0
/* 80093538 0008F458  38 80 00 00 */	li r4, 0
/* 8009353C 0008F45C  38 A0 00 00 */	li r5, 0
/* 80093540 0008F460  38 C0 00 00 */	li r6, 0
/* 80093544 0008F464  38 E0 00 01 */	li r7, 1
/* 80093548 0008F468  39 00 00 00 */	li r8, 0
/* 8009354C 0008F46C  48 00 B2 B5 */	bl GXSetTevColorOp_cached
/* 80093550 0008F470  38 60 00 00 */	li r3, 0
/* 80093554 0008F474  38 80 00 07 */	li r4, 7
/* 80093558 0008F478  38 A0 00 07 */	li r5, 7
/* 8009355C 0008F47C  38 C0 00 07 */	li r6, 7
/* 80093560 0008F480  38 E0 00 04 */	li r7, 4
/* 80093564 0008F484  48 00 B1 A9 */	bl GXSetTevAlphaIn_cached
/* 80093568 0008F488  38 60 00 00 */	li r3, 0
/* 8009356C 0008F48C  38 80 00 00 */	li r4, 0
/* 80093570 0008F490  38 A0 00 00 */	li r5, 0
/* 80093574 0008F494  38 C0 00 00 */	li r6, 0
/* 80093578 0008F498  38 E0 00 01 */	li r7, 1
/* 8009357C 0008F49C  39 00 00 00 */	li r8, 0
/* 80093580 0008F4A0  48 00 B3 99 */	bl GXSetTevAlphaOp_cached
/* 80093584 0008F4A4  3B 60 00 0D */	li r27, 0xd
/* 80093588 0008F4A8  38 60 00 01 */	li r3, 1
/* 8009358C 0008F4AC  38 80 00 00 */	li r4, 0
/* 80093590 0008F4B0  38 A0 00 00 */	li r5, 0
/* 80093594 0008F4B4  38 C0 00 21 */	li r6, 0x21
/* 80093598 0008F4B8  38 E0 00 00 */	li r7, 0
/* 8009359C 0008F4BC  39 00 00 7D */	li r8, 0x7d
/* 800935A0 0008F4C0  48 04 B7 F5 */	bl GXSetTexCoordGen2
/* 800935A4 0008F4C4  38 60 00 01 */	li r3, 1
/* 800935A8 0008F4C8  38 80 00 01 */	li r4, 1
/* 800935AC 0008F4CC  38 A0 00 01 */	li r5, 1
/* 800935B0 0008F4D0  38 C0 00 FF */	li r6, 0xff
/* 800935B4 0008F4D4  48 00 BA 41 */	bl GXSetTevOrder_cached
/* 800935B8 0008F4D8  38 60 00 01 */	li r3, 1
/* 800935BC 0008F4DC  48 04 EB 21 */	bl GXSetTevDirect
/* 800935C0 0008F4E0  38 60 00 01 */	li r3, 1
/* 800935C4 0008F4E4  38 80 00 00 */	li r4, 0
/* 800935C8 0008F4E8  38 A0 00 01 */	li r5, 1
/* 800935CC 0008F4EC  48 00 AC FD */	bl GXSetTevSwapMode_cached
/* 800935D0 0008F4F0  38 60 00 01 */	li r3, 1
/* 800935D4 0008F4F4  38 80 00 0F */	li r4, 0xf
/* 800935D8 0008F4F8  38 A0 00 08 */	li r5, 8
/* 800935DC 0008F4FC  38 C0 00 00 */	li r6, 0
/* 800935E0 0008F500  38 E0 00 0C */	li r7, 0xc
/* 800935E4 0008F504  48 00 B0 35 */	bl GXSetTevColorIn_cached
/* 800935E8 0008F508  38 60 00 01 */	li r3, 1
/* 800935EC 0008F50C  38 80 00 01 */	li r4, 1
/* 800935F0 0008F510  38 A0 00 00 */	li r5, 0
/* 800935F4 0008F514  38 C0 00 00 */	li r6, 0
/* 800935F8 0008F518  38 E0 00 01 */	li r7, 1
/* 800935FC 0008F51C  39 00 00 00 */	li r8, 0
/* 80093600 0008F520  48 00 B2 01 */	bl GXSetTevColorOp_cached
/* 80093604 0008F524  38 60 00 01 */	li r3, 1
/* 80093608 0008F528  38 80 00 07 */	li r4, 7
/* 8009360C 0008F52C  38 A0 00 00 */	li r5, 0
/* 80093610 0008F530  38 C0 00 04 */	li r6, 4
/* 80093614 0008F534  38 E0 00 07 */	li r7, 7
/* 80093618 0008F538  48 00 B0 F5 */	bl GXSetTevAlphaIn_cached
/* 8009361C 0008F53C  38 60 00 01 */	li r3, 1
/* 80093620 0008F540  38 80 00 00 */	li r4, 0
/* 80093624 0008F544  38 A0 00 00 */	li r5, 0
/* 80093628 0008F548  38 C0 00 00 */	li r6, 0
/* 8009362C 0008F54C  38 E0 00 01 */	li r7, 1
/* 80093630 0008F550  39 00 00 00 */	li r8, 0
/* 80093634 0008F554  48 00 B2 E5 */	bl GXSetTevAlphaOp_cached
/* 80093638 0008F558  80 6D 9F 70 */	lwz r3, l_lbl_802F2150@sda21(r13)
/* 8009363C 0008F55C  3B C0 00 02 */	li r30, 2
/* 80093640 0008F560  3B A0 00 02 */	li r29, 2
/* 80093644 0008F564  2C 03 00 04 */	cmpwi r3, 4
/* 80093648 0008F568  3B 80 00 24 */	li r28, 0x24
/* 8009364C 0008F56C  3B 40 00 02 */	li r26, 2
/* 80093650 0008F570  40 81 00 08 */	ble lbl_80093658
/* 80093654 0008F574  38 60 00 04 */	li r3, 4
lbl_80093658:
/* 80093658 0008F578  3B E3 FF FF */	addi r31, r3, -1
/* 8009365C 0008F57C  48 00 02 10 */	b lbl_8009386C
lbl_80093660:
/* 80093660 0008F580  38 7D 00 00 */	addi r3, r29, 0
/* 80093664 0008F584  38 DC 00 00 */	addi r6, r28, 0
/* 80093668 0008F588  38 80 00 00 */	li r4, 0
/* 8009366C 0008F58C  38 A0 00 00 */	li r5, 0
/* 80093670 0008F590  38 E0 00 00 */	li r7, 0
/* 80093674 0008F594  39 00 00 7D */	li r8, 0x7d
/* 80093678 0008F598  48 04 B7 1D */	bl GXSetTexCoordGen2
/* 8009367C 0008F59C  38 7E 00 00 */	addi r3, r30, 0
/* 80093680 0008F5A0  38 9D 00 00 */	addi r4, r29, 0
/* 80093684 0008F5A4  38 BA 00 00 */	addi r5, r26, 0
/* 80093688 0008F5A8  38 C0 00 04 */	li r6, 4
/* 8009368C 0008F5AC  48 00 B9 69 */	bl GXSetTevOrder_cached
/* 80093690 0008F5B0  7F C3 F3 78 */	mr r3, r30
/* 80093694 0008F5B4  48 04 EA 49 */	bl GXSetTevDirect
/* 80093698 0008F5B8  38 7E 00 00 */	addi r3, r30, 0
/* 8009369C 0008F5BC  38 80 00 00 */	li r4, 0
/* 800936A0 0008F5C0  38 A0 00 01 */	li r5, 1
/* 800936A4 0008F5C4  48 00 AC 25 */	bl GXSetTevSwapMode_cached
/* 800936A8 0008F5C8  38 7E 00 00 */	addi r3, r30, 0
/* 800936AC 0008F5CC  38 9B 00 00 */	addi r4, r27, 0
/* 800936B0 0008F5D0  48 00 BA D1 */	bl GXSetTevKColorSel_cached
/* 800936B4 0008F5D4  38 7E 00 00 */	addi r3, r30, 0
/* 800936B8 0008F5D8  38 80 00 0F */	li r4, 0xf
/* 800936BC 0008F5DC  38 A0 00 0E */	li r5, 0xe
/* 800936C0 0008F5E0  38 C0 00 08 */	li r6, 8
/* 800936C4 0008F5E4  38 E0 00 0F */	li r7, 0xf
/* 800936C8 0008F5E8  48 00 AF 51 */	bl GXSetTevColorIn_cached
/* 800936CC 0008F5EC  38 7E 00 00 */	addi r3, r30, 0
/* 800936D0 0008F5F0  38 80 00 00 */	li r4, 0
/* 800936D4 0008F5F4  38 A0 00 00 */	li r5, 0
/* 800936D8 0008F5F8  38 C0 00 00 */	li r6, 0
/* 800936DC 0008F5FC  38 E0 00 01 */	li r7, 1
/* 800936E0 0008F600  39 00 00 01 */	li r8, 1
/* 800936E4 0008F604  48 00 B1 1D */	bl GXSetTevColorOp_cached
/* 800936E8 0008F608  38 7E 00 00 */	addi r3, r30, 0
/* 800936EC 0008F60C  38 80 00 07 */	li r4, 7
/* 800936F0 0008F610  38 A0 00 07 */	li r5, 7
/* 800936F4 0008F614  38 C0 00 07 */	li r6, 7
/* 800936F8 0008F618  38 E0 00 04 */	li r7, 4
/* 800936FC 0008F61C  48 00 B0 11 */	bl GXSetTevAlphaIn_cached
/* 80093700 0008F620  38 7E 00 00 */	addi r3, r30, 0
/* 80093704 0008F624  38 80 00 00 */	li r4, 0
/* 80093708 0008F628  38 A0 00 00 */	li r5, 0
/* 8009370C 0008F62C  38 C0 00 00 */	li r6, 0
/* 80093710 0008F630  38 E0 00 01 */	li r7, 1
/* 80093714 0008F634  39 00 00 01 */	li r8, 1
/* 80093718 0008F638  48 00 B2 01 */	bl GXSetTevAlphaOp_cached
/* 8009371C 0008F63C  3B 9C 00 03 */	addi r28, r28, 3
/* 80093720 0008F640  38 DC 00 00 */	addi r6, r28, 0
/* 80093724 0008F644  38 7D 00 01 */	addi r3, r29, 1
/* 80093728 0008F648  38 80 00 00 */	li r4, 0
/* 8009372C 0008F64C  38 A0 00 00 */	li r5, 0
/* 80093730 0008F650  38 E0 00 00 */	li r7, 0
/* 80093734 0008F654  39 00 00 7D */	li r8, 0x7d
/* 80093738 0008F658  3B 7B 00 01 */	addi r27, r27, 1
/* 8009373C 0008F65C  48 04 B6 59 */	bl GXSetTexCoordGen2
/* 80093740 0008F660  38 7E 00 01 */	addi r3, r30, 1
/* 80093744 0008F664  38 9D 00 01 */	addi r4, r29, 1
/* 80093748 0008F668  38 BA 00 01 */	addi r5, r26, 1
/* 8009374C 0008F66C  38 C0 00 FF */	li r6, 0xff
/* 80093750 0008F670  48 00 B8 A5 */	bl GXSetTevOrder_cached
/* 80093754 0008F674  38 7E 00 01 */	addi r3, r30, 1
/* 80093758 0008F678  48 04 E9 85 */	bl GXSetTevDirect
/* 8009375C 0008F67C  38 7E 00 01 */	addi r3, r30, 1
/* 80093760 0008F680  38 80 00 00 */	li r4, 0
/* 80093764 0008F684  38 A0 00 01 */	li r5, 1
/* 80093768 0008F688  48 00 AB 61 */	bl GXSetTevSwapMode_cached
/* 8009376C 0008F68C  38 7E 00 01 */	addi r3, r30, 1
/* 80093770 0008F690  38 80 00 0F */	li r4, 0xf
/* 80093774 0008F694  38 A0 00 08 */	li r5, 8
/* 80093778 0008F698  38 C0 00 02 */	li r6, 2
/* 8009377C 0008F69C  38 E0 00 0C */	li r7, 0xc
/* 80093780 0008F6A0  48 00 AE 99 */	bl GXSetTevColorIn_cached
/* 80093784 0008F6A4  38 7E 00 01 */	addi r3, r30, 1
/* 80093788 0008F6A8  38 80 00 01 */	li r4, 1
/* 8009378C 0008F6AC  38 A0 00 00 */	li r5, 0
/* 80093790 0008F6B0  38 C0 00 00 */	li r6, 0
/* 80093794 0008F6B4  38 E0 00 01 */	li r7, 1
/* 80093798 0008F6B8  39 00 00 01 */	li r8, 1
/* 8009379C 0008F6BC  48 00 B0 65 */	bl GXSetTevColorOp_cached
/* 800937A0 0008F6C0  38 7E 00 01 */	addi r3, r30, 1
/* 800937A4 0008F6C4  38 80 00 07 */	li r4, 7
/* 800937A8 0008F6C8  38 A0 00 01 */	li r5, 1
/* 800937AC 0008F6CC  38 C0 00 04 */	li r6, 4
/* 800937B0 0008F6D0  38 E0 00 07 */	li r7, 7
/* 800937B4 0008F6D4  48 00 AF 59 */	bl GXSetTevAlphaIn_cached
/* 800937B8 0008F6D8  38 7E 00 01 */	addi r3, r30, 1
/* 800937BC 0008F6DC  38 80 00 00 */	li r4, 0
/* 800937C0 0008F6E0  38 A0 00 00 */	li r5, 0
/* 800937C4 0008F6E4  38 C0 00 00 */	li r6, 0
/* 800937C8 0008F6E8  38 E0 00 01 */	li r7, 1
/* 800937CC 0008F6EC  39 00 00 01 */	li r8, 1
/* 800937D0 0008F6F0  48 00 B1 49 */	bl GXSetTevAlphaOp_cached
/* 800937D4 0008F6F4  38 7E 00 02 */	addi r3, r30, 2
/* 800937D8 0008F6F8  38 80 00 FF */	li r4, 0xff
/* 800937DC 0008F6FC  38 A0 00 FF */	li r5, 0xff
/* 800937E0 0008F700  38 C0 00 FF */	li r6, 0xff
/* 800937E4 0008F704  3B BD 00 02 */	addi r29, r29, 2
/* 800937E8 0008F708  3B 9C 00 03 */	addi r28, r28, 3
/* 800937EC 0008F70C  3B 5A 00 02 */	addi r26, r26, 2
/* 800937F0 0008F710  48 00 B8 05 */	bl GXSetTevOrder_cached
/* 800937F4 0008F714  38 7E 00 02 */	addi r3, r30, 2
/* 800937F8 0008F718  48 04 E8 E5 */	bl GXSetTevDirect
/* 800937FC 0008F71C  38 7E 00 02 */	addi r3, r30, 2
/* 80093800 0008F720  38 80 00 0F */	li r4, 0xf
/* 80093804 0008F724  38 A0 00 02 */	li r5, 2
/* 80093808 0008F728  38 C0 00 00 */	li r6, 0
/* 8009380C 0008F72C  38 E0 00 0F */	li r7, 0xf
/* 80093810 0008F730  48 00 AE 09 */	bl GXSetTevColorIn_cached
/* 80093814 0008F734  38 7E 00 02 */	addi r3, r30, 2
/* 80093818 0008F738  38 80 00 00 */	li r4, 0
/* 8009381C 0008F73C  38 A0 00 00 */	li r5, 0
/* 80093820 0008F740  38 C0 00 00 */	li r6, 0
/* 80093824 0008F744  38 E0 00 01 */	li r7, 1
/* 80093828 0008F748  39 00 00 00 */	li r8, 0
/* 8009382C 0008F74C  48 00 AF D5 */	bl GXSetTevColorOp_cached
/* 80093830 0008F750  38 7E 00 02 */	addi r3, r30, 2
/* 80093834 0008F754  38 80 00 01 */	li r4, 1
/* 80093838 0008F758  38 A0 00 07 */	li r5, 7
/* 8009383C 0008F75C  38 C0 00 07 */	li r6, 7
/* 80093840 0008F760  38 E0 00 00 */	li r7, 0
/* 80093844 0008F764  48 00 AE C9 */	bl GXSetTevAlphaIn_cached
/* 80093848 0008F768  38 7E 00 02 */	addi r3, r30, 2
/* 8009384C 0008F76C  38 80 00 00 */	li r4, 0
/* 80093850 0008F770  38 A0 00 00 */	li r5, 0
/* 80093854 0008F774  38 C0 00 00 */	li r6, 0
/* 80093858 0008F778  38 E0 00 01 */	li r7, 1
/* 8009385C 0008F77C  39 00 00 00 */	li r8, 0
/* 80093860 0008F780  48 00 B0 B9 */	bl GXSetTevAlphaOp_cached
/* 80093864 0008F784  3B DE 00 03 */	addi r30, r30, 3
/* 80093868 0008F788  3B FF FF FF */	addi r31, r31, -1
lbl_8009386C:
/* 8009386C 0008F78C  2C 1F 00 00 */	cmpwi r31, 0
/* 80093870 0008F790  41 81 FD F0 */	bgt lbl_80093660
/* 80093874 0008F794  38 60 00 00 */	li r3, 0
/* 80093878 0008F798  48 04 E8 39 */	bl GXSetNumIndStages
/* 8009387C 0008F79C  38 60 00 01 */	li r3, 1
/* 80093880 0008F7A0  38 80 00 00 */	li r4, 0
/* 80093884 0008F7A4  38 A0 00 02 */	li r5, 2
/* 80093888 0008F7A8  38 C0 00 00 */	li r6, 0
/* 8009388C 0008F7AC  48 00 A8 85 */	bl GXSetBlendMode_cached
/* 80093890 0008F7B0  80 6D 9F C0 */	lwz r3, gxCache@sda21(r13)
/* 80093894 0008F7B4  88 03 00 08 */	lbz r0, 8(r3)
/* 80093898 0008F7B8  28 00 00 01 */	cmplwi r0, 1
/* 8009389C 0008F7BC  40 82 00 1C */	bne lbl_800938B8
/* 800938A0 0008F7C0  80 03 00 04 */	lwz r0, 4(r3)
/* 800938A4 0008F7C4  2C 00 00 02 */	cmpwi r0, 2
/* 800938A8 0008F7C8  40 82 00 10 */	bne lbl_800938B8
/* 800938AC 0008F7CC  88 03 00 00 */	lbz r0, 0(r3)
/* 800938B0 0008F7D0  28 00 00 01 */	cmplwi r0, 1
/* 800938B4 0008F7D4  41 82 00 34 */	beq lbl_800938E8
lbl_800938B8:
/* 800938B8 0008F7D8  38 60 00 01 */	li r3, 1
/* 800938BC 0008F7DC  38 80 00 02 */	li r4, 2
/* 800938C0 0008F7E0  38 A0 00 01 */	li r5, 1
/* 800938C4 0008F7E4  48 04 F7 11 */	bl GXSetZMode
/* 800938C8 0008F7E8  80 6D 9F C0 */	lwz r3, gxCache@sda21(r13)
/* 800938CC 0008F7EC  38 80 00 01 */	li r4, 1
/* 800938D0 0008F7F0  38 00 00 02 */	li r0, 2
/* 800938D4 0008F7F4  98 83 00 00 */	stb r4, 0(r3)
/* 800938D8 0008F7F8  80 6D 9F C0 */	lwz r3, gxCache@sda21(r13)
/* 800938DC 0008F7FC  90 03 00 04 */	stw r0, 4(r3)
/* 800938E0 0008F800  80 6D 9F C0 */	lwz r3, gxCache@sda21(r13)
/* 800938E4 0008F804  98 83 00 08 */	stb r4, 8(r3)
lbl_800938E8:
/* 800938E8 0008F808  80 02 AF B8 */	lwz r0, l_shadow_color@sda21(r2)
/* 800938EC 0008F80C  38 81 00 08 */	addi r4, r1, 8
/* 800938F0 0008F810  C0 22 AF 88 */	lfs f1, l_lbl_802F5788@sda21(r2)
/* 800938F4 0008F814  38 60 00 00 */	li r3, 0
/* 800938F8 0008F818  90 01 00 08 */	stw r0, 8(r1)
/* 800938FC 0008F81C  C0 42 AF BC */	lfs f2, l_lbl_802F57BC@sda21(r2)
/* 80093900 0008F820  C0 62 AF C0 */	lfs f3, l_lbl_802F57C0@sda21(r2)
/* 80093904 0008F824  C0 82 AF C4 */	lfs f4, l_lbl_802F57C4@sda21(r2)
/* 80093908 0008F828  48 00 AA 91 */	bl GXSetFog_cached
/* 8009390C 0008F82C  BB 41 00 10 */	lmw r26, 0x10(r1)
/* 80093910 0008F830  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80093914 0008F834  38 21 00 28 */	addi r1, r1, 0x28
/* 80093918 0008F838  7C 08 03 A6 */	mtlr r0
/* 8009391C 0008F83C  4E 80 00 20 */	blr

.global func_80093920
func_80093920:
/* 80093920 0008F840  7C 08 02 A6 */	mflr r0
/* 80093924 0008F844  90 01 00 04 */	stw r0, 4(r1)
/* 80093928 0008F848  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8009392C 0008F84C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80093930 0008F850  93 C1 00 08 */	stw r30, 8(r1)
/* 80093934 0008F854  3B C0 00 00 */	li r30, 0
/* 80093938 0008F858  80 0D 9F 70 */	lwz r0, l_lbl_802F2150@sda21(r13)
/* 8009393C 0008F85C  2C 00 00 04 */	cmpwi r0, 4
/* 80093940 0008F860  40 81 00 08 */	ble lbl_80093948
/* 80093944 0008F864  38 00 00 04 */	li r0, 4
lbl_80093948:
/* 80093948 0008F868  7C 1F 03 78 */	mr r31, r0
/* 8009394C 0008F86C  48 00 00 2C */	b lbl_80093978
lbl_80093950:
/* 80093950 0008F870  38 7E 00 00 */	addi r3, r30, 0
/* 80093954 0008F874  38 80 00 00 */	li r4, 0
/* 80093958 0008F878  38 A0 00 00 */	li r5, 0
/* 8009395C 0008F87C  48 00 A9 6D */	bl GXSetTevSwapMode_cached
/* 80093960 0008F880  38 7E 00 01 */	addi r3, r30, 1
/* 80093964 0008F884  38 80 00 00 */	li r4, 0
/* 80093968 0008F888  38 A0 00 00 */	li r5, 0
/* 8009396C 0008F88C  48 00 A9 5D */	bl GXSetTevSwapMode_cached
/* 80093970 0008F890  3B DE 00 02 */	addi r30, r30, 2
/* 80093974 0008F894  3B FF FF FF */	addi r31, r31, -1
lbl_80093978:
/* 80093978 0008F898  2C 1F 00 00 */	cmpwi r31, 0
/* 8009397C 0008F89C  41 81 FF D4 */	bgt lbl_80093950
/* 80093980 0008F8A0  80 6D 9F C0 */	lwz r3, gxCache@sda21(r13)
/* 80093984 0008F8A4  88 03 00 08 */	lbz r0, 8(r3)
/* 80093988 0008F8A8  28 00 00 01 */	cmplwi r0, 1
/* 8009398C 0008F8AC  40 82 00 1C */	bne lbl_800939A8
/* 80093990 0008F8B0  80 03 00 04 */	lwz r0, 4(r3)
/* 80093994 0008F8B4  2C 00 00 03 */	cmpwi r0, 3
/* 80093998 0008F8B8  40 82 00 10 */	bne lbl_800939A8
/* 8009399C 0008F8BC  88 03 00 00 */	lbz r0, 0(r3)
/* 800939A0 0008F8C0  28 00 00 01 */	cmplwi r0, 1
/* 800939A4 0008F8C4  41 82 00 34 */	beq lbl_800939D8
lbl_800939A8:
/* 800939A8 0008F8C8  38 60 00 01 */	li r3, 1
/* 800939AC 0008F8CC  38 80 00 03 */	li r4, 3
/* 800939B0 0008F8D0  38 A0 00 01 */	li r5, 1
/* 800939B4 0008F8D4  48 04 F6 21 */	bl GXSetZMode
/* 800939B8 0008F8D8  80 6D 9F C0 */	lwz r3, gxCache@sda21(r13)
/* 800939BC 0008F8DC  38 80 00 01 */	li r4, 1
/* 800939C0 0008F8E0  38 00 00 03 */	li r0, 3
/* 800939C4 0008F8E4  98 83 00 00 */	stb r4, 0(r3)
/* 800939C8 0008F8E8  80 6D 9F C0 */	lwz r3, gxCache@sda21(r13)
/* 800939CC 0008F8EC  90 03 00 04 */	stw r0, 4(r3)
/* 800939D0 0008F8F0  80 6D 9F C0 */	lwz r3, gxCache@sda21(r13)
/* 800939D4 0008F8F4  98 83 00 08 */	stb r4, 8(r3)
lbl_800939D8:
/* 800939D8 0008F8F8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800939DC 0008F8FC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800939E0 0008F900  83 C1 00 08 */	lwz r30, 8(r1)
/* 800939E4 0008F904  7C 08 03 A6 */	mtlr r0
/* 800939E8 0008F908  38 21 00 10 */	addi r1, r1, 0x10
/* 800939EC 0008F90C  4E 80 00 20 */	blr
lbl_800939F0:
/* 800939F0 0008F910  80 03 00 00 */	lwz r0, 0(r3)
/* 800939F4 0008F914  54 00 06 31 */	rlwinm. r0, r0, 0, 0x18, 0x18
/* 800939F8 0008F918  40 82 00 0C */	bne lbl_80093A04
/* 800939FC 0008F91C  38 60 00 00 */	li r3, 0
/* 80093A00 0008F920  4E 80 00 20 */	blr
lbl_80093A04:
/* 80093A04 0008F924  38 60 00 01 */	li r3, 1
/* 80093A08 0008F928  4E 80 00 20 */	blr
lbl_80093A0C:
/* 80093A0C 0008F92C  38 60 00 01 */	li r3, 1
/* 80093A10 0008F930  4E 80 00 20 */	blr

.section .sdata2

.global l_lbl_802F5780
l_lbl_802F5780:
	# 255.0f
	# ROM: 0x1EF1A0
	.4byte 0x437F0000

.global l_lbl_802F5788
l_lbl_802F5784:
	# 0.021276595f
	# ROM: 0x1EF1A4
	.4byte 0x3CAE4C41

.global l_lbl_802F5788
l_lbl_802F5788:
	# 0.0f
	# ROM: 0x1EF1A8
	.4byte 0

.global l_lbl_802F578C
l_lbl_802F578C:
	# ROM: 0x1EF1AC
	# 1.0f
	.4byte 0x3F800000

.global l_shadow_s32_to_float
l_shadow_s32_to_float:
	# this one will remove
	# ROM: 0x1EF1B0
	# 4.503601774854144E15
	.4byte 0x43300000
	.4byte 0x80000000

.global l_lbl_802F5798
l_lbl_802F5798:
	# ROM: 0x1EF1B8
	# 5.671282f
	.4byte 0x40B57B24

.global l_lbl_802F579C
l_lbl_802F579C:
	# ROM: 0x1EF1BC
	# 0.5f
	.4byte 0x3F000000

.global l_lbl_802F57A0
l_lbl_802F57A0:
	# ROM: 0x1EF1C0
	# -0.875f
	.4byte 0xBF600000

.global l_lbl_802F57A4
l_lbl_802F57A4:
	# ROM: 0x1EF1C4
	# 0.125f
	.4byte 0x3E000000

.global l_lbl_802F57A8
l_lbl_802F57A8:
	# ROM: 0x1EF1C8
	# 0.0
	.4byte 0
	.4byte 0

.global l_lbl_802F57B0
l_lbl_802F57B0:
	# ROM: 0x1EF1D0
	# 4.503599627370496E15
	# another double
	.4byte 0x43300000
	.4byte 0

.global l_shadow_color
l_shadow_color:
	# ROM: 0x1EF1D8
	# "GXColor" for shadow
	.4byte 0

.global l_lbl_802F57BC
l_lbl_802F57BC:
	# ROM: 0x1EF1DC
	# 100.0f
	.4byte 0x42C80000

.global l_lbl_802F57C0
l_lbl_802F57C0:
	# ROM: 0x1EF1E0
	# 0.1f
	.4byte 0x3DCCCCCD

.global l_lbl_802F57C4
l_lbl_802F57C4:
	# ROM: 0x1EF1E4
	# 20000.0f
	.4byte 0x469C4000

.section .rodata

    .balign 8
.global lbl_80171A08
lbl_80171A08:
	# ROM: 0x16EA08
	.4byte 0x3F7D70A4
	.4byte 0x3C341C82
	.4byte 0x001D0000
	.4byte 0x3F29BA5E
	.4byte 0x3B872B02
	.4byte 0x00170000
	.4byte 0x3EF22D0E
	.4byte 0x3B22339C
	.4byte 0x001C0000
	.4byte 0x3EBD70A4
	.4byte 0x3B4D7492
	.4byte 0x001C0000
	.4byte 0x3E9BA5E3
	.4byte 0x3A97635E
	.4byte 0x001C0000
	.4byte 0x3E147AE1
	.4byte 0x3AAD03DA
	.4byte 0x001A0000
	.4byte 0xBE10624E
	.4byte 0x3A5844D0
	.4byte 0x001B0000
	.4byte 0xBE9374BC
	.4byte 0x3AEDE54B
	.4byte 0x001A0000
	.4byte 0xBEB4BC6A
	.4byte 0x3B42A455
	.4byte 0x001A0000
	.4byte 0xBED91687
	.4byte 0x3A97635E
	.4byte 0x001A0000
	.4byte 0xBEFA5E35
	.4byte 0x3A97635E
	.4byte 0x00190000
	.4byte 0xBF200000
	.4byte 0x3B6DE54B
	.4byte 0x00180000
	.4byte 0xBF3A9FBE
	.4byte 0x3BC80C74
	.4byte 0x00170000

.global lbl_80171AA4
lbl_80171AA4:
	# ROM: 0x16EAA4
	.4byte 0
	.4byte 0
	.4byte 0xBF800000

.global lbl_80171AB0
lbl_80171AB0:
	# ROM: 0x16EAB0
	.4byte 0x3F800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0
	.4byte 0
	.4byte 0

.global lbl_80171B10
lbl_80171B10:
	# ROM: 0x16EB10
	.4byte 0x3F800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0
	.4byte 0
	.4byte 0

.section .data

    .balign 8
.global lbl_801C7ED8
lbl_801C7ED8:
	# ROM: 0x1C4ED8
	.4byte 0
	.4byte 0x00000015
	.4byte 0
	.4byte 0
	.4byte 0x00000015
	.4byte 0x00000027
	.4byte 0
	.4byte 0
	.4byte 0x00000027
	.4byte 0x0000003D
	.4byte 0
	.4byte 0
	.4byte 0x0000003D
	.4byte 0x00000052
	.4byte 0
	.4byte 0
	.4byte 0x00000052
	.4byte 0x00000066
	.4byte 0
	.4byte 0
	.4byte 0x00000066
	.4byte 0x0000007B
	.4byte 0
	.4byte 0
	.4byte 0x0000007B
	.4byte 0x0000008A
	.4byte 0
	.4byte 0
	.4byte 0x0000008A
	.4byte 0x000000A0
	.4byte 0
	.4byte 0
	.4byte 0x000000A0
	.4byte 0x000000B0
	.4byte 0
	.4byte 0
	.4byte 0x000000B0
	.4byte 0x000000BB
	.4byte 0
	.4byte 0
	.4byte 0x000000BB
	.4byte 0x000000CD
	.4byte 0
	.4byte 0
	.4byte 0x000000CD
	.4byte 0x000000D5
	.4byte 0
	.4byte 0
	.4byte 0x000000D5
	.4byte 0x000000E1
	.4byte 0
	.4byte 0
	.4byte 0x000000E1
	.4byte 0x000000ED
	.4byte 0
	.4byte 0
	.4byte 0x000000ED
	.4byte 0x000000F6
	.4byte 0
	.4byte 0
	.4byte 0x000000F6
	.4byte 0x00000101
	.4byte 0
	.4byte 0
	.4byte 0x00000101
	.4byte 0x0000010F
	.4byte 0
	.4byte 0
	.4byte 0x0000010F
	.4byte 0x00000122
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x0000000C
	.4byte 0
	.4byte 0
	.4byte 0x0000000C
	.4byte 0x00000036
	.4byte 0
	.4byte 0
	.4byte 0x00000036
	.4byte 0x00000061
	.4byte 0
	.4byte 0
	.4byte 0x00000061
	.4byte 0x00000096
	.4byte 0
	.4byte 0
	.4byte 0x00000096
	.4byte 0x000000A2
	.4byte 0
	.4byte 0
	.4byte 0x000000A2
	.4byte 0x000000B0
	.4byte 0
	.4byte 0
	.4byte 0x000000B0
	.4byte 0x000000D3
	.4byte 0
	.4byte 0
	.4byte 0x000000D3
	.4byte 0x000000E1
	.4byte 0
	.4byte 0
	.4byte 0x000000E1
	.4byte 0x00000111
	.4byte 0
	.4byte 0
	.4byte 0x00000111
	.4byte 0x00000121
	.4byte 0
	.4byte 0
	.4byte 0x00000121
	.4byte 0x0000012C
	.4byte 0
	.4byte 0
	.4byte 0x0000012C
	.4byte 0x0000014D
	.4byte 0
	.4byte 0
	.4byte 0x0000014D
	.4byte 0x00000176
	.4byte 0
	.4byte 0
	.4byte 0x00000176
	.4byte 0x0000019B
	.4byte 0
	.4byte 0
	.4byte 0x0000019B
	.4byte 0x000001B0
	.4byte 0
	.4byte 0
	.4byte 0x000001B0
	.4byte 0x000001D5
	.4byte 0
	.4byte 0
	.4byte 0x000001D5
	.4byte 0x000001FB
	.4byte 0
	.4byte 0
	.4byte 0x000001FB
	.4byte 0x0000020C
glabel string_h_ANATANO_k_MONKI_REBERU
	.asciz "h/ANATANO k/MONKI-REBERU"
	.balign 4
glabel string_k_BONOBO
	.asciz "k/BONOBO"
	.balign 4
glabel string_k_GORIRA
	.asciz "k/GORIRA"
	.balign 4
glabel string_k_CHINNPANNJI_
	.asciz "k/CHINNPANNJI-"
	.balign 4
glabel string_k_ORANNU_TANN
	.asciz "k/ORANNU-TANN"
	.balign 4
glabel string_k_SYA_MANNGIBONN
	.asciz "k/SYA-MANNGIBONN"
	.balign 4
glabel string_k_WAUWAUTENAGAZARU
	.asciz "k/WAUWAUTENAGAZARU"
	.balign 4
glabel string_k_BOUSITENAGAZARU
	.asciz "k/BOUSITENAGAZARU"
	.balign 4
glabel string_k_SIROTETENAGAZARU
	.asciz "k/SIROTETENAGAZARU"
	.balign 4
glabel string_k_GERADAHIHI
	.asciz "k/GERADAHIHI"
	.balign 4
glabel string_k_MANNDORIRU
	.asciz "k/MANNDORIRU"
	.balign 4
glabel string_k_MANNTOHIHI
	.asciz "k/MANNTOHIHI"
	.balign 4
glabel string_k_KIIROHIHI
	.asciz "k/KIIROHIHI"
glabel string_k_BURAXTUKUE_PU
	.asciz "k/BURAXTUKUE-PU"
glabel string_k_NIHONNZARU
	.asciz "k/NIHONNZARU"
	.balign 4
glabel string_k_KANIKUIZARU
	.asciz "k/KANIKUIZARU"
	.balign 4
glabel string_k_SABANNNAMONNKI_
	.asciz "k/SABANNNAMONNKI-"
	.balign 4
glabel string_k_BURAXTUZAGUENON
	.asciz "k/BURAXTUZAGUENON"
	.balign 4
glabel string_k_SISIOZARU
	.asciz "k/SISIOZARU"
glabel string_k_BUTAOZARU
	.asciz "k/BUTAOZARU"
glabel string_k_BENIGAOZARU
	.asciz "k/BENIGAOZARU"
	.balign 4
glabel string_k_BONNNETTOZARU
	.asciz "k/BONNNETTOZARU"
glabel string_k_TARAPOANN
	.asciz "k/TARAPOANN"
glabel string_k_HOHOJIROMANNGABEI
	.asciz "k/HOHOJIROMANNGABEI"
glabel string_k_PATASUZARU
	.asciz "k/PATASUZARU"
	.balign 4
glabel string_k_SIROERIMANNGABEI
	.asciz "k/SIROERIMANNGABEI"
	.balign 4
glabel string_k_TENNGUZARU
	.asciz "k/TENNGUZARU"
	.balign 4
glabel string_k_KINNSIKOU
	.asciz "k/KINNSIKOU"
glabel string_k_SIRUBA_RUTON
	.asciz "k/SIRUBA-RUTON"
	.balign 4
glabel string_k_DOXUGUMONNKI_
	.asciz "k/DOXUGUMONNKI-"
glabel string_k_HANUMANNRANNGU_RU
	.asciz "k/HANUMANNRANNGU-RU"
glabel string_k_DASUKI_RUTONN
	.asciz "k/DASUKI-RUTONN"
glabel string_k_ABISINIAKOROBUSU
	.asciz "k/ABISINIAKOROBUSU"
	.balign 4
glabel string_k_FUSAOMAKIZARU
	.asciz "k/FUSAOMAKIZARU"
glabel string_k_RISUZARU
	.asciz "k/RISUZARU"
	.balign 4
glabel string_k_DASUKI_TEXITEXI
	.asciz "k/DASUKI-TEXITEXI"
	.balign 4
glabel string_k_YOZARU
	.asciz "k/YOZARU"
	.balign 4
glabel string_k_HUNNBORUTOU_RI_MONNKI_
	.asciz "k/HUNNBORUTOU-RI-MONNKI-"
	.balign 4
glabel string_k_KUMOZARU
	.asciz "k/KUMOZARU"
	.balign 4
glabel string_k_AKAHOEZARU
	.asciz "k/AKAHOEZARU"
	.balign 4
glabel string_k_KUROHOEZARU
	.asciz "k/KUROHOEZARU"
	.balign 4
glabel string_k_SIROGAOSAKI
	.asciz "k/SIROGAOSAKI"
	.balign 4
glabel string_k_HAGEUAKARI
	.asciz "k/HAGEUAKARI"
	.balign 4
glabel string_k_GERUDEXIMONNKI_
	.asciz "k/GERUDEXIMONNKI-"
	.balign 4
glabel string_k_RAIONNTAMARINN
	.asciz "k/RAIONNTAMARINN"
	.balign 4
glabel string_k_ENNPERA_TAMARINN
	.asciz "k/ENNPERA-TAMARINN"
	.balign 4
glabel string_k_WATABOUSIPANNSIXE
	.asciz "k/WATABOUSIPANNSIXE"
glabel string_k_PIGUMI_MA_MOSEXTUTO
	.asciz "k/PIGUMI-MA-MOSEXTUTO"
	.balign 4
glabel string_k_NISIMEGANEZARU
	.asciz "k/NISIMEGANEZARU"
	.balign 4
glabel string_k_OOGARAGO
	.asciz "k/OOGARAGO"
	.balign 4
glabel string_k_BUXTUSYUBEIBI_
	.asciz "k/BUXTUSYUBEIBI-"
	.balign 4
glabel string_k_POTTO_
	.asciz "k/POTTO-"
	.balign 4
glabel string_k_SURO_RORISU
	.asciz "k/SURO-RORISU"
	.balign 4
glabel string_k_SURENNDA_RORISU
	.asciz "k/SURENNDA-RORISU"
	.balign 4
glabel string_k_BERO_SIFAKA
	.asciz "k/BERO-SIFAKA"
	.balign 4
glabel string_k_INNDORI
	.asciz "k/INNDORI"
	.balign 4
glabel string_k_ERIMAKIKITUNEZARU
	.asciz "k/ERIMAKIKITUNEZARU"
glabel string_k_WAOKITUNEZARU
	.asciz "k/WAOKITUNEZARU"
glabel string_k_HAIIRONEZUMIKITUNEZARU
	.asciz "k/HAIIRONEZUMIKITUNEZARU"
	.balign 4
	.4byte string_h_ANATANO_k_MONKI_REBERU  ;# ptr
	.4byte string_k_BONOBO  ;# ptr
	.4byte string_k_GORIRA  ;# ptr
	.4byte string_k_CHINNPANNJI_  ;# ptr
	.4byte string_k_ORANNU_TANN  ;# ptr
	.4byte string_k_SYA_MANNGIBONN  ;# ptr
	.4byte string_k_WAUWAUTENAGAZARU  ;# ptr
	.4byte string_k_BOUSITENAGAZARU  ;# ptr
	.4byte string_k_SIROTETENAGAZARU  ;# ptr
	.4byte string_k_GERADAHIHI  ;# ptr
	.4byte string_k_MANNDORIRU  ;# ptr
	.4byte string_k_MANNTOHIHI  ;# ptr
	.4byte string_k_KIIROHIHI  ;# ptr
	.4byte string_k_BURAXTUKUE_PU  ;# ptr
	.4byte string_k_NIHONNZARU  ;# ptr
	.4byte string_k_KANIKUIZARU  ;# ptr
	.4byte string_k_SABANNNAMONNKI_  ;# ptr
	.4byte string_k_BURAXTUZAGUENON  ;# ptr
	.4byte string_k_SISIOZARU  ;# ptr
	.4byte string_k_BUTAOZARU  ;# ptr
	.4byte string_k_BENIGAOZARU  ;# ptr
	.4byte string_k_BONNNETTOZARU  ;# ptr
	.4byte string_k_TARAPOANN  ;# ptr
	.4byte string_k_HOHOJIROMANNGABEI  ;# ptr
	.4byte string_k_PATASUZARU  ;# ptr
	.4byte string_k_SIROERIMANNGABEI  ;# ptr
	.4byte string_k_TENNGUZARU  ;# ptr
	.4byte string_k_KINNSIKOU  ;# ptr
	.4byte string_k_SIRUBA_RUTON  ;# ptr
	.4byte string_k_DOXUGUMONNKI_  ;# ptr
	.4byte string_k_HANUMANNRANNGU_RU  ;# ptr
	.4byte string_k_DASUKI_RUTONN  ;# ptr
	.4byte string_k_ABISINIAKOROBUSU  ;# ptr
	.4byte string_k_FUSAOMAKIZARU  ;# ptr
	.4byte string_k_RISUZARU  ;# ptr
	.4byte string_k_DASUKI_TEXITEXI  ;# ptr
	.4byte string_k_YOZARU  ;# ptr
	.4byte string_k_HUNNBORUTOU_RI_MONNKI_  ;# ptr
	.4byte string_k_KUMOZARU  ;# ptr
	.4byte string_k_AKAHOEZARU  ;# ptr
	.4byte string_k_KUROHOEZARU  ;# ptr
	.4byte string_k_SIROGAOSAKI  ;# ptr
	.4byte string_k_HAGEUAKARI  ;# ptr
	.4byte string_k_GERUDEXIMONNKI_  ;# ptr
	.4byte string_k_RAIONNTAMARINN  ;# ptr
	.4byte string_k_ENNPERA_TAMARINN  ;# ptr
	.4byte string_k_WATABOUSIPANNSIXE  ;# ptr
	.4byte string_k_PIGUMI_MA_MOSEXTUTO  ;# ptr
	.4byte string_k_NISIMEGANEZARU  ;# ptr
	.4byte string_k_OOGARAGO  ;# ptr
	.4byte string_k_BUXTUSYUBEIBI_  ;# ptr
	.4byte string_k_POTTO_  ;# ptr
	.4byte string_k_SURO_RORISU  ;# ptr
	.4byte string_k_SURENNDA_RORISU  ;# ptr
	.4byte string_k_AIAI  ;# ptr
	.4byte string_k_BERO_SIFAKA  ;# ptr
	.4byte string_k_ABAHI  ;# ptr
	.4byte string_k_INNDORI  ;# ptr
	.4byte string_k_ERIMAKIKITUNEZARU  ;# ptr
	.4byte string_k_WAOKITUNEZARU  ;# ptr
	.4byte string_k_HAIIRONEZUMIKITUNEZARU  ;# ptr
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0
	.4byte 0x3F000000
	.4byte 0
	.4byte 0x43800000
	.4byte 0x48495341
	.4byte 0x5348492B
	.4byte 0x454E444F
	.4byte 0x54455453
	.4byte 0x5559412B
	.4byte 0x4B414B55
	.4byte 0x4B4F5441
	.4byte 0x2B4D4154
	.4byte 0x53554D4F
	.4byte 0x544F594F
	.4byte 0x5348494E
	.4byte 0x4F52492B
	.4byte 0x53555A55
	.4byte 0x4B495445
	.4byte 0x5453552B
	.4byte 0x594F5348
	.4byte 0x494D4954
	.4byte 0x53554549
	.4byte 0x4A492B54
	.4byte 0x414B414B
	.4byte 0x49594F55
	.4byte 0x49434849
	.4byte 0x2B495348
	.4byte 0x494B4157
	.4byte 0x414E4F52
	.4byte 0x494F2B48
	.4byte 0x41474159
	.4byte 0x4153554D
	.4byte 0x4153412B
	.4byte 0x4D415453
	.4byte 0x554D4F52
	.4byte 0x494B4F4A
	.4byte 0x492B544F
	.4byte 0x4B494544
	.4byte 0x414D4945
	.4byte 0x2B4B4157
	.4byte 0x414E4953
	.4byte 0x48494A55
	.4byte 0x4E2B544F
	.4byte 0x4B554841
	.4byte 0x52414A55
	.4byte 0x4E494348
	.4byte 0x492B5941
	.4byte 0x4D414441
	.4byte 0x44414953
	.4byte 0x554B452B
	.4byte 0x5341544F
	.4byte 0x4B554D49
	.4byte 0x4B4F2B53
	.4byte 0x414B5552
	.4byte 0x41495955
	.4byte 0x4B494F2B
	.4byte 0x4F44414B
	.4byte 0x415A5548
	.4byte 0x49524F2B
	.4byte 0x495A414B
	.4byte 0x494D4943
	.4byte 0x48494849
	.4byte 0x524F2B53
	.4byte 0x41544F4D
	.4byte 0x494B412B
	.4byte 0x5341544F
	.4byte 0x4D415249
	.4byte 0x2B534153
	.4byte 0x414B494B
	.4byte 0x454E5441
	.4byte 0x524F552B
	.4byte 0x4E49494E
	.4byte 0x41434849
	.4byte 0x47414B55
	.4byte 0x2B46554B
	.4byte 0x55484152
	.4byte 0x414D494B
	.4byte 0x412B4B4F
	.4byte 0x4A494D41
	.4byte 0x59554B49
	.4byte 0x4E4F4255
	.4byte 0x2B415249
	.4byte 0x4B415741
	.4byte 0x4849524F
	.4byte 0x59554B49
	.4byte 0x2B53414B
	.4byte 0x414D4F54
	.4byte 0x4F484944
	.4byte 0x454E4F52
	.4byte 0x492B5348
	.4byte 0x4F4A4948
	.4byte 0x41525559
	.4byte 0x4F534849
	.4byte 0x2B544F4D
	.4byte 0x49544153
	.4byte 0x414B4145
	.4byte 0x2B4F5355
	.4byte 0x4D494B41
	.4byte 0x4F52552B
	.4byte 0x4D4F524F
	.4byte 0x54414B4F
	.4byte 0x4E414D49
	.4byte 0x2B594F53
	.4byte 0x48494441
	.4byte 0x52494F2B
	.4byte 0x4E415453
	.4byte 0x554B494D
	.4byte 0x41534145
	.4byte 0x2B4F544F
	.4byte 0x5348494B
	.4byte 0x6F6A692B
	.4byte 0x75656461
	.4byte 0x444F4C45
	.4byte 0x2B464F4F
	.4byte 0x442B434F
	.4byte 0x4D50414E
	.4byte 0x592C494E
	.4byte 0x432E444F
	.4byte 0x4C452B4A
	.4byte 0x4150414E
	.4byte 0x2C4C5444
	.4byte 0x2E484149
	.4byte 0x4B594F53
	.4byte 0x5455524D
	.4byte 0x2B434F2E
	.4byte 0x2C4C5444
	.4byte 0x2E542F53
	.4byte 0x2B4D5553
	.4byte 0x49432B43
	.4byte 0x4F2E2C4C
	.4byte 0x54442E54
	.4byte 0x4F534849
	.4byte 0x4849524F
	.4byte 0x2B4E4147
	.4byte 0x4F534849
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40D00000
	.4byte 0x40D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0F00000
	.4byte 0xC0F00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40D00000
	.4byte 0x40D00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0F00000
	.4byte 0xC0F00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40D00000
	.4byte 0x40D00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0A00000
	.4byte 0xC0A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A00000
	.4byte 0x40A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0F00000
	.4byte 0xC0F00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40D00000
	.4byte 0x40D00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1080000
	.4byte 0xC1080000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0F00000
	.4byte 0xC0F00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40D00000
	.4byte 0x40D00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0C00000
	.4byte 0xC0C00000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0A00000
	.4byte 0xC0A00000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A00000
	.4byte 0x40A00000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40D00000
	.4byte 0x40D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40D00000
	.4byte 0x40D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40D00000
	.4byte 0x40D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40D00000
	.4byte 0x40D00000
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0A00000
	.4byte 0xC0A00000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A00000
	.4byte 0x40A00000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40D00000
	.4byte 0x40D00000
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0F00000
	.4byte 0xC0F00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40D00000
	.4byte 0x40D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0A00000
	.4byte 0xC0A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A00000
	.4byte 0x40A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0F00000
	.4byte 0xC0F00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40D00000
	.4byte 0x40D00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1000000
	.4byte 0xC1000000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0E00000
	.4byte 0xC0E00000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0C00000
	.4byte 0xC0C00000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0A00000
	.4byte 0xC0A00000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A00000
	.4byte 0x40A00000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41000000
	.4byte 0x41000000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40D00000
	.4byte 0x40D00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0F00000
	.4byte 0xC0F00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40D00000
	.4byte 0x40D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0A00000
	.4byte 0xC0A00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A00000
	.4byte 0x40A00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x42960000
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40D00000
	.4byte 0x40D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0A00000
	.4byte 0xC0A00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A00000
	.4byte 0x40A00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1280000
	.4byte 0xC1280000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1180000
	.4byte 0xC1180000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1080000
	.4byte 0xC1080000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0F00000
	.4byte 0xC0F00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40E00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C9999A
	.4byte 0x40C9999A
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40E9999A
	.4byte 0x40E9999A
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x4104CCCD
	.4byte 0x4104CCCD
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x4114CCCD
	.4byte 0x4114CCCD
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x4124CCCD
	.4byte 0x4124CCCD
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0E00000
	.4byte 0xC0E00000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0C00000
	.4byte 0xC0C00000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0A00000
	.4byte 0xC0A00000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A00000
	.4byte 0x40A00000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FA66666
	.4byte 0x3FA66666
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40066666
	.4byte 0x40066666
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40466666
	.4byte 0x40466666
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40833333
	.4byte 0x40833333
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A33333
	.4byte 0x40A33333
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C33333
	.4byte 0x40C33333
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC104CCCD
	.4byte 0xC104CCCD
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0E9999A
	.4byte 0xC0E9999A
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40533333
	.4byte 0x40533333
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A00000
	.4byte 0x40A00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41000000
	.4byte 0x41000000
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1000000
	.4byte 0xC1000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0E00000
	.4byte 0xC0E00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0C00000
	.4byte 0xC0C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0A00000
	.4byte 0xC0A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A00000
	.4byte 0x40A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41000000
	.4byte 0x41000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
glabel string_game_program_directorsystem_programmersParty_game_programmersMini_game_programmers2D_system_programmerStage_design_directorStage_DesignersMotion_design_directorMotion_Designers2d_designerCharacter_designerPlannersSound_DesignMonkey_VoicePublicityCooperationSpecial_ThanksProducer___Director_2
	.asciz "game+program+directorsystem+programmersParty+game+programmersMini+game+programmers2D+system+programmerStage+design+directorStage+DesignersMotion+design+directorMotion+Designers2d+designerCharacter+designerPlannersSound+DesignMonkey+VoicePublicityCooperationSpecial+ThanksProducer+&+Director"
	.balign 4
	.4byte 0xC1200000
	.4byte 0xC1200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1100000
	.4byte 0xC1100000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1000000
	.4byte 0xC1000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0E00000
	.4byte 0xC0E00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0C00000
	.4byte 0xC0C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0A00000
	.4byte 0xC0A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A00000
	.4byte 0x40A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41000000
	.4byte 0x41000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41100000
	.4byte 0x41100000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41200000
	.4byte 0x41200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1100000
	.4byte 0xC1100000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1000000
	.4byte 0xC1000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0E00000
	.4byte 0xC0E00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0C00000
	.4byte 0xC0C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0A00000
	.4byte 0xC0A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A00000
	.4byte 0x40A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41000000
	.4byte 0x41000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1280000
	.4byte 0xC1280000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1180000
	.4byte 0xC1180000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1080000
	.4byte 0xC1080000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0F00000
	.4byte 0xC0F00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40D00000
	.4byte 0x40D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41180000
	.4byte 0x41180000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41280000
	.4byte 0x41280000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1200000
	.4byte 0xC1200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1100000
	.4byte 0xC1100000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1000000
	.4byte 0xC1000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0E00000
	.4byte 0xC0E00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0C00000
	.4byte 0xC0C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0A00000
	.4byte 0xC0A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A00000
	.4byte 0x40A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41000000
	.4byte 0x41000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41100000
	.4byte 0x41100000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41200000
	.4byte 0x41200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1200000
	.4byte 0xC1200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1100000
	.4byte 0xC1100000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1000000
	.4byte 0xC1000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0E00000
	.4byte 0xC0E00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0C00000
	.4byte 0xC0C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0A00000
	.4byte 0xC0A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A00000
	.4byte 0x40A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41000000
	.4byte 0x41000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41100000
	.4byte 0x41100000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1200000
	.4byte 0xC1200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1100000
	.4byte 0xC1100000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1000000
	.4byte 0xC1000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0E00000
	.4byte 0xC0E00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0C00000
	.4byte 0xC0C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0A00000
	.4byte 0xC0A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A00000
	.4byte 0x40A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41000000
	.4byte 0x41000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41100000
	.4byte 0x41100000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41200000
	.4byte 0x41200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0E00000
	.4byte 0xC0E00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0C00000
	.4byte 0xC0C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0A00000
	.4byte 0xC0A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A00000
	.4byte 0x40A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1300000
	.4byte 0xC1300000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1200000
	.4byte 0xC1200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1100000
	.4byte 0xC1100000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1000000
	.4byte 0xC1000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0E00000
	.4byte 0xC0E00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0C00000
	.4byte 0xC0C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0A00000
	.4byte 0xC0A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A00000
	.4byte 0x40A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41000000
	.4byte 0x41000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41100000
	.4byte 0x41100000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41200000
	.4byte 0x41200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0F00000
	.4byte 0xC0F00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40D00000
	.4byte 0x40D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0A00000
	.4byte 0xC0A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A00000
	.4byte 0x40A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1080000
	.4byte 0xC1080000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0F00000
	.4byte 0xC0F00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40D00000
	.4byte 0x40D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40F00000
	.4byte 0x40F00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41080000
	.4byte 0x41080000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0A00000
	.4byte 0xC0A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A00000
	.4byte 0x40A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0D00000
	.4byte 0xC0D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0B00000
	.4byte 0xC0B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0900000
	.4byte 0xC0900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0600000
	.4byte 0xC0600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0200000
	.4byte 0xC0200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBFC00000
	.4byte 0xBFC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF000000
	.4byte 0xBF000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F000000
	.4byte 0x3F000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3FC00000
	.4byte 0x3FC00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40200000
	.4byte 0x40200000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40600000
	.4byte 0x40600000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40900000
	.4byte 0x40900000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40B00000
	.4byte 0x40B00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40D00000
	.4byte 0x40D00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1100000
	.4byte 0xC1100000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC1000000
	.4byte 0xC1000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0E00000
	.4byte 0xC0E00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0C00000
	.4byte 0xC0C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0A00000
	.4byte 0xC0A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0800000
	.4byte 0xC0800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0400000
	.4byte 0xC0400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xC0000000
	.4byte 0xC0000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40400000
	.4byte 0x40400000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40800000
	.4byte 0x40800000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40A00000
	.4byte 0x40A00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40E00000
	.4byte 0x40E00000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41000000
	.4byte 0x41000000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x41100000
	.4byte 0x41100000
	.4byte 0x40C00000
	.4byte 0x40C00000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x43800000
	.4byte 0x43800000
	.4byte 0
	.4byte 0
	.4byte 0

.global lbl_801D3B08
lbl_801D3B08:
	# ROM: 0x1D0B08
glabel string_sub_mode__error__d_in_Mini
	.asciz "sub_mode: error %d in Mini"
	.balign 4
glabel string_mkbe_rel_mini_fight_rel
	.asciz "mkbe.rel_mini_fight.rel"
glabel string_mkbe_rel_mini_bowling_rel
	.asciz "mkbe.rel_mini_bowling.rel"
	.balign 4
glabel string_mkbe_rel_mini_race_rel
	.asciz "mkbe.rel_mini_race.rel"
	.balign 4
glabel string_mkbe_rel_mini_pilot_rel
	.asciz "mkbe.rel_mini_pilot.rel"
glabel string_mkbe_rel_mini_billiards_rel
	.asciz "mkbe.rel_mini_billiards.rel"
glabel string_mkbe_rel_mini_golf_rel
	.asciz "mkbe.rel_mini_golf.rel"
	.balign 4
glabel string_mkbe_rel_sample_rel
	.asciz "mkbe.rel_sample.rel"

.global lbl_801D3BD0
lbl_801D3BD0:
	# ROM: 0x1D0BD0
	.4byte lbl_802F1310  ;# ptr
	.4byte lbl_802F1310  ;# ptr
	.4byte lbl_802F1310  ;# ptr
	.4byte lbl_802F1310  ;# ptr
	.4byte lbl_802F1310  ;# ptr
	.4byte string_mkbe_rel_mini_fight_rel  ;# ptr
	.4byte lbl_802F1310  ;# ptr
	.4byte string_mkbe_rel_mini_bowling_rel  ;# ptr
	.4byte lbl_802F1310  ;# ptr
	.4byte string_mkbe_rel_mini_race_rel  ;# ptr
	.4byte lbl_802F1310  ;# ptr
	.4byte string_mkbe_rel_mini_pilot_rel  ;# ptr
	.4byte lbl_802F1310  ;# ptr
	.4byte string_mkbe_rel_mini_billiards_rel  ;# ptr
	.4byte lbl_802F1310  ;# ptr
	.4byte string_mkbe_rel_mini_golf_rel  ;# ptr
	.4byte lbl_802F1310  ;# ptr
	.4byte string_mkbe_rel_sample_rel  ;# ptr
	.4byte lbl_802F1310  ;# ptr
	.4byte lbl_802F1310  ;# ptr
	.4byte lbl_802F1310  ;# ptr
	.4byte lbl_802F1310  ;# ptr
	.4byte lbl_802F1310  ;# ptr
glabel string_MONKEY_RACE
	.asciz "MONKEY RACE"
glabel string_BILLIARDS
	.asciz "BILLIARDS"
	.balign 4
glabel string_RELOCATION_SAMPLE
	.asciz "RELOCATION SAMPLE"
	.balign 4
	.4byte string_TEST0  ;# ptr
	.4byte 0x0092FF00
	.4byte string_MONKEY_RACE  ;# ptr
	.4byte 0x00980300
	.4byte string_BOWLING  ;# ptr
	.4byte 0x00960700
	.4byte string_GOLF  ;# ptr
	.4byte 0x009E0800
	.4byte string_BILLIARDS  ;# ptr
	.4byte 0x009C0600
	.4byte string_FIGHT  ;# ptr
	.4byte 0x00940400
	.4byte string_PILOT  ;# ptr
	.4byte 0x009A0500
	.4byte string_RELOCATION_SAMPLE  ;# ptr
	.4byte 0x00A0FF00
	.4byte string_COMMEND  ;# ptr
	.4byte 0x00A2FF00
	.4byte string_RANKING_2  ;# ptr
	.4byte 0x00A4FF00
	.4byte string_ENDING  ;# ptr
	.4byte 0x00A6FF00
glabel string_MINI_GAME
	.asciz "MINI GAME"
	.balign 4
glabel string_ENDING_VIEWER_n
	.asciz "ENDING VIEWER\n"
	.balign 4
glabel string_COURSE__d__n
	.asciz "COURSE[%d]\n"
glabel string_PLAYER__d__n
	.asciz "PLAYER[%d]\n"
	.4byte 0

.global lbl_801D3CE8
lbl_801D3CE8:
	# ROM: 0x1D0CE8
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte func_8009557C  ;# ptr
	.4byte func_800955FC  ;# ptr
	.4byte func_8009562C  ;# ptr
	.4byte func_80095630  ;# ptr
	.4byte func_80095C6C  ;# ptr
	.4byte func_80095D3C  ;# ptr
	.4byte func_80095D90  ;# ptr
	.4byte func_80095D94  ;# ptr
	.4byte func_80096134  ;# ptr
	.4byte func_80096228  ;# ptr
	.4byte func_80096258  ;# ptr
	.4byte func_800963AC  ;# ptr
	.4byte func_80096A30  ;# ptr
	.4byte func_80096B3C  ;# ptr
	.4byte func_80096BA8  ;# ptr
	.4byte func_80096BE0  ;# ptr
	.4byte func_800973A0  ;# ptr
	.4byte func_80097664  ;# ptr
	.4byte func_800976B8  ;# ptr
	.4byte func_800976BC  ;# ptr
	.4byte func_8009826C  ;# ptr
	.4byte func_800983A0  ;# ptr
	.4byte func_8009840C  ;# ptr
	.4byte func_80098410  ;# ptr

.global lbl_801D3D58
lbl_801D3D58:
	# ROM: 0x1D0D58
	.4byte lbl_80097304  ;# ptr
	.4byte lbl_80097390  ;# ptr
	.4byte lbl_80097304  ;# ptr
	.4byte lbl_80097390  ;# ptr
	.4byte lbl_80097304  ;# ptr
	.4byte lbl_80097390  ;# ptr
	.4byte lbl_80097390  ;# ptr
	.4byte lbl_80097304  ;# ptr

.global lbl_801D3D78
lbl_801D3D78:
	# ROM: 0x1D0D78
	.4byte func_800993A8  ;# ptr
	.4byte func_800994A8  ;# ptr
	.4byte func_80099518  ;# ptr
	.4byte func_80099968  ;# ptr

.section .sdata

    .balign 8
glabel string_k_AIAI
	.asciz "k/AIAI"
	.balign 4
glabel string_k_ABAHI
	.asciz "k/ABAHI"
glabel lbl_802F1310
	.4byte 0
glabel string_TEST0
	.asciz "TEST0"
	.balign 4
glabel string_BOWLING
	.asciz "BOWLING"
glabel string_GOLF
	.asciz "GOLF"
	.balign 4
glabel string_FIGHT
	.asciz "FIGHT"
	.balign 4
glabel string_PILOT
	.asciz "PILOT"
	.balign 4
glabel string_COMMEND
	.asciz "COMMEND"
glabel string_RANKING_2
	.asciz "RANKING"
glabel string_ENDING
	.asciz "ENDING"
	.balign 4

.global lbl_802F1354
lbl_802F1354:
	# ROM: 0x1EBA94
	.4byte 0x1C200000

.global lbl_802F1358
lbl_802F1358:
	# ROM: 0x1EBA98
	.4byte 0x25730A00
	.4byte 0

.section .bss

.if 0
.global lbl_802B8FA0
lbl_802B8FA0:
	.skip 0x150
.endif

# these seems to using on mini.s
.global lbl_802B90F0
lbl_802B90F0:
	.skip 0x270
.global lbl_802B9360
lbl_802B9360:
	.skip 0x10
.global lbl_802B9370
lbl_802B9370:
	.skip 0x20
.global lbl_802B9390
lbl_802B9390:
	.skip 0xE00

.section .sbss

.if 0
    .balign 8
.global l_lbl_802F2150
l_lbl_802F2150:
	.skip 0x4
.global l_ptr_shadow
l_ptr_shadow:
	.skip 0x4
.endif
