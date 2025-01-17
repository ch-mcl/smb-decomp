/**
 * adv.c - Implements the "advertise" mode, which includes the attract screen
 * sequence and title screen
 */
#include <math.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "adv.h"
#include "background.h"
#include "bitmap.h"
#include "ball.h"
#include "camera.h"
#include "event.h"
#include "hud.h"
#include "info.h"
#include "input.h"
#include "load.h"
#include "mathutil.h"
#include "minimap.h"
#include "mode.h"
#include "mot_ape.h"
#include "pool.h"
#include "ranking_screen.h"
#include "recplay.h"
#include "rend_efc.h"
#include "sound.h"
#include "sprite.h"
#include "stage.h"
#include "textbox.h"
#include "world.h"
#include "stcoli.h"
#include "light.h"

u32 introBackdropColor;
u32 advSubmode;
s32 lbl_802F1BC4;
s16 lbl_802F1BBC[4];
s16 lbl_802F1BB4[4];
s32 lbl_802F1BB0;
u32 lbl_802F1BAC;
s32 lbl_802F1BA8;

static void func_8000FEC8(int);
static void func_80011D90(void);

void mode_adv_func(void)
{
    if (!(gameSubmode > SMD_ADV_TOP && gameSubmode < SMD_ADV_BOTTOM))
    {
        u_debug_set_cursor_pos(10, 10);
        u_debug_printf("sub_mode: error %d in Adv", gameSubmode);
        return;
    }

    if (!(gameSubmode == SMD_ADV_START_INIT || gameSubmode == SMD_ADV_START_MAIN))
        advSubmode = gameSubmode;

    if (!(gamePauseStatus & 0xA)
     && lbl_802F1BA8 > 0 && --lbl_802F1BA8 == 0)
        gameSubmodeRequest = SMD_ADV_TITLE_INIT;

    gameSubmodeFuncs[gameSubmode]();
}

/**
 * Warning Submode - Displays memory card messages immediately upon bootup
 */

void submode_adv_warning_init_func(void)
{
    introBackdropColor = 0;
    func_8002FFEC();
    func_8009F49C(2);
    event_start(EVENT_SPRITE);
    event_start(EVENT_MEMCARD);
    gameSubmodeRequest = SMD_ADV_WARNING_MAIN;
}

void submode_adv_warning_main_func(void)
{
    if (eventInfo[EVENT_MEMCARD].state != EV_STATE_RUNNING)
        gameSubmodeRequest = SMD_ADV_LOGO_INIT;
}

/**
 * Rating Submode - Not used
 */

void submode_adv_rating_init_func(void) {}

void submode_adv_rating_main_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    if (--modeCtrl.submodeTimer <= 0)
        gameSubmodeRequest = (lbl_802F1B78 != 0) ? SMD_ADV_LOGO_INIT : SMD_ADV_INFO_INIT;
}

/**
 * Logo Submode - Shows a rolling 3D Amusement Vision logo
 */

static Vec prevLogoPos;  // position of the logo on previous frame
struct AdvLogoInfo advLogoInfo;

void submode_adv_logo_init_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    func_80011D90();
    introBackdropColor = RGBA(255, 255, 255, 0);
    modeCtrl.submodeTimer = 840;
    modeCtrl.courseFlags = 0;
    advLogoInfo.timer = modeCtrl.submodeTimer;
    advLogoInfo.rollTimer = 0;
    prevLogoPos.x = 0.0f;
    prevLogoPos.y = 0.0f;
    prevLogoPos.z = 0.0f;
    func_8002FFEC();
    light_init(0);
    playerCharacterSelection[0] = 0;
    event_finish_all();
    free_all_bitmap_groups_except_com();
    event_start(EVENT_CAMERA);
    event_start(EVENT_SPRITE);
    event_start(EVENT_SOUND);
    camera_set_state(27);
    unload_stage();
    call_bitmap_load_group(BMP_ADV);
    u_logo_plus_sprite_something();
    u_play_sound_0(0x21);
    preload_stage_files(ST_001_PLAIN);
    light_init(0);
    start_screen_fade(FADE_IN|FADE_ABOVE_SPRITES, RGBA(0, 0, 0, 0), 30);
    gameSubmodeRequest = SMD_ADV_LOGO_MAIN;
}

void update_av_logo_pos_and_sound(void)
{
    if (advLogoInfo.rollTimer <= 120)
        advLogoInfo.pos.x = 0.0f;
    else if (advLogoInfo.rollTimer <= 240)
        advLogoInfo.pos.x = 4.5f * (1.0 - __fabs(mathutil_cos((advLogoInfo.rollTimer - 120) * 273)));

    if (advLogoInfo.rollTimer <= 180)
        advLogoInfo.pos.y = (180 - advLogoInfo.rollTimer) * -0.004;

    if (advLogoInfo.rollTimer <= 180)
        advLogoInfo.pos.z = (1.0 - mathutil_sin(advLogoInfo.rollTimer * 91)) * 280.0;
    else if (advLogoInfo.rollTimer > 300 && advLogoInfo.rollTimer <= 420)
        advLogoInfo.pos.z = (advLogoInfo.rollTimer - 300) * 1.35;

    if (advLogoInfo.rollTimer <= 120)
        advLogoInfo.zrot = 0;
    else if (advLogoInfo.rollTimer <= 180)
        advLogoInfo.zrot = (advLogoInfo.rollTimer - 120) * -546;
    else if (advLogoInfo.rollTimer <= 240)
        advLogoInfo.zrot = (240 - advLogoInfo.rollTimer) * -546;

    if (advLogoInfo.rollTimer <= 180)
        advLogoInfo.xrot = advLogoInfo.rollTimer * -546;
    else if (advLogoInfo.rollTimer <= 300)
        advLogoInfo.xrot = 0;
    else if (advLogoInfo.rollTimer <= 420)
        advLogoInfo.xrot = (advLogoInfo.rollTimer - 300) * 546;

    if (advLogoInfo.rollTimer > 0)
    {
        s8 r4, r5;
        u8 r29, r28;
        float speed = mathutil_sqrt(
            (advLogoInfo.pos.x - prevLogoPos.x) * (advLogoInfo.pos.x - prevLogoPos.x)
          + (advLogoInfo.pos.z - prevLogoPos.z) * (advLogoInfo.pos.z - prevLogoPos.z));

        speed *= 10.0;
        r4 = MIN(speed * 1.5, 127.0);
        r5 = MIN(speed * 15.0, 80.0) * 0.85000002384185791;
        r29 = CLAMP(advLogoInfo.pos.x * 16.0, -64.0, 63.0);
        r28 = CLAMP((280.0 - advLogoInfo.pos.z) * 0.1, -64.0, 63.0);
        lbl_802F1DF8 = 0;
        func_8002CA5C(0, r4, r5);
        lbl_802F1DF8 = 0;
        SoundPan(0x51, r29, r28);
        lbl_802F1DF8 = 0;
        SoundPan(0x52, r29, r28);
        lbl_802F1DF8 = 0;
        SoundPan(0x53, r29, r28);
    }
    prevLogoPos = advLogoInfo.pos;
}

static void update_av_logo(void)
{
    if (advLogoInfo.timer == 0)
        return;
    if (advLogoInfo.timer <= 660)
        advLogoInfo.rollTimer++;
    update_av_logo_pos_and_sound();
    if (advLogoInfo.timer == 460)
        u_play_sound_0(0x3B1F4);
    if (advLogoInfo.timer == 240)
        func_8002BFCC(0x51F2, 0x51F3);

    // Fade background to yellow after frame 210
    if (advLogoInfo.timer < 240 && advLogoInfo.timer >= 210)
    {
        int t = 240 - advLogoInfo.timer;
        u32 color;

        if (t >= 30)
            color = RGBA(255, 192, 0, 0);
        else
            color = RGBA(
                255,
                (int)(255 - (255 - 192) / 30.0 * t),
                (int)(255 - (255 - 0) / 30.0 * t),
                0);
        introBackdropColor = color;
    }
    if (advLogoInfo.timer > 0)
        advLogoInfo.timer--;
}

void submode_adv_logo_main_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    if ((dipSwitches & DIP_DEBUG)
     && modeCtrl.submodeTimer > 30
     && (controllerInfo[0].unk0[0].button & PAD_BUTTON_X)
     && (controllerInfo[0].unk0[2].button & PAD_BUTTON_Y))
        modeCtrl.submodeTimer = 30;

    update_av_logo();

    if ((dipSwitches & DIP_DEBUG)
     && !(modeCtrl.courseFlags & (1 << 13))
     && modeCtrl.submodeTimer > 60
     && lbl_802F1BA8 == 0
     && ANY_CONTROLLER_PRESSED(PAD_BUTTON_START))
    {
        func_8000FEC8(30);
        u_play_music(2, 0);
    }

    if (modeCtrl.courseFlags & (1 << 13))
        return;

    if (modeCtrl.submodeTimer > 30 && modeCtrl.submodeTimer < 690
     && ANY_CONTROLLER_PRESSED(PAD_BUTTON_START))
        modeCtrl.submodeTimer = 30;

    if (modeCtrl.submodeTimer == 30)
    {
        start_screen_fade(FADE_OUT|FADE_ABOVE_SPRITES, RGBA(0, 0, 0, 0), 30);
        textbox_set_properties(0, 20, NULL);
    }
    if (--modeCtrl.submodeTimer <= 0)
    {
        destroy_sprite_with_tag(SPRITE_TAG_LOGO_PLUS);
        gameSubmodeRequest = SMD_ADV_DEMO_INIT;
    }
}

/**
 * Demo Submode
 */

struct AdvDemoInfo advDemoInfo;

void submode_adv_demo_init_func(void)
{
    int i;

    if (gamePauseStatus & 0xA)
        return;
    func_80011D90();
    introBackdropColor = RGBA(255, 255, 255, 0);
    modeCtrl.submodeTimer = 2902;
    modeCtrl.courseFlags = 0;
    lbl_802F1BB0 = 0;
    advDemoInfo.unk8 = 0;
    advDemoInfo.flags = 0x108;
    func_800569B4(1);
    load_stage(ST_099_JUNGLE_BG);
    func_8002FFEC();
    event_finish_all();
    free_all_bitmap_groups_except_com();
    for (i = 0; i < 4; i++)
        g_poolInfo.playerPool.statusList[i] = 2;
    modeCtrl.playerCount = 1;
    modeCtrl.unk30 = 1;
    modeCtrl.gameType = GAMETYPE_MAIN_NORMAL;
    modeCtrl.currPlayer = 0;
    playerCharacterSelection[0] = 0;
    playerCharacterSelection[1] = 1;
    playerCharacterSelection[2] = 2;
    playerCharacterSelection[3] = 3;
    event_start(EVENT_BALL);
    for (i = 0; i < 4; i++)
    {
        advLogoInfo.unk18[i] = 1;
        lbl_802F1BB4[i] = 0;
        lbl_802F1BBC[i] = 0;
    }
    event_start(EVENT_STAGE);
    event_start(EVENT_STOBJ);
    event_start(EVENT_ITEM);
    event_start(EVENT_OBJ_COLLISION);
    event_start(EVENT_CAMERA);
    event_start(EVENT_SPRITE);
    event_start(EVENT_EFFECT);
    event_start(EVENT_REND_EFC);
    event_start(EVENT_BACKGROUND);
    event_start(EVENT_SOUND);
    light_init(currStageId);
    rend_efc_mirror_enable();
    for (i = 0; i < 4; i++)
    {
        ballInfo[i].state = 21;
        ballInfo[i].bananas = 0;
        worldInfo[i].state = 1;
    }
    camera_set_state(29);
    call_bitmap_load_group(BMP_ADV);
    hud_show_press_start_textbox(0);
    hud_show_adv_copyright_info(0);
    u_play_music(2, 0);
    gameSubmodeRequest = SMD_ADV_DEMO_MAIN;
}

