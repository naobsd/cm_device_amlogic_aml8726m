#include <linux/input.h>

#include "recovery_ui.h"
#include "common.h"
#include "extendedcommands.h"


int device_toggle_display(volatile char* key_pressed, int key_code) {
    return 0;
}

int device_handle_key(int key_code, int visible) {
    if (visible) {
        switch (key_code) {
            case KEY_LEFT:
            case KEY_DOWN:
            case KEY_PAGEDOWN:
            case KEY_VOLUMEDOWN:
            case KEY_LEFTMETA:
            case KEY_MENU:
                return HIGHLIGHT_DOWN;

            case KEY_UP:
            case KEY_PAGEUP:
            case KEY_RIGHT:
            case KEY_VOLUMEUP:
                return HIGHLIGHT_UP;

            case KEY_KPENTER:
            case KEY_RIGHTCTRL:
            case KEY_HOME:
            case KEY_POWER:
            case BTN_LEFT:
                return SELECT_ITEM;
            
            case KEY_TAB:
            case KEY_BACK:
            case KEY_SEARCH:
            case BTN_RIGHT:
                if (ui_menu_level > 0) {
                    return GO_BACK;
                }
        }
    }

    return NO_ACTION;
}
