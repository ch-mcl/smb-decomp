#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "shadow.h"
#include "bitmap.h"
#include "sprite.h"
#include "input.h"


struct Shadow {
    /* 0x000 */ GXTexObj texObjs[8];
    /* 0x020 */ u32 imagePtrs[8];
    /* 0x040 */ u32 unk040[56];
    /* 0x120 */ float unk120[12];
};

struct Shadow lbl_802B8FA0;

FORCE_BSS_ORDER(lbl_802B8FA0)

u32 lbl_802F2150;
void *lbl_802F2154;


u8 lbl_802B57A0[0x3800];
void func_80092498(void)
{
    func_800924CC();
    lbl_802F2150 = 0;
    lbl_802F2154 = lbl_802B57A0;
}