enum
{
    CMD_BANANA_BOX          = 0,  // banana speech bubble
    CMD_HIDE_BANANA_BOXES   = 1,
    CMD_FADE_FROM_WHITE     = 2,
    CMD_FADE_TO_WHITE       = 3,
    CMD_PRELOAD_BG          = 4,  // unused
    CMD_LOAD_BG             = 5,  // unused
    CMD_SET_DEMO_FLAG       = 6,
    CMD_CLEAR_DEMO_FLAG     = 7,
    CMD_SHOW_CHARACTER      = 8,
    CMD_HIDE_CHARACTER      = 9,
    CMD_PRELOAD_STAGE       = 10,
    CMD_LOAD_STAGE          = 11,

    CMD_UNK13               = 13,
    CMD_INIT_CHARACTER_POS  = 14,
    CMD_UNK15               = 15,

    CMD_AIAI_ANIM           = 16,
    CMD_MEEMEE_ANIM         = 17,
    CMD_BABY_ANIM           = 18,
    CMD_GONGON_ANIM         = 19,  // unused
};

struct IntroCutsceneCommand
{
    s32 time;
    u32 cmdId;
    s32 param;
};

#define CHARACTER_AIAI   0
#define CHARACTER_MEEMEE 1
#define CHARACTER_BABY   2
#define CHARACTER_GONGON 3

const struct IntroCutsceneCommand introCutsceneScript[] =
{
    /* jungle scene */
    {    0, CMD_HIDE_CHARACTER,      CHARACTER_GONGON     },
    {    0, CMD_PRELOAD_STAGE,       ST_071_GAPS          },
    {    0, CMD_AIAI_ANIM,           14                   },
    {    0, CMD_MEEMEE_ANIM,         14                   },
    {    0, CMD_BABY_ANIM,           9                    },
    {    3, CMD_SET_DEMO_FLAG,       (1 << 6)             },
    {    0, CMD_SET_DEMO_FLAG,       (1 << 7)             },
    {  165, CMD_BANANA_BOX,          CHARACTER_AIAI       },
    {  220, CMD_BANANA_BOX,          CHARACTER_MEEMEE     },
    {  275, CMD_BANANA_BOX,          CHARACTER_BABY       },
    {  404, CMD_FADE_TO_WHITE,       30                   },
    {  404, CMD_HIDE_BANANA_BOXES,   -1                   },
    {  404, CMD_CLEAR_DEMO_FLAG,     (1 << 7)             },
    {  434, CMD_FADE_FROM_WHITE,     30                   },
    {  434, CMD_HIDE_CHARACTER,      CHARACTER_MEEMEE     },
    {  434, CMD_HIDE_CHARACTER,      CHARACTER_BABY       },
    {  434, CMD_AIAI_ANIM,           1                    },
    {  434, CMD_SET_DEMO_FLAG,       ADV_FLAG_SHOW_BLIMP  },
    {  544, CMD_AIAI_ANIM,           2                    },

    /* arctic scene (MeeMee) */
    {  651, CMD_LOAD_STAGE,          ST_071_GAPS          },
    {  651, CMD_HIDE_CHARACTER,      CHARACTER_AIAI       },
    {  651, CMD_SHOW_CHARACTER,      CHARACTER_MEEMEE     },
    {  652, CMD_PRELOAD_STAGE,       ST_061_TWIN_ATTACKER },
    {  652, CMD_CLEAR_DEMO_FLAG,     1                    },
    {  596, CMD_MEEMEE_ANIM,         4                    },
    {  651, CMD_MEEMEE_ANIM,         3                    },
    {  706, CMD_MEEMEE_ANIM,         4                    },
    {  761, CMD_MEEMEE_ANIM,         5                    },
    {  816, CMD_MEEMEE_ANIM,         4                    },
    // these two never have any effect because the desert scene starts before them
    {  871, CMD_MEEMEE_ANIM,         5                    },
    {  981, CMD_MEEMEE_ANIM,         4                    },

    /* desert scene (Baby) */
    {  869, CMD_LOAD_STAGE,          ST_061_TWIN_ATTACKER },
    {  869, CMD_HIDE_CHARACTER,      CHARACTER_MEEMEE     },
    {  869, CMD_SHOW_CHARACTER,      CHARACTER_BABY       },
    {  870, CMD_PRELOAD_STAGE,       ST_101_BLUR_BRIDGE   },
    {  869, CMD_BABY_ANIM,           7                    },

    /* space scene (AiAi, MeeMee, and Baby) */
    { 1087, CMD_LOAD_STAGE,          ST_101_BLUR_BRIDGE   },
    { 1087, CMD_SHOW_CHARACTER,      CHARACTER_AIAI       },
    { 1087, CMD_SHOW_CHARACTER,      CHARACTER_MEEMEE     },
    { 1087, CMD_AIAI_ANIM,           11                   },
    { 1087, CMD_MEEMEE_ANIM,         11                   },
    { 1087, CMD_BABY_ANIM,           11                   },
    { 1088, CMD_PRELOAD_STAGE,       ST_013_REPULSE       },
    { 1088, CMD_SET_DEMO_FLAG,       ADV_FLAG_SHOW_BLIMP  },
    { 1253, CMD_SET_DEMO_FLAG,       (1 << 9)             },
    { 1276, CMD_FADE_TO_WHITE,       30                   },

    /* "Repulse" level scene (AiAi) */
    { 1305, CMD_CLEAR_DEMO_FLAG,     (1 << 9)             },
    { 1305, CMD_LOAD_STAGE,          ST_013_REPULSE       },
    { 1305, CMD_HIDE_CHARACTER,      CHARACTER_MEEMEE     },
    { 1305, CMD_HIDE_CHARACTER,      CHARACTER_BABY       },
    { 1306, CMD_PRELOAD_STAGE,       ST_009_EXAM_A        },
    { 1306, CMD_FADE_FROM_WHITE,     30                   },
    { 1306, CMD_CLEAR_DEMO_FLAG,     ADV_FLAG_SHOW_BLIMP  },
    { 1305, CMD_UNK13,               -1                   },
    { 1305, CMD_INIT_CHARACTER_POS,  0                    },
    { 1305, CMD_SET_DEMO_FLAG,       (1 << 5)             },
    { 1306, CMD_SET_DEMO_FLAG,       ADV_FLAG_SHOW_STAGE  },
    { 1306, CMD_SET_DEMO_FLAG,       ADV_FLAG_SHOW_BALLS  },

    /* "Exam-A" level scene (MeeMee and Baby) */
    { 1739, CMD_UNK15,               -1                   },
    { 1739, CMD_LOAD_STAGE,          ST_009_EXAM_A        },
    { 1739, CMD_HIDE_CHARACTER,      CHARACTER_AIAI       },
    { 1739, CMD_SHOW_CHARACTER,      CHARACTER_MEEMEE     },
    { 1739, CMD_SHOW_CHARACTER,      CHARACTER_BABY       },
    { 1740, CMD_PRELOAD_STAGE,       ST_021_CHOICE        },
    { 1739, CMD_UNK13,               -1                   },
    { 1739, CMD_INIT_CHARACTER_POS,  2                    },
    { 1739, CMD_INIT_CHARACTER_POS,  1                    },
    { 1739, CMD_SET_DEMO_FLAG,       (1 << 5)             },

    /* "Choice" level scene (GonGon) */
    { 1953, CMD_UNK15,               -1                   },
    { 1953, CMD_LOAD_STAGE,          ST_021_CHOICE        },
    { 1953, CMD_SHOW_CHARACTER,      CHARACTER_AIAI       },
    { 1953, CMD_SHOW_CHARACTER,      CHARACTER_MEEMEE     },
    { 1953, CMD_SHOW_CHARACTER,      CHARACTER_BABY       },
    { 1954, CMD_PRELOAD_STAGE,       ST_095_BONUS_HUNTING },
    { 1954, CMD_SHOW_CHARACTER,      CHARACTER_GONGON     },
    { 1954, CMD_HIDE_CHARACTER,      CHARACTER_AIAI       },
    { 1954, CMD_HIDE_CHARACTER,      CHARACTER_MEEMEE     },
    { 1954, CMD_HIDE_CHARACTER,      CHARACTER_BABY       },
    { 1953, CMD_UNK13,               -1                   },
    { 1953, CMD_INIT_CHARACTER_POS,  3                    },
    { 1954, CMD_SET_DEMO_FLAG,       (1 << 5)             },

    /* "Bonus Hunting" level scene (all characters) */
    { 2167, CMD_UNK15,               -1                   },
    { 2167, CMD_LOAD_STAGE,          ST_095_BONUS_HUNTING },
    { 2167, CMD_SHOW_CHARACTER,      CHARACTER_AIAI       },
    { 2167, CMD_SHOW_CHARACTER,      CHARACTER_MEEMEE     },
    { 2167, CMD_SHOW_CHARACTER,      CHARACTER_BABY       },
    { 2167, CMD_HIDE_CHARACTER,      CHARACTER_AIAI       },
    { 2167, CMD_HIDE_CHARACTER,      CHARACTER_MEEMEE     },
    { 2167, CMD_HIDE_CHARACTER,      CHARACTER_BABY       },
    { 2167, CMD_HIDE_CHARACTER,      CHARACTER_GONGON     },
    { 2167, CMD_UNK13,               -1                   },
    { 2167, CMD_INIT_CHARACTER_POS,  3                    },
    { 2167, CMD_INIT_CHARACTER_POS,  2                    },
    { 2167, CMD_INIT_CHARACTER_POS,  1                    },
    { 2167, CMD_INIT_CHARACTER_POS,  0                    },
    { 2167, CMD_SET_DEMO_FLAG,       (1 << 5)             },
    { 2168, CMD_SET_DEMO_FLAG,       (1 << 11)            },
    { 2168, CMD_SET_DEMO_FLAG,       (1 << 12)            },
    { 2169, CMD_SHOW_CHARACTER,      CHARACTER_AIAI       },
    { 2169, CMD_SHOW_CHARACTER,      CHARACTER_MEEMEE     },
    { 2169, CMD_SHOW_CHARACTER,      CHARACTER_BABY       },
    { 2169, CMD_SHOW_CHARACTER,      CHARACTER_GONGON     },

    /* End */
    { -1, 0, 0 },
};

static void banana_textbox_callback(struct TextBox *tbox)
{
    Vec spC;
    static float lbl_801741CC[] = { -125, -70, -10 };

    mathutil_mtxA_from_mtxB();
    u_math_unk15(&ballInfo[tbox->id - 1].ape->unk30, &spC, currentCameraStructPtr->sub28.unk38);
    tbox->x = spC.x;
    tbox->y = spC.y + lbl_801741CC[tbox->id - 1];
}

void run_cutscene_script(void)
{
    float f28;
    const struct IntroCutsceneCommand *cmd;
    Vec sp3C;
    struct TextBox tbox;
    Vec sp8;
    int i;
    struct Sprite *sprite;

    if (advDemoInfo.unk8 >= 0xB56)
        return;
    f28 = advDemoInfo.unk8;
    for (cmd = introCutsceneScript; cmd->time != -1; cmd++)
    {
        if (f28 > cmd->time || f28 < cmd->time)
            continue;

        switch (cmd->cmdId)
        {
        case CMD_BANANA_BOX:
            if (!(modeCtrl.courseFlags & (1 << 13)))
            {
                mathutil_mtxA_from_mtxB();
                u_math_unk15(&ballInfo[cmd->param].ape->unk30, &sp3C, currentCameraStructPtr->sub28.unk38);
                memset(&tbox, 0, sizeof(tbox));
                tbox.x = sp3C.x;
                tbox.y = sp3C.y;
                tbox.numRows = (cmd->param == CHARACTER_BABY) ? 3 : 4;
                tbox.numColumns = (cmd->param == CHARACTER_BABY) ? 4 : 5;
                tbox.style = TEXTBOX_STYLE_CENTER_DOWN;
                tbox.callback = banana_textbox_callback;
                textbox_set_properties(cmd->param + 1, 1, &tbox);
                hud_create_adv_demo_banana_sprite(cmd->param);
            }
            break;
        case CMD_HIDE_BANANA_BOXES:
            for (i = 0; i < 3; i++)
                textbox_set_properties(i + 1, 20, NULL);
            sprite = find_sprite_with_tag(SPRITE_TAG_ADV_DEMO_BANANA_1);
            if (sprite != NULL)
                sprite->counter = -1;
            sprite = find_sprite_with_tag(SPRITE_TAG_ADV_DEMO_BANANA_2);
            if (sprite != NULL)
                sprite->counter = -1;
            sprite = find_sprite_with_tag(SPRITE_TAG_ADV_DEMO_BANANA_3);
            if (sprite != NULL)
                sprite->counter = -1;
            break;
        case CMD_FADE_FROM_WHITE:
            start_screen_fade(FADE_IN|FADE_ABOVE_SPRITES, RGBA(255, 255, 255, 0), cmd->param);
            break;
        case CMD_FADE_TO_WHITE:
            start_screen_fade(FADE_OUT|FADE_ABOVE_SPRITES, RGBA(255, 255, 255, 0), cmd->param);
            break;
        case CMD_PRELOAD_BG:
            preload_bg_files(cmd->param);
            break;
        case CMD_LOAD_BG:
            event_finish(EVENT_STAGE);
            event_finish(EVENT_STOBJ);
            event_finish(EVENT_ITEM);
            event_finish(EVENT_EFFECT);
            event_finish(EVENT_REND_EFC);
            event_finish(EVENT_BACKGROUND);
            load_bg_files(cmd->param);
            event_start(EVENT_STAGE);
            event_start(EVENT_STOBJ);
            event_start(EVENT_ITEM);
            event_start(EVENT_EFFECT);
            event_start(EVENT_REND_EFC);
            event_start(EVENT_BACKGROUND);
            break;
        case CMD_SET_DEMO_FLAG:
            advDemoInfo.flags |= cmd->param;
            break;
        case CMD_CLEAR_DEMO_FLAG:
            advDemoInfo.flags &= ~cmd->param;
            break;
        case CMD_SHOW_CHARACTER:
            ballInfo[cmd->param].ape->flags &= ~(1 << 5);
            break;
        case CMD_HIDE_CHARACTER:
            ballInfo[cmd->param].ape->flags |= (1 << 5);
            break;
        case CMD_PRELOAD_STAGE:
            preload_stage_files(cmd->param);
            break;
        case CMD_LOAD_STAGE:
            event_finish(EVENT_STAGE);
            event_finish(EVENT_STOBJ);
            event_finish(EVENT_ITEM);
            event_finish(EVENT_EFFECT);
            event_finish(EVENT_REND_EFC);
            event_finish(EVENT_BACKGROUND);
            func_800569B4(1);
            load_stage(cmd->param);
            event_start(EVENT_STAGE);
            event_start(EVENT_STOBJ);
            event_start(EVENT_ITEM);
            event_start(EVENT_EFFECT);
            event_start(EVENT_REND_EFC);
            event_start(EVENT_BACKGROUND);
            rend_efc_mirror_enable();
            break;
        case 12:
            light_init(0);
            break;
        case CMD_UNK13:  // level camera?
            event_start(EVENT_WORLD);
            event_start(EVENT_INFO);
            camera_set_state(54);
            light_init(currStageId);
            break;
        case CMD_INIT_CHARACTER_POS:
            ball_func_demo_init(&ballInfo[cmd->param]);
            ballInfo[cmd->param].bananas = 0;
            worldInfo[cmd->param].state = 1;
            advDemoInfo.unkC = cmd->param;
            break;
        case CMD_UNK15:  // cutscene camera?
            event_finish(EVENT_WORLD);
            event_finish(EVENT_INFO);
            camera_set_state(29);
            break;
        case CMD_AIAI_ANIM:
            advLogoInfo.unk18[0] = cmd->param;
            break;
        case CMD_MEEMEE_ANIM:
            advLogoInfo.unk18[1] = cmd->param;
            break;
        case CMD_BABY_ANIM:
            advLogoInfo.unk18[2] = cmd->param;
            break;
        case CMD_GONGON_ANIM:
            advLogoInfo.unk18[3] = cmd->param;
            break;
        case 21:
            ballInfo[0].ape->flags |= cmd->param;
            break;
        case 22:
            ballInfo[0].ape->flags &= ~cmd->param;
            break;
        case 23:
            ballInfo[1].ape->flags |= cmd->param;
            break;
        case 24:
            ballInfo[1].ape->flags &= ~cmd->param;
            break;
        case 25:
            ballInfo[2].ape->flags |= cmd->param;
            break;
        case 26:
            ballInfo[2].ape->flags &= ~cmd->param;
            break;
        case 27:
            sp8.x = 0.0f;
            sp8.y = 0.25f;
            sp8.z = 0.0f;
            func_8001898C(0, cmd->param, &sp8);
            break;
        case 28:
            u_show_eieipu_sprite(cmd->param);
            break;
        case 29:
            sprite = find_sprite_with_tag(SPRITE_TAG_EIEIPU);
            if (sprite != NULL)
            {
                sprite->userVar = cmd->param;
                sprite->counter = 0;
            }
            break;
        case 30:
            destroy_sprite_with_tag(SPRITE_TAG_EIEIPU);
            break;
        }
    }
    advDemoInfo.unk8++;
}

void submode_adv_demo_main_func(void)
{
    if (gamePauseStatus & 0xA)
        return;
    if (lbl_802014E0.unk0 == 2 && lbl_802014E0.unk4 == 1)
        lbl_802F1BB0 = 1;
    if (lbl_802F1BB0 == 0)
        return;
    if (advDemoInfo.unk8 == 0)
        start_screen_fade(FADE_IN|FADE_ABOVE_SPRITES, RGBA(0, 0, 0, 0), 60);
    run_cutscene_script();
    if (advDemoInfo.unk8 == 2602)
        func_8000FEC8(100);
    if (!(modeCtrl.courseFlags & (1 << 13)) && modeCtrl.submodeTimer > 60
     && lbl_802F1BA8 == 0
     && ANY_CONTROLLER_PRESSED(PAD_BUTTON_START))
        func_8000FEC8(30);
    modeCtrl.submodeTimer--;
}

struct Struct80176434 lbl_80174254[] =
{
    {    0, -15.51,   0,   0 },
    {  433, -15.51,   0,   0 },
    {  434,      0,   0,   0 },
    {  651,      0,   0,   0 },
    { 1088,  10.24,   0,   0 },
    { 1305,  10.24,   0,   0 },
    { 1306,      0,   0,   0 },
    { 1953,      0,   0,   0 },
    { 1954,   -0.5,   0,   0 },
    { 2167,   -0.5,   0,   0 },
    { 1954,    0.5,   0,   0 },
    { 2902,    0.5,   0,   0 },
};

struct Struct80176434 lbl_80174314[] =
{
    {    0, -58.591,   0,   0 },
    {  433, -58.591,   0,   0 },
    {  434,       0,   0,   0 },
    {  651,       0,   0,   0 },
    { 1088,     0.5,   0,   0 },
    { 1305,     0.5,   0,   0 },
    { 1306,       0,   0,   0 },
    { 1953,       0,   0,   0 },
    { 1954,       0,   0,   0 },
    { 2019,       0,   0,   0 },
    { 2064,       2,   0,   0 },
    { 2167,       2,   0,   0 },
    { 1954,       0,   0,   0 },
    { 2902,       0,   0,   0 },
};

struct Struct80176434 lbl_801743F4[] =
{
    {    0, -43.288,   0,   0 },
    {  433, -43.288,   0,   0 },
    {  434,       0,   0,   0 },
    {  651,       0,   0,   0 },
    { 1088,      10,   0,   0 },
    { 1305,      10,   0,   0 },
    { 1306,       0,   0,   0 },
    { 1953,       0,   0,   0 },
    { 1954,   -0.25,   0,   0 },
    { 2167,   -0.25,   0,   0 },
    { 1954,       0,   0,   0 },
    { 2902,       0,   0,   0 },
};

struct Struct80176434 lbl_801744B4[] =
{
    {    0,   61440,   0,   0 },
    {  433,   61440,   0,   0 },
    {  434,       0,   0,   0 },
    {  651,       0,   0,   0 },
    { 1088,   61440,   0,   0 },
    { 1305,   61440,   0,   0 },
    { 1306,   32768,   0,   0 },
    { 1953,   32768,   0,   0 },
    { 1954,   32768,   0,   0 },
    { 2167,   32768,   0,   0 },
    { 1954,   32768,   0,   0 },
    { 2902,   32768,   0,   0 },
};

struct Struct80176434 lbl_80174574[] =
{
    {    0,   -14.11,   0,   0 },
    {  433,   -14.11,   0,   0 },
    {  652, -445.764,   0,   0 },
    {  762, -444.964,   0,   0 },
    {  871, -445.764,   0,   0 },
    {  872, -453.964,   0,   0 },
    {  869, -451.364,   0,   0 },
    { 1088,      9.8,   0,   0 },
    { 1739,      9.8,   0,   0 },
    { 1740,     -0.3,   0,   0 },
    { 1953,     -0.3,   0,   0 },
    { 1954,      0.5,   0,   0 },
    { 2167,      0.5,   0,   0 },
    { 1954,     -0.5,   0,   0 },
    { 2902,     -0.5,   0,   0 },
};

struct Struct80176434 lbl_80174664[] =
{
    {    0,  -58.591,   0,   0 },
    {  433,  -58.591,   0,   0 },
    {  652,  -46.952,   0,   0 },
    {  869,  -46.952,   0,   0 },
    { 1088,      0.5,   0,   0 },
    { 1739,      0.5,   0,   0 },
    { 1740,        0,   0,   0 },
    { 1953,        0,   0,   0 },
    { 1954,        0,   0,   0 },
    { 2019,        0,   0,   0 },
    { 2064,        2,   0,   0 },
    { 2167,        2,   0,   0 },
    { 1954,        0,   0,   0 },
    { 2902,        0,   0,   0 },
};

struct Struct80176434 lbl_80174744[] =
{
    {    0,  -41.888,   0,   0 },
    {  433,  -41.888,   0,   0 },
    {  652, -231.687,   0,   0 },
    {  871, -231.687,   0,   0 },
    {  872, -230.587,   0,   0 },
    {  869, -233.587,   0,   0 },
    { 1088,     10.4,   0,   0 },
    { 1739,     10.4,   0,   0 },
    { 1740,        0,   0,   0 },
    { 1953,        0,   0,   0 },
    { 1954,    -0.25,   0,   0 },
    { 2167,    -0.25,   0,   0 },
    { 1954,     -0.2,   0,   0 },
    { 2902,     -0.2,   0,   0 },
};

struct Struct80176434 lbl_80174824[] =
{
    {    0,     4096,   0,   0 },
    {  433,     4096,   0,   0 },
    {  652,    11776,   0,   0 },
    {  871,    11776,   0,   0 },
    {  872,    55680,   0,   0 },
    {  869,    55680,   0,   0 },
    { 1088,    12288,   0,   0 },
    { 1739,    12288,   0,   0 },
    { 1740,    32768,   0,   0 },
    { 1953,    32768,   0,   0 },
    { 1954,    32768,   0,   0 },
    { 2167,    32768,   0,   0 },
    { 1954,    32768,   0,   0 },
    { 2902,    32768,   0,   0 },
};

struct Struct80176434 lbl_80174904[] =
{
    {    0,   -15.06,   0,   0 },
    {  433,   -15.06,   0,   0 },
    {  870,    -4.61,   0,   0 },
    { 1087,    -4.71,   0,   0 },
    { 1088,     9.82,   0,   0 },
    { 1739,     9.82,   0,   0 },
    { 1740,      0.3,   0,   0 },
    { 1953,      0.3,   0,   0 },
    { 1954,        0,   0,   0 },
    { 2167,        0,   0,   0 },
    { 1954,     -0.1,   0,   0 },
    { 2902,     -0.1,   0,   0 },
};

struct Struct80176434 lbl_801749C4[] =
{
    {    0,  -58.591,   0,   0 },
    {  433,  -58.591,   0,   0 },
    {  870,    -0.84,   0,   0 },
    { 1087,    -0.84,   0,   0 },
    { 1088,     0.58,   0,   0 },
    { 1739,     0.58,   0,   0 },
    { 1740,        0,   0,   0 },
    { 1953,        0,   0,   0 },
    { 1954,        0,   0,   0 },
    { 2019,        0,   0,   0 },
    { 2064,        2,   0,   0 },
    { 2167,        2,   0,   0 },
    { 1954,     -0.1,   0,   0 },
    { 2902,     -0.1,   0,   0 },
};

struct Struct80176434 lbl_80174AA4[] =
{
    {    0,  -41.688,   0,   0 },
    {  433,  -41.688,   0,   0 },
    {  870,     1.69,   0,   0 },
    { 1087,     1.39,   0,   0 },
    { 1088,      9.9,   0,   0 },
    { 1739,      9.9,   0,   0 },
    { 1740,        0,   0,   0 },
    { 1953,        0,   0,   0 },
    { 1954,     0.25,   0,   0 },
    { 2167,     0.25,   0,   0 },
    { 1954,      0.1,   0,   0 },
    { 2902,      0.1,   0,   0 },
};

struct Struct80176434 lbl_80174B64[] =
{
    {    0,    61440,   0,   0 },
    {  433,    61440,   0,   0 },
    {  870,     8192,   0,   0 },
    { 1087,     8192,   0,   0 },
    { 1088,        0,   0,   0 },
    { 1739,        0,   0,   0 },
    { 1740,    32768,   0,   0 },
    { 1953,    32768,   0,   0 },
    { 1954,    32768,   0,   0 },
    { 2167,    32768,   0,   0 },
    { 1954,    32768,   0,   0 },
    { 2902,    32768,   0,   0 },
};

struct Struct80176434 lbl_80174C24[] =
{
    { 1306,        0,   0,   0 },
    { 1953,        0,   0,   0 },
    { 1954,        0,   0,   0 },
    { 2167,        0,   0,   0 },
    { 1954,      0.1,   0,   0 },
    { 2902,      0.1,   0,   0 },
};

struct Struct80176434 lbl_80174C84[] =
{
    { 1306,        0,   0,   0 },
    { 1953,        0,   0,   0 },
    { 1954,        2,   0,   0 },
    { 2008,        2,   0,   0 },
    { 2009,        2,   0,   0 },
    { 2019,        0,   0,   0 },
    { 2167,        0,   0,   0 },
    { 1954,      0.1,   0,   0 },
    { 2902,      0.1,   0,   0 },
};

struct Struct80176434 lbl_80174D14[] =
{
    { 1306,        0,   0,   0 },
    { 1953,        0,   0,   0 },
    { 1954,     -0.1,   0,   0 },
    { 2167,     -0.1,   0,   0 },
    { 1954,     -0.3,   0,   0 },
    { 2902,     -0.3,   0,   0 },
};

struct Struct80176434 lbl_80174D74[] =
{
    { 1306,    32768,   0,   0 },
    { 1953,    32768,   0,   0 },
    { 1954,    32768,   0,   0 },
    { 2167,    32768,   0,   0 },
    { 1954,    32768,   0,   0 },
    { 2902,    32768,   0,   0 },
};

// x positions?
struct Struct80176434 *lbl_80174DD4[] =
{
    lbl_80174254,
    lbl_80174574,
    lbl_80174904,
    lbl_80174C24,
};

// y positions?
struct Struct80176434 *lbl_80174DE4[] =
{
    lbl_80174314,
    lbl_80174664,
    lbl_801749C4,
    lbl_80174C84,
};

// z positions?
struct Struct80176434 *lbl_80174DF4[] =
{
    lbl_801743F4,
    lbl_80174744,
    lbl_80174AA4,
    lbl_80174D14,
};

// unknown
struct Struct80176434 *lbl_80174E04[] =
{
    lbl_801744B4,
    lbl_80174824,
    lbl_80174B64,
    lbl_80174D74,
};

void lbl_8000F790(struct Ape *ape, int b)
{
    struct RaycastHit sp38;
    s16 r30;
    int r28;
    int r4, r5, r6;
    float f31 = advDemoInfo.unk8;

    switch (b)
    {
    case 3:
        u_ape_free(ape);
        return;
    }
    if (advDemoInfo.flags & (1 << 5))
    {
        struct Ball *ball = &ballInfo[ape->ballId];

        if (gamePauseStatus & 0xA)
            return;
        raycast_stage_down(&ball->pos, &sp38, NULL);
        ape->flags &= ~0x13;
        if (!(sp38.flags & 1) && ball->vel.y < -(35.0f / 216.0f))
            ape->flags |= 2;
        else if (mathutil_vec_len(&ball->unkB8) < (1.0f / 3600.0f))
            ape->flags |= 1;
        if (ape->flags & (1 << 5))
            ball->flags |= BALL_FLAG_INVISIBLE;
        else
            ball->flags &= ~BALL_FLAG_INVISIBLE;
        r28 = (ball->flags & BALL_FLAG_GOAL) != 0;
        r28 |= !(ape->flags & 3);
        func_8003699C(ape);
        if (r28)
            f31 = func_80036CAC(ape);
        else
        {
            f31 = 0.0f;
            mathutil_mtxA_from_quat(&ape->unk60);
            mathutil_mtxA_normalize_basis();
            if (ape->flags & (1 << 1))
                func_80037718(ape);
        }
        if (ball->flags & BALL_FLAG_05)
            f31 = mathutil_vec_len(&ball->vel);
        func_80036EB8(ape);
        mathutil_mtxA_to_quat(&ape->unk60);
        u_choose_ape_anim(ape, f31);
        u_do_ape_anim(ape);
        if (!(ape->flags & (1 << 3)))
            func_8003765C(ape);
        if (advDemoInfo.unk8 >= 0x682 && advDemoInfo.unk8 < 0x6CC)
            ball->unk104 = currentCameraStructPtr->eye;
        else if (advDemoInfo.unk8 >= 0x51A && advDemoInfo.unk8 < 0x6CC)
        {
            ball->unk104.x = 9.62f;
            ball->unk104.y = 0.58f;
            ball->unk104.z = -4.25f;
        }
        if (advDemoInfo.unk8 >= 0x6CC && advDemoInfo.unk8 < 0x73A && ape->charaId == 2)
            ball->unk104.x = ape->unk30.x + 1.0;
        if (advDemoInfo.unk8 >= 0x73A && advDemoInfo.unk8 < 0x7A2)
            ball->unk104 = ballInfo[1].ape->unk30;
        func_8008C090(ape, &ball->unk104);
        ball->unk100 = 0;
        ball->unk110 = 0.0f;
    }
    else
    {
        ape->flags &= ~0x13;
        ape->flags |= 1;
        ape->unk30.x = func_8008CDC0(f31, lbl_80174DD4[ape->charaId]);
        ape->unk30.y = func_8008CDC0(f31, lbl_80174DE4[ape->charaId]);
        ape->unk30.z = func_8008CDC0(f31, lbl_80174DF4[ape->charaId]);
        r30 = func_8008CDC0(f31, lbl_80174E04[ape->charaId]);
        if (ape->charaId == lbl_802F1EB4)
        {
            ape->unk30.x += lbl_802F1ECC * 0.1;
            ape->unk30.y += lbl_802F1EC8 * 0.1;
            ape->unk30.z += lbl_802F1EC4 * 0.1;
            r30 += lbl_802F1ED2;
        }
        mathutil_mtxA_from_identity();
        mathutil_mtxA_translate(&ape->unk30);
        mathutil_mtxA_rotate_y(r30);
        mathutil_mtxA_rotate_y(0xC000);
        mathutil_mtxA_to_quat(&ape->unk60);
        r4 = 6;
        r5 = 0;
        r6 = advLogoInfo.unk18[ape->charaId];
        if (r6 < 0)
        {
            switch (r6)
            {
            case -1:
                r4 = 8;
                r5 = 1;
                break;
            case -2:
                r4 = 5;
                r5 = 4;
                break;
            case -3:
                r4 = 2;
                r5 = 15;
                break;
            case -4:
                r4 = 5;
                r5 = 6;
                break;
            case -5:
                r4 = 5;
                r5 = 8;
                break;
            case -6:
                r4 = 5;
                r5 = 2;
                break;
            case -7:
                r4 = 2;
                r5 = 0;
                break;
            case -8:
                r4 = 5;
                r5 = 0;
                break;
            case -9:
                r4 = 5;
                r5 = 10;
                break;
            }
        }
        u_set_ape_anim(ape, r4, r5, r6, 0.0f);
        ape->unk3C = (Vec){ 0.0f, -0.12f, 0.0f };
        u_do_ape_anim(ape);
        if (advDemoInfo.flags & (1 << 9))
        {
            s16 sp30[] = { 0x2E00, 0xE100, 0x1500, 0x0000 };
            s16 sp28[] = { 0x0000, 0x0000, 0x0980, 0x0000 };

            lbl_802F1BB4[ape->charaId] += (sp30[ape->charaId] - lbl_802F1BB4[ape->charaId]) * 0.1;
            lbl_802F1BBC[ape->charaId] += (sp28[ape->charaId] - lbl_802F1BBC[ape->charaId]) * 0.1;
            func_8008BFDC(ape, lbl_802F1ED2 + lbl_802F1BB4[ape->charaId], lbl_802F1ED0 + lbl_802F1BBC[ape->charaId]);
        }
        else if (ape->flags & (1<<(31-9)))
        {
            Vec sp1C;
            mathutil_mtxA_push();
            mathutil_mtxA_from_quat(&ape->unk60);
            mathutil_mtxA_mult_right((void *)((u8 *)ape->unk0 + 0x8EC8));
            mathutil_mtxA_tf_vec_xyz(&sp1C, 0.0f, -1.0f, 0.0f);
            ape->unkAC = 0.0f;
            switch (ape->charaId)
            {
            case 2:
                ape->unkA0.x = 0.9f;
                ape->unkA0.y = -0.5f;
                break;
            default:
                ape->unkA0.x = 1.0f;
                ape->unkA0.y = 0.0f;
                break;
            }
            ape->unkA0.z = 0.0f;
            mathutil_vec_normalize_len(&ape->unkA0);
            mathutil_mtxA_tf_vec_xyz(&sp1C, 1.0f, 0.0f, 0.0f);
            sp1C.x += ape->unk30.x;
            sp1C.y += ape->unk30.y;
            sp1C.z += ape->unk30.z;
            func_8008C090(ape, &sp1C);
            mathutil_mtxA_pop();
        }
    }
}

static void func_8000FEC8(int a)
{
    struct Sprite *sprite;

    sprite = find_sprite_with_tag(37);
    if (sprite != NULL)
        sprite->userVar = -1;

    sprite = find_sprite_with_tag(38);
    if (sprite != NULL)
        sprite->userVar = -1;

    sprite = find_sprite_with_tag(39);
    if (sprite != NULL)
        sprite->userVar = -1;

    textbox_set_properties(1, 20, NULL);
    textbox_set_properties(2, 20, NULL);
    textbox_set_properties(3, 20, NULL);

    sprite = find_sprite_with_tag(30);
    if (sprite != NULL)
        sprite->counter = -1;

    sprite = find_sprite_with_tag(31);
    if (sprite != NULL)
        sprite->counter = -1;

    sprite = find_sprite_with_tag(32);
    if (sprite != NULL)
        sprite->counter = -1;

    textbox_set_properties(0, 20, NULL);

    sprite = find_sprite_with_tag(17);
    if (sprite != NULL)
        sprite->userVar = 1;

    hud_show_title_banner(a);
    u_play_sound_0(0xA022);
    if (lbl_802014E0.unk0 != 2)
        u_play_music(3, 0);
    modeCtrl.courseFlags |= (1 << 13);
    lbl_802F1BA8 = a;
}

/**
 * Title Submode
 */

void submode_adv_title_init_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    modeCtrl.submodeTimer = 1200;
    modeCtrl.unk10 = 0;
    modeCtrl.courseFlags &= ~(1 << 2);
    lbl_802F1BA8 = 0;
    advDemoInfo.unk8 = 0xB56;
    advDemoInfo.flags = 0;
    event_finish(EVENT_BALL);
    event_finish(EVENT_STAGE);
    event_finish(EVENT_STOBJ);
    event_finish(EVENT_ITEM);
    event_finish(EVENT_OBJ_COLLISION);
    event_finish(EVENT_CAMERA);
    event_finish(EVENT_EFFECT);
    event_finish(EVENT_SOUND);
    event_finish(EVENT_REND_EFC);
    event_finish(EVENT_BACKGROUND);
    hud_show_press_start_textbox(2);
    if (screenFadeInfo.timer != 0)
        start_screen_fade(FADE_IN|FADE_ABOVE_SPRITES, RGBA(0, 0, 0, 0), 30);
    file_preload("bmp/bmp_sel.tpl");
    gameSubmodeRequest = SMD_ADV_TITLE_MAIN;
}

void submode_adv_title_reinit_func(void)
{
    struct TextBox tbox;

    if (gamePauseStatus & 0xA)
        return;

    func_80011D90();
    introBackdropColor = RGBA(255, 255, 255, 0);
    modeCtrl.submodeTimer = 1200;
    modeCtrl.courseFlags = 0x2000;
    lbl_802F1BA8 = 0;
    func_8002FFEC();
    light_init(0);
    playerCharacterSelection[0] = 0;
    event_finish_all();
    free_all_bitmap_groups_except_com();
    event_start(EVENT_SPRITE);
    event_start(EVENT_SOUND);
    camera_set_state(27);
    unload_stage();
    call_bitmap_load_group(BMP_ADV);
    hud_show_title_banner(1);
    if (dipSwitches & DIP_DEBUG)
        hud_show_press_start_textbox(2);
    else
    {
        modeCtrl.courseFlags |= (1 << 2);
        memset(&tbox, 0, sizeof(tbox));
        tbox.x = 320;
        tbox.y = 386;
        tbox.numRows = 2;
        tbox.numColumns = 12;
        tbox.style = 14;
        tbox.callback = NULL;
        textbox_set_properties(0, 1, &tbox);
        textbox_add_text(0, " \n ");
        hud_show_title_menu();
    }
    load_stage(ST_150_TUTORIAL);
    light_init(0);
    u_play_sound_0(0xA022);
    u_play_music(3, 0);
    start_screen_fade(FADE_IN|FADE_ABOVE_SPRITES, RGBA(0, 0, 0, 0), 30);
    gameSubmodeRequest = SMD_ADV_TITLE_MAIN;
}

s32 lbl_802F02EC = 6;
s32 lbl_802F02F0 = 6;

void submode_adv_title_main_func(void)
{
    int i;

    if ((dipSwitches & DIP_DEBUG)
     && (controllerInfo[0].unk0[0].button & (1 << 10))
     && (controllerInfo[0].unk0[2].button & (1 << 11))
     && modeCtrl.submodeTimer > 30)
        modeCtrl.submodeTimer = 30;

    if (gamePauseStatus & 0xA)
        return;

    if (textBoxes[0].state < 20
     && !(dipSwitches & DIP_DEBUG)
     && !(modeCtrl.courseFlags & (1 << 2))
     && ANY_CONTROLLER_PRESSED(PAD_BUTTON_START))
    {
        struct TextBox tbox;

        u_play_sound_1(0x162);
        modeCtrl.courseFlags |= 4;
        memset(&tbox, 0, sizeof(tbox));
        tbox.x = 320;
        tbox.y = 386;
        tbox.numRows = 2;
        tbox.numColumns = 12;
        tbox.style = 14;
        tbox.callback = NULL;
        textbox_set_properties(0, 1, &tbox);
        textbox_add_text(0, " \n ");
        hud_show_title_menu();
    }
    if (modeCtrl.courseFlags & (1 << 2))
    {
        for (i = 0; i < 4; i++)
        {
            if (modeCtrl.unk10 != 0 && CONTROLLER_SOMETHING(i, PAD_BUTTON_UP))
            {
                modeCtrl.unk10 = 0;
                u_play_sound_1(0x6F);
                if (modeCtrl.submodeTimer > 30 && modeCtrl.submodeTimer < 300)
                    modeCtrl.submodeTimer = 300;
            }
            else if (modeCtrl.unk10 != 1 && CONTROLLER_SOMETHING(i, PAD_BUTTON_DOWN))
            {
                modeCtrl.unk10 = 1;
                u_play_sound_1(0x6F);
                if (modeCtrl.submodeTimer > 30 && modeCtrl.submodeTimer < 300)
                    modeCtrl.submodeTimer = 300;
            }
        }
    }
    if (modeCtrl.submodeTimer == 30)
    {
        start_screen_fade(FADE_OUT|FADE_ABOVE_SPRITES, RGBA(0, 0, 0, 0), 30);
        textbox_set_properties(0, 20, NULL);
        u_play_music(modeCtrl.submodeTimer, 2);
    }
    if (--modeCtrl.submodeTimer <= 0)
    {
        lbl_802F1B78 = 0;
        gameSubmodeRequest = SMD_ADV_INFO_INIT;
    }
}

/**
 * Info Submode - Shows a tutorial explaining controls
 */

struct AdvTutorialInfo advTutorialInfo;

void submode_adv_info_init_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    func_80011D90();
    modeCtrl.submodeTimer = 4380;
    modeCtrl.courseFlags &= ~0x2004;
    modeCtrl.playerCount = 1;
    playerCharacterSelection[0] = 0;
    func_8002FFEC();
    event_finish_all();
    load_stage(ST_150_TUTORIAL);
    event_start(EVENT_STAGE);
    event_start(EVENT_WORLD);
    event_start(EVENT_BALL);
    event_start(EVENT_STOBJ);
    event_start(EVENT_INFO);
    event_start(EVENT_ITEM);
    event_start(EVENT_OBJ_COLLISION);
    event_start(EVENT_MINIMAP);
    event_start(EVENT_CAMERA);
    event_start(EVENT_SPRITE);
    event_start(EVENT_SOUND);
    event_start(EVENT_EFFECT);
    event_start(EVENT_BACKGROUND);
    light_init(currStageId);
    ballInfo[0].state = 16;
    ballInfo[0].bananas = 0;
    camera_set_state(43);
    call_bitmap_load_group(BMP_NML);
    hud_show_press_start_textbox(0);
    hud_show_adv_copyright_info(0);
    if (!(modeCtrl.courseFlags & (1 << 13)))
    {
        struct TextBox tbox;

        memset(&tbox, 0, sizeof(tbox));
        tbox.x = 320;
        tbox.y = 210;
        tbox.numRows = 1;
        tbox.numColumns = 1;
        tbox.style = TEXTBOX_STYLE_CENTER_DOWN;
        tbox.callback = NULL;
        textbox_set_properties(1, 2, &tbox);
        tbox.x = 320;
        tbox.y = 60;
        tbox.numRows = 1;
        tbox.numColumns = 0;
        tbox.style = 14;
        tbox.callback = NULL;
        textbox_set_properties(2, 1, &tbox);
        textbox_add_text(2, "c/0xff5000/    Control description!    ");
    }
    func_800846B0(4);
    func_800846B0(3);
    start_screen_fade(FADE_IN|FADE_ABOVE_SPRITES, RGBA(0, 0, 0, 0), 30);
    advTutorialInfo.stickXRot = 0;
    advTutorialInfo.stickZRot = 0;
    advTutorialInfo.transitionValue = 0.0f;
    u_play_music(0xFFF60014, 0);
    gameSubmodeRequest = SMD_ADV_INFO_MAIN;
}

enum
{
    INFOCMD_CAMERA_SET_FLAGS   = -1,
    INFOCMD_CAMERA_CLEAR_FLAGS = -2,  // unused
    INFOCMD_MINIMAP_SIZE       = -3,
    INFOCMD_BALL_STATE         = -4,
    INFOCMD_UNK5               = -5,
    INFOCMD_FADE_FROM_BLACK    = -6,
    INFOCMD_FADE_TO_BLACK      = -7,
    INFOCMD_CAMERA_STATE       = -8,
    INFOCMD_BALL_SET_FLAGS     = -9,
    INFOCMD_BALL_CLEAR_FLAGS   = -10,
    INFOCMD_HIDE_TEXTBOX       = -11,
    INFOCMD_UNK12              = -12,
    INFOCMD_PLAY_SOUND         = -13,
};

struct InfoCommand
{
    s16 time;
    s8 cmdId;  // if non-negative, then this is the index of the English translation
    char *jpText;
    u32 param;
};

const struct InfoCommand infoScript[] =
{
    { 4380, INFOCMD_UNK12,            NULL, 0    },
    { 4380, INFOCMD_CAMERA_SET_FLAGS, NULL, 2    },
    { 4320, 0,  "k/SU-PA-MONKI-BO-RUh/NOASOBIKATA", 0 },
    { 4140, INFOCMD_BALL_STATE,       NULL, 4    },
    { 4140, INFOCMD_UNK5,             NULL, 1    },
    { 4140, INFOCMD_CAMERA_SET_FLAGS, NULL, 2    },
    { 4140, 1,  "k/KONNTORO-RUSUTEXIKKUh/WO\np/IRE/h/TAHOUNI k/KOROh/GARUYO", 0 },
    { 3840, 2,  "k/BO-RUh/GAp/UGOku/h/KUTO k/KAMERAh/MOp/UGOku/h/KUKARA", 0 },
    { 3600, 3,  "h/SORENIp/Au/h/WASETE\nk/KONNTORO-RUSUTEXIKKUh/WOp/IRE/h/YOU", 0 },
    { 3420, INFOCMD_CAMERA_SET_FLAGS, NULL, 2    },
    { 3300, INFOCMD_UNK12,            NULL, 1    },
    { 3240, 4,  "p/MIGI/SHITA/h/NIARUNOHA k/MAPPUh/DAYO", 0 },
    { 3000, 5,  "c/0xffffff/p/BUTTON_A/c/0x000000/k/BOTANh/WOp/OSU/h/SUTO", 0 },
    { 2970, INFOCMD_MINIMAP_SIZE,     NULL, 0    },
    { 2970, INFOCMD_UNK12,            NULL, 2    },
    { 2955, INFOCMD_UNK12,            NULL, 1    },
    { 2760, 6,  "k/MAPPUh/NOp/OOkii/h/KISAGA p/KAwaru/h/WARUNDA", 0 },
    { 2730, INFOCMD_MINIMAP_SIZE,     NULL, 0    },
    { 2730, INFOCMD_UNK12,            NULL, 2    },
    { 2715, INFOCMD_UNK12,            NULL, 1    },
    { 2520, 7,  "k/GO-RUp/CHITENN/h/YA p/CHIKEI/h/GAYOKUWAKARUYO", 0 },
    { 2490, INFOCMD_MINIMAP_SIZE,     NULL, 0    },
    { 2490, INFOCMD_UNK12,            NULL, 2    },
    { 2475, INFOCMD_UNK12,            NULL, 1    },
    { 2250, INFOCMD_UNK12,            NULL, 0    },
    { 2220, 8,  "k/BOKUh/HAk/BANANAh/GAk/DA~ISUKI!", 0 },
    { 1980, 9,  "k/BANANAh/WO100p/HONN/p/TAberu/h/BERUTO", 0 },
    { 1740, 10, "1UPh/SURUNDAYO", 0 },
    { 1550, 11, "p/CHIKEI/h/NIp/Au/h/WASETEk/\nk/KONNTORO-RUSUTEXIKKUh/WOp/IRE/h/YOU", 0 },
    { 1380, 12, "p/SAKAMICHI/h/WONOBORUp/TOKI/h/HA", 0 },
    { 1240, 13, "k/KONNTORO-RUSUTEXIKKUh/WO\np/OOkii/h/KIKUKATAMUKETENE", 0 },
    { 1100, 14, "k/HUROAh/KARAp/Ochiru/h/CHIRUTO1k/MISUh/DAYO", 0 },
    {  960, 15, "p/Ochiru/h/CHINAIYOUNI p/KIbunn/h/WOTUKETENE~!", 1 },
    {  600, INFOCMD_FADE_TO_BLACK,    NULL, 16   },
    {  585, INFOCMD_FADE_FROM_BLACK,  NULL, 15   },
    {  585, INFOCMD_BALL_STATE,       NULL, 16   },
    {  585, INFOCMD_CAMERA_STATE,     NULL, 43   },
    {  584, INFOCMD_BALL_STATE,       NULL, 4    },
    {  584, INFOCMD_CAMERA_SET_FLAGS, NULL, 2    },
    {  600, 16, "k/TAIMUh/GA0NINARUMAENI", 0 },
    {  330, 17, "k/GO-RUh/SUREBA p/TSUGI/h/NISUSUMERUYO", 0 },
    {   90, INFOCMD_BALL_CLEAR_FLAGS, NULL, 256  },
    {   90, INFOCMD_BALL_CLEAR_FLAGS, NULL, 1024 },
    {   90, INFOCMD_BALL_SET_FLAGS,   NULL, 512  },
    {   90, INFOCMD_HIDE_TEXTBOX,     NULL, 0    },
    {   90, INFOCMD_PLAY_SOUND,       NULL, 294  },

    /* End */
    { 0 },
};

char *infoEnglishText[] =
{
    "How to play Super Monkey Ball!",
    "The further you push the Control\nStick, the faster you'll roll.",
    "And if the ball starts moving,\nthe camera will follow.",
    "So, you'll want to make sure\nto remember that when you move.",
    "There's a map of the stage\nin the bottom right corner.",
    "If you press the c/0xffffff/p/BUTTON_A/c/0x000000/a/ Button,",
    "you can change\nthe size of the map!",
    "The goal and level boundaries\nare easy to see.",
    "I really love bananas!",
    "If you eat 100 bananas,",
    "you'll get an extra life!",
    "Make sure to use the Control Stick\nand stay on the ground!",
    "When you want to climb up a hill,",
    "make sure to press hard\non the Control Stick!",
    "If you fall off, you'll lose a lifep/TENNTENN/",
    "Make sure not to fall off!",
    "If you make it to the goal\nbefore time runs out,",
    "you'll advance to the next stage!",
};

float adv_dummy_0_5(void) { return 0.5f; }  // needed to influence ordering of float constants

