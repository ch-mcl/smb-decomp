#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "shadow.h"
#include "gxcache.h"

struct Shadow {
    /* 0x000 */ struct Struct80092B98 unk000;
    /* 0x040 */ float *unk040;
    /* 0x044 */ Vec unk044;
    /* 0x050 */ float distance;
    /* 0x054 */ float div_distance;
    /* 0x058 */ float distance2;
    /* 0x05C */ u8 unk0x5C[0x68 - 0x5C]; // 0xC Vec?
    /* 0x068 */ Vec position;
    /* 0x074 */ u8 unk[0xB0 - 0x74];
    /* 0x0B0 */ Mtx unk0b0;
    /* 0x0E0 */ struct Shadow *child;
    /* 0x0E4 */ u8 unk0E4[0x3800 - 0xE4];
};

struct Struct802B8FA0 {
    /* 0x000 */ GXTexObj texObjs[4];
    /* 0x020 */ u32 imagePtrs[8];
    /* 0x040 */ u32 unk040[32];
    /* 0x120 */ Mtx mtx;
};

struct Shadow shadow;
struct Struct802B8FA0 lbl_802B8FA0;

struct Shadow *l_ptr_shadow;
u32 l_shadowCount;

void func_80092498(void)
{
    func_800924CC();
    l_shadowCount = 0;
    l_ptr_shadow = &shadow;
}

#ifdef NONMATCHING
void func_800924CC(void) {
    return;
}
#else
const float l_lbl_802F5780 = 255.0;
const float l_lbl_802F5784 = 0.021276595f;
const float l_lbl_802F5788 = 0.0f;
const float l_lbl_802F578C = 1.0f;
const double l_shadow_s32_to_float = 4.503601774854144E15;
asm void func_800924CC(void)
{
    nofralloc
#include "../asm/nonmatchings/func_800924CC.s"
}
#pragma peephole on
#endif


void shadowerase_main(void)
{
    l_shadowCount = 0;
    l_ptr_shadow = &shadow;
}


// void u_init_shadow_stuff_probably(struct Struct80092B98 *){

// }


// int func_80092D34(void){

// }


// void u_draw_ball_shadow(void){
    
// }


// void func_80092F90(void *){

// }


// void func_800934B0(){

// }


// void FUN_80093920(void)
// {
//     int i;
//     GXTevStageID stage;
    
//     stage = GX_TEVSTAGE0;
//     i = l_shadowCount > 4 ? 4 : l_shadowCount;
//     for (; 0 < i; i--) {
//         GXSetTevSwapMode_cached(stage, GX_TEV_SWAP0, GX_TEV_SWAP0);
//         GXSetTevSwapMode_cached(stage + GX_TEVSTAGE1, GX_TEV_SWAP0, GX_TEV_SWAP0);
//         stage = stage + GX_TEVSTAGE2;
//     }

//     if (
//         gxCache->updateEnable != TRUE
//         || gxCache->compareFunc != GX_LEQUAL
//         || gxCache->compareEnable != TRUE
//     ) {
//         GXSetZMode(TRUE, GX_LEQUAL, TRUE);
//         gxCache->compareEnable = TRUE;
//         gxCache->compareFunc = GX_LEQUAL;
//         gxCache->updateEnable = TRUE;
//     }
//     return;
// }


// void func_800939F0