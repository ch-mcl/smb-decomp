#ifndef _SRC_SHADOW_H_
#define _SRC_SHADOW_H_

#include <dolphin/types.h>

struct Struct80092B98
{
    /* 0x00 */Vec unk0;
    /* 0x0C */ float unkC;
    /* 0x10 */ Vec unk10;
    /* 0x1C */ float unk1C;
    /* 0x20 */ Vec unk20;
    /* 0x2C */ s16 unk2C;
    /* 0x2E */ u16 unk2E;
    /* 0x30 */ float unk30;
    /* 0x34 */ float unk34;
    /* 0x38 */ GXColor unk38;
    /* 0x40 */ void *unk3C;
};  // size = 0x40

void func_80092498(void);
void func_800924CC(void);
void shadowerase_main(void);
void u_init_shadow_stuff_probably(struct Struct80092B98 *);
int func_80092D34(void);
void u_draw_ball_shadow(void);
void func_80092F90(void *);
void func_800934B0();
void func_80093920();

#endif