void submode_adv_info_main_func(void)
{
    const struct InfoCommand *cmd;

    if (gamePauseStatus & 0xA)
        return;
    if ((dipSwitches & DIP_DEBUG)
     && (controllerInfo[0].unk0[0].button & PAD_BUTTON_X)
     && (controllerInfo[0].unk0[2].button & PAD_BUTTON_Y)
     && modeCtrl.submodeTimer > 30)
        modeCtrl.submodeTimer = 30;

    if (modeCtrl.submodeTimer == 820)
        modeCtrl.submodeTimer = 600;

    if (infoWork.flags & INFO_FLAG_FALLOUT)
    {
        infoWork.flags &= ~INFO_FLAG_FALLOUT;
        camera_set_state(4);
        u_play_sound_0(29);
    }
    if (modeCtrl.submodeTimer == 583)
    {
        ballInfo[0].flags &= ~BALL_FLAG_11;
        infoWork.flags &= ~INFO_FLAG_TIMER_PAUSED;
    }
    if (infoWork.flags & INFO_FLAG_GOAL)
    {
        infoWork.flags &= ~INFO_FLAG_GOAL;
        ballInfo[0].state = 5;
        ballInfo[0].flags |= 0x500;
        camera_set_state(14);
    }
    if (modeCtrl.submodeTimer < 3360 && modeCtrl.submodeTimer > 2760)
    {
        Vec sp30;
        sp30.x = 1.15f;
        sp30.y = 0.5f;
        sp30.z = 3.8f;
        func_800390C8(5, &sp30, 1.0f);
    }
    if (!(modeCtrl.courseFlags & (1 << 13)) && modeCtrl.submodeTimer == 4320)
        hud_show_title_screen_monkey_sprite();
    for (cmd = infoScript; cmd->time != 0; cmd++)
    {
        if (modeCtrl.submodeTimer > cmd->time || modeCtrl.submodeTimer < cmd->time)
            continue;
        if (cmd->cmdId >= 0 && !(modeCtrl.courseFlags & (1 << 13)))
        {
            struct TextBox tbox;

            memset(&tbox, 0, sizeof(tbox));
            if (cmd->cmdId == 16)
                tbox.y = 0xC8;
            if (cmd->cmdId == 17)
                tbox.y = 0xB4;
            tbox.numRows = 1;
            tbox.style = cmd->param ? TEXTBOX_STYLE_SPIKY : TEXTBOX_STYLE_CENTER_DOWN;
            textbox_set_properties(1, 21, &tbox);
            textbox_add_text(1, infoEnglishText[cmd->cmdId]);
        }
        switch (cmd->cmdId)
        {
        case INFOCMD_CAMERA_SET_FLAGS:
            camera_set_or_clear_flags(cmd->param, TRUE);
            break;
        case INFOCMD_CAMERA_CLEAR_FLAGS:
            camera_set_or_clear_flags(cmd->param, FALSE);
            break;
        case INFOCMD_MINIMAP_SIZE:
            minimap_change_size();
            break;
        case INFOCMD_BALL_STATE:
            ballInfo[0].state = cmd->param;
            break;
        case INFOCMD_UNK5:
            worldInfo[0].state = cmd->param;
            break;
        case INFOCMD_FADE_FROM_BLACK:
            start_screen_fade(FADE_IN, RGBA(0, 0, 0, 0), (s8)cmd->param);
            break;
        case INFOCMD_FADE_TO_BLACK:
            start_screen_fade(FADE_OUT, RGBA(0, 0, 0, 0), (s8)cmd->param);
            break;
        case INFOCMD_CAMERA_STATE:
            camera_set_state((s8)cmd->param);
            break;
        case INFOCMD_BALL_SET_FLAGS:
            ballInfo[0].flags |= cmd->param;
            break;
        case INFOCMD_BALL_CLEAR_FLAGS:
            ballInfo[0].flags &= ~cmd->param;
            break;
        case INFOCMD_HIDE_TEXTBOX:
            textbox_set_properties(1, 20, 0);
            break;
        case INFOCMD_UNK12:
            advTutorialInfo.state = cmd->param;
            break;
        case INFOCMD_PLAY_SOUND:
            u_play_sound_0(cmd->param);
            break;
        }
    }
    if (!(modeCtrl.courseFlags & (1 << 13))
     && modeCtrl.submodeTimer > 60
     && lbl_802F1BA8 == 0
     && ANY_CONTROLLER_PRESSED(PAD_BUTTON_START))
        func_8000FEC8(30);
    if (modeCtrl.submodeTimer == 30)
    {
        struct Sprite *sprite;

        start_screen_fade(FADE_OUT|FADE_ABOVE_SPRITES, RGBA(0, 0, 0, 0), 31);
        textbox_set_properties(0, 20, NULL);
        textbox_set_properties(1, 20, NULL);
        textbox_set_properties(2, 20, NULL);
        u_play_music(modeCtrl.submodeTimer, 2);
        sprite = find_sprite_with_tag(17);
        if (sprite != NULL)
            sprite->userVar = 1;
    }
    if (--modeCtrl.submodeTimer <= 0)
        gameSubmodeRequest = SMD_ADV_GAME_READY_INIT;
}

/**
 * Game Ready Submode
 */
 
static int func_800119C0(void);
static int func_80011A84(void);
static int func_80011B98(void);
static void func_80011BD4(void);

void submode_adv_game_ready_init_func(void)
{
    struct ReplayHeader sp8;
    int r4;

    if (gamePauseStatus & 0xA)
        return;
    u_load_random_builtin_replay();
    func_80011BD4();
    lbl_80250A68.unk14 = 0;
    lbl_80250A68.unk0[lbl_80250A68.unk14] = func_800119C0();
    if (lbl_80250A68.unk0[lbl_80250A68.unk14] < 0)
    {
        lbl_80250A68.unk0[lbl_80250A68.unk14] = 0;
        gameSubmodeRequest = SMD_ADV_LOGO_INIT;
        start_screen_fade(FADE_UNK2, RGBA(0, 0, 0, 0), 1);
        return;
    }
    lbl_80250A68.unk10 = func_8004964C(lbl_80250A68.unk0[lbl_80250A68.unk14]);
    get_replay_header(lbl_80250A68.unk0[lbl_80250A68.unk14], &sp8);
    currStageId = sp8.stageId;
    event_finish_all();
    call_bitmap_load_group(BMP_RNK);
    modeCtrl.gameType = GAMETYPE_MAIN_NORMAL;
    modeCtrl.playerCount = 1;
    modeCtrl.unk30 = 1;
    camera_setup_splitscreen_viewports(modeCtrl.playerCount);
    func_80044920();
    func_8002FFEC();
    event_start(EVENT_INFO);
    func_80049514(lbl_80250A68.unk0[lbl_80250A68.unk14]);
    infoWork.flags |= INFO_FLAG_REPLAY|INFO_FLAG_11;
    load_stage(currStageId);
    event_start(EVENT_STAGE);
    event_start(EVENT_WORLD);
    event_start(EVENT_BALL);
    event_start(EVENT_STOBJ);
    event_start(EVENT_ITEM);
    event_start(EVENT_OBJ_COLLISION);
    event_start(EVENT_MINIMAP);
    event_start(EVENT_CAMERA);
    event_start(EVENT_SPRITE);
    event_start(EVENT_SOUND);
    event_start(EVENT_EFFECT);
    event_start(EVENT_REND_EFC);
    event_start(EVENT_BACKGROUND);
    rend_efc_mirror_enable();
    event_suspend(EVENT_WORLD);
    light_init(currStageId);
    func_800846B0(4);
    bitmap_load_group(BMP_NML);
    infoWork.flags |= INFO_FLAG_TIMER_PAUSED|INFO_FLAG_08;
    modeCtrl.submodeTimer = 120;
    ballInfo[0].state = 2;
    ballInfo[0].bananas = 0;
    camera_set_state(10);
    u_show_adv_ready_hud();
    func_800885EC();
    func_80088E90();
    hud_show_press_start_textbox(0);
    hud_show_adv_copyright_info(0);
    show_rank_title_logo();
    advTutorialInfo.state = 0;
    lbl_802F1BAC = 0;
    r4 = backgroundSongs[backgroundInfo.bgId];
    if (r4 != -1 && r4 != lbl_802014E0.unk0 && r4 + 1 != lbl_802014E0.unk0)
        u_play_music(0xFFF60000 | r4, 0);
    start_screen_fade(FADE_IN|FADE_ABOVE_SPRITES, RGBA(0, 0, 0, 0), 30);
    gameSubmodeRequest = SMD_ADV_GAME_READY_MAIN;
}

void submode_adv_game_ready_main_func(void)
{
    if (gamePauseStatus & 0xA)
        return;
    if (modeCtrl.submodeTimer == 120)
    {
        struct Sprite *sprite = find_sprite_with_tag(15);

        if (sprite != NULL)
            sprite->userVar = 15;
        hud_show_ready_banner(0x78);
        func_800846B0(3);
    }
    if (modeCtrl.submodeTimer == 24.0)
        ballInfo[0].state = 3;
    if (!(modeCtrl.courseFlags & (1 << 13))
     && modeCtrl.submodeTimer > 30
     && lbl_802F1BA8 == 0
     && ANY_CONTROLLER_PRESSED(PAD_BUTTON_START))
        func_8000FEC8(30);
    if (--modeCtrl.submodeTimer <= 0)
    {
        struct ReplayHeader sp8;

        get_replay_header(func_80011A84(), &sp8);
        if (gamePauseStatus & (1 << 2))
            printf("/*-- pre_load_stage(%d) --*/\n", sp8.stageId);
        preload_stage_files(sp8.stageId);
        gameSubmodeRequest = SMD_ADV_GAME_PLAY_INIT;
    }
}

void submode_adv_game_play_init_func(void)
{
    if (gamePauseStatus & 0xA)
        return;
    modeCtrl.submodeTimer = func_8004964C(lbl_80250A68.unk0[lbl_80250A68.unk14]) + 30.0;
    event_resume(EVENT_WORLD);
    hud_show_go_banner(60);
    infoWork.flags &= ~(INFO_FLAG_TIMER_PAUSED|INFO_FLAG_08);
    ballInfo[0].state = 9;
    worldInfo[0].state = 9;
    camera_set_state(0);
    infoWork.flags |= INFO_FLAG_REPLAY|INFO_FLAG_11;
    lbl_80250A68.unk10 = func_8004964C(lbl_80250A68.unk0[lbl_80250A68.unk14]);
    animate_anim_groups(func_80049F90(lbl_80250A68.unk10, lbl_80250A68.unk0[lbl_80250A68.unk14]));
    gameSubmodeRequest = SMD_ADV_GAME_PLAY_MAIN;
}

void submode_adv_game_play_main_func(void)
{
    if (gamePauseStatus & 0xA)
        return;
    if (infoWork.flags & INFO_FLAG_GOAL)
    {
        infoWork.flags &= ~INFO_FLAG_GOAL;
        modeCtrl.unk18 = 0xB4;
        gameSubmodeRequest = SMD_ADV_RANKING_INIT;
        worldInfo[0].state = 6;
        camera_set_state(14);
        func_800846B0(1);
    }
    if (!(modeCtrl.courseFlags & (1 << 13))
     && modeCtrl.submodeTimer > 30
     && lbl_802F1BA8 == 0
     && ANY_CONTROLLER_PRESSED(PAD_BUTTON_START))
        func_8000FEC8(30);
    modeCtrl.submodeTimer--;
    if (modeCtrl.submodeTimer < 0)
    {
        gameSubmodeRequest = SMD_ADV_RANKING_INIT;
        func_800846B0(1);
    }
}

/**
 * Ranking Submode
 */

static int func_80011BE0(void);

void submode_adv_ranking_init_func(void)
{
    modeCtrl.submodeTimer = 2520;
    destroy_sprite_with_tag(2);
    destroy_sprite_with_tag(18);
    gameSubmodeRequest = SMD_ADV_RANKING_MAIN;
}

