#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "shadow.h"
#include "bitmap.h"
#include "sprite.h"
#include "input.h"


struct Shadow {
    /* 0x000 */u8 unk000[0x68];
    /* 0x068 */ Vec unk064;
    /* 0x074 */ u8 unk[0x3800 - 0x74];
};

struct Struct802B8FA0 {
    /* 0x000 */ GXTexObj texObjs[4];
    /* 0x020 */ u32 imagePtrs[8];
    /* 0x040 */ u32 unk040[32];
    /* 0x120 */ float unk120[12];
};

struct Shadow lbl_802B57A0;
struct Struct802B8FA0 lbl_802B8FA0;

struct Shadow *lbl_802F2154;
u32 lbl_802F2150;

void func_80092498(void)
{
    func_800924CC();
    lbl_802F2150 = 0;
    lbl_802F2154 = &lbl_802B57A0;
}
