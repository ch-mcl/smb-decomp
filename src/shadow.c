#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "shadow.h"
#include "bitmap.h"
#include "sprite.h"
#include "input.h"


struct Shadow {
    /* 0x000 */ struct Struct80092B98 unk000;
    /* 0x040 */ float *unk040;
    /* 0x044 */ Vec unk044;
    /* 0x050 */ float unk050;
    /* 0x054 */ float unk054;
    /* 0x058 */ float unk058;
    /* 0x05C */ u8 unk0x5C[0x68 - 0x5C];
    /* 0x068 */ Vec unk068;
    /* 0x074 */ u8 unk[0x3800 - 0x74];
};

struct Struct802B8FA0 {
    /* 0x000 */ GXTexObj texObjs[4];
    /* 0x020 */ u32 imagePtrs[8];
    /* 0x040 */ u32 unk040[32];
    /* 0x120 */ float unk120[12];
};

struct Shadow shadow;
struct Struct802B8FA0 lbl_802B8FA0;

struct Shadow *l_ptr_shadow;
u32 l_lbl_802F2150;

void func_80092498(void)
{
    func_800924CC();
    l_lbl_802F2150 = 0;
    l_ptr_shadow = &shadow;
}

// void func_800924CC(void) {

// }

// void shadowerase_main(void) {
//     l_ptr_shadow = &shadow;
//     l_lbl_802F2150 = 0;
// }