void submode_adv_ranking_main_func(void)
{
    struct Ball *r31;
    struct Ball *r29;
    struct Ball *ballBackup;
    s8 *r28;
    int i;

    if (gamePauseStatus & 0xA)
        return;
    r31 = &ballInfo[0];
    switch (modeCtrl.submodeTimer)
    {
    case 2520:
        destroy_sprite_with_tag(0);
        destroy_sprite_with_tag(37);
        destroy_sprite_with_tag(39);
        hud_show_adv_copyright_info(1);
        init_ranking_screen(0);
        if (find_sprite_with_tag(17) != NULL)
            find_sprite_with_tag(17)->userVar = 1;
        advTutorialInfo.state = 1;
        break;
    case 2460:
        break;
    case 2160:
        func_80088A10();
        if (lbl_802F1BA8 == 0)
            func_80088F18();
        break;
    case 2100:
        func_8008897C(0);
        break;
    case 1620:
        if (lbl_802F1BA8 == 0)
        {
            init_ranking_screen(1);
            modeCtrl.unk18 = 0xB4;
        }
        break;
    case 1260:
        func_80088A10();
        break;
    case 1200:
        func_8008897C(0);
        break;
    case 720:
        if (lbl_802F1BA8 == 0)
        {
            init_ranking_screen(2);
            modeCtrl.unk18 = 0xB4;
        }
        break;
    case 360:
        func_80088A10();
        break;
    case 300:
        func_8008897C(0);
        break;
    case 90:
        func_80088FD4(0);
        break;
    }

    if (r31->state == 4)
    {
        struct ReplayHeader sp50;

        get_replay_header(lbl_80250A68.unk0[lbl_80250A68.unk14], &sp50);
        if (sp50.flags & (1 << 7))
        {
            r31->state = 5;
            r31->flags |= 0x3500;
        }
    }
    if (r31->state == 4 || r31->state == 6)
        infoWork.flags &= ~(INFO_FLAG_REPLAY|INFO_FLAG_11);
    if (r31->state != 10)
        modeCtrl.unk18--;
    if (modeCtrl.unk18 < 0
     && (r31->state == 6 || r31->state == 4)
     && ((modeCtrl.submodeTimer & 0x1F) == 0 || !(infoWork.flags & INFO_FLAG_05)))
    {
        if (modeCtrl.submodeTimer > 180.0)
        {
            struct ReplayHeader sp38;
            struct RenderEffect focusEffect;
            float f1;
            struct ReplayHeader sp8;

            modeCtrl.unk18 = 0x96;
            event_finish(EVENT_STAGE);
            event_finish(EVENT_STOBJ);
            event_finish(EVENT_ITEM);
            event_finish(EVENT_EFFECT);
            event_finish(EVENT_REND_EFC);
            event_finish(EVENT_BACKGROUND);
            event_finish(EVENT_BALL);
            event_finish(EVENT_SOUND);
            lbl_80250A68.unk0[lbl_80250A68.unk14] = func_80011B98();
            get_replay_header(lbl_80250A68.unk0[lbl_80250A68.unk14], &sp38);
            currStageId = sp38.stageId;
            func_80049514(lbl_80250A68.unk0[lbl_80250A68.unk14]);
            infoWork.flags |= INFO_FLAG_REPLAY;
            load_stage(currStageId);
            event_start(EVENT_STAGE);
            event_start(EVENT_STOBJ);
            event_start(EVENT_ITEM);
            event_start(EVENT_EFFECT);
            event_start(EVENT_REND_EFC);
            event_start(EVENT_BACKGROUND);
            event_start(EVENT_BALL);
            event_start(EVENT_SOUND);
            rend_efc_mirror_enable();
            memset(&focusEffect, 0, sizeof(focusEffect));
            focusEffect.cameraMask = 0xFFFF;
            rend_efc_enable(2, REND_EFC_FOCUS, &focusEffect);
            light_init(currStageId);
            ballInfo[0].state = 9;
            ballInfo[0].bananas = 0;
            if (modeCtrl.submodeTimer > 2520)
            {
                worldInfo[0].state = 9;
                camera_set_state(0);
            }
            else
            {
                worldInfo[0].state = 6;
                camera_set_state(func_80011BE0());
                infoWork.flags &= ~INFO_FLAG_11;
            }

            f1 = func_8004964C(lbl_80250A68.unk0[lbl_80250A68.unk14]);
            if (sp38.flags & (1 << 4))
                f1 -= 30.0f;
            if (f1 > (float)modeCtrl.submodeTimer - 120.0)
                f1 = (int)((float)modeCtrl.submodeTimer - 120.0);
            else if (f1 > (float)modeCtrl.submodeTimer * 0.5)
                f1 = (int)((float)modeCtrl.submodeTimer * 0.5);
            lbl_80250A68.unk10 = f1;
            animate_anim_groups(func_80049F90(lbl_80250A68.unk10, lbl_80250A68.unk0[lbl_80250A68.unk14]));
            get_replay_header(func_80011A84(), &sp8);
            if (gamePauseStatus & (1 << 2))
                printf("/*-- pre_load_stage(%d) --*/\n", sp8.stageId);
            preload_stage_files(sp8.stageId);
        }
    }

    if (!(modeCtrl.courseFlags & (1 << 13))
     && modeCtrl.submodeTimer > 60
     && lbl_802F1BA8 == 0
     && ANY_CONTROLLER_PRESSED(PAD_BUTTON_START))
    {
        func_8000FEC8(30);
        func_8008897C(0);
        func_80088FD4(0);
    }

    if (modeCtrl.submodeTimer == 180)
    {
        preload_bg_files(BG_TYPE_JUN);
        preload_stage_files(ST_001_PLAIN);
    }
    if (modeCtrl.submodeTimer == 30)
    {
        start_screen_fade(FADE_OUT|FADE_ABOVE_SPRITES, RGBA(255, 255, 255, 0), 30);
        textbox_set_properties(0, 20, NULL);
        u_play_music(modeCtrl.submodeTimer, 2);
    }

    ballBackup = currentBallStructPtr;
    r28 = g_poolInfo.playerPool.statusList;
    r29 = &ballInfo[0];
    for (i = 0; i < g_poolInfo.playerPool.count; i++, r29++, r28++)
    {
        if (*r28 == 2)
        {
            currentBallStructPtr = r29;
            if (!(r29->flags & (1 << 9)) && (r29->ape->flags & (1 << 14)))
            {
                r29->flags &= ~0x500;
                r29->flags |= 0x200;
                u_play_sound_0(0x126);
            }
        }
    }
    currentBallStructPtr = ballBackup;

    if (--modeCtrl.submodeTimer <= 0)
    {
        infoWork.flags &= ~INFO_FLAG_11;
        func_8008897C(1);
        func_80088FD4(1);
        destroy_sprite_with_tag(SPRITE_TAG_LOGO_PLUS);
        call_bitmap_free_group(BMP_RNK);
        camera_setup_singleplayer_viewport();
        gameSubmodeRequest = SMD_ADV_DEMO_INIT;
    }
}

static int func_800119C0(void)
{
    struct ReplayHeader sp8;
    int i;

    for (i = lbl_802F02EC + 1; i < 7; i++)
    {
        get_replay_header(i, &sp8);
        if ((sp8.flags & (1 << 4)) && (sp8.flags & 1))
            break;
    }
    if (i >= 7)
    {
        for (i = 0; i < lbl_802F02EC; i++)
        {
            get_replay_header(i, &sp8);
            if ((sp8.flags & (1 << 4)) && (sp8.flags & 1))
                break;
        }
    }
    lbl_802F02EC = i;
    get_replay_header(lbl_802F02EC, &sp8);
    if (sp8.stageId == 0)
        sp8.stageId = 1;  // pointless
    return lbl_802F02EC;
}

static int func_80011A84(void)
{
    struct ReplayHeader sp8;
    int i;

    for (i = lbl_802F02F0 + 1; i < 7; i++)
    {
        if (i == lbl_802F02EC || func_8004964C(i) < 300.0)
            continue;
        get_replay_header(i, &sp8);
        if (sp8.flags & 0x83)
            break;
    }
    if (i >= 7)
    {
        for (i = 0; i <= lbl_802F02F0; i++)
        {
            if (i == lbl_802F02EC || func_8004964C(i) < 300.0)
                continue;
            get_replay_header(i, &sp8);
            if (sp8.flags & 0x83)
                break;
        }
        if (i > lbl_802F02F0)
            i = lbl_802F02EC;
    }
    lbl_802F02F0 = i;
    get_replay_header(lbl_802F02F0, &sp8);
    if (sp8.stageId == ST_000_DUMMY)
        sp8.stageId = ST_001_PLAIN;  // pointless
    lbl_802F1BC4 = 1;
    return lbl_802F02F0;
}

static int func_80011B98(void)
{
    int ret = (lbl_802F1BC4 != 0) ? lbl_802F02F0 : func_80011A84();

    lbl_802F1BC4 = 0;
    return ret;
}

void func_80011BD4(void)
{
    lbl_802F1BC4 = 0;
}

int func_80011BE0(void)
{
    return 44;
}

/**
 * Start Submode
 */

void submode_adv_start_init_func(void)
{
    if (gamePauseStatus & 0xA)
        return;
    modeCtrl.submodeTimer = 30;
    lbl_802F1BA8 = 0;
    u_play_sound_1(2);
    start_screen_fade(FADE_OUT|FADE_ABOVE_SPRITES, RGBA(0, 0, 0, 0), 32);
    textbox_set_properties(0, 20, NULL);
    textbox_set_properties(1, 20, NULL);
    textbox_set_properties(2, 20, NULL);
    textbox_set_properties(3, 20, NULL);
    u_play_music(modeCtrl.submodeTimer, 2);
    if (find_sprite_with_tag(17) != NULL
     && find_sprite_with_tag(17)->userVar == 0)
        find_sprite_with_tag(17)->userVar = 1;
    gameSubmodeRequest = SMD_ADV_START_MAIN;
}

void submode_adv_start_main_func(void)
{
    if (gamePauseStatus & 0xA)
        return;
    if (--modeCtrl.submodeTimer <= 0)
    {
        func_80011D90();
        advLogoInfo.timer = 0;
        advDemoInfo.unk8 = 0xB56;
        advDemoInfo.flags = 0;
        camera_setup_singleplayer_viewport();
        if (modeCtrl.courseFlags & 1)
        {
            gameModeRequest = MD_SEL;
            gameSubmodeRequest = SMD_SEL_NGC_INIT;
        }
        else if (modeCtrl.courseFlags & (1 << 18))
        {
            gameModeRequest = MD_OPTION;
            gameSubmodeRequest = SMD_OPTION_SELECT_INIT;
        }
        else
        {
            gameModeRequest = MD_SEL;
            gameSubmodeRequest = SMD_SEL_STAGE_INIT;
        }
    }
}

void func_80011D90(void)
{
    g_poolInfo.playerPool.statusList[0] = 2;
    g_poolInfo.playerPool.statusList[1] = 0;
    g_poolInfo.playerPool.statusList[2] = 0;
    g_poolInfo.playerPool.statusList[3] = 0;
    modeCtrl.playerCount = 1;
    modeCtrl.unk30 = 1;
    modeCtrl.gameType = GAMETYPE_MAIN_NORMAL;
    modeCtrl.unk40 = 0;
    modeCtrl.currPlayer = 0;
    currentBallStructPtr = &ballInfo[modeCtrl.currPlayer];
    camera_setup_singleplayer_viewport();
}
