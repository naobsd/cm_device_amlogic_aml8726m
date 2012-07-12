#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := true

# Use the non-open-source parts, if they're present
-include vendor/amlogic/aml8726m/BoardConfigVendor.mk

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_NO_BOOTLOADER := true

#BOARD_KERNEL_BASE := 0x80008000
#BOARD_KERNEL_CMDLINE := init=/init console=ttyS0,115200 mem=512M board_ver=v2 clk81=187500k hdmitx=powermode1,unplug_powerdown rootwait logo=osd1,0x84100000,lcd,full a9_clk=600M
#BOARD_KERNEL_PAGESIZE :=
#BOARD_NAND_PAGE_SIZE :=
#BOARD_NAND_SPARE_SIZE :=

TARGET_PREBUILT_KERNEL := device/amlogic/aml8726m/kernel

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := amlogic
TARGET_BOOTLOADER_BOARD_NAME := m1ref

BOARD_EGL_CFG := device/amlogic/aml8726m/egl.cfg

USE_OPENGL_RENDERER := true

BOARD_USE_SKIA_LCDTEXT := true

TARGET_RECOVERY_INITRC := device/amlogic/aml8726m/recovery_init.rc
#TARGET_RECOVERY_PRE_COMMAND := ""
#TARGET_RECOVERY_PIXEL_FORMAT := ""
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/amlogic/aml8726m/recovery_keys.c
BOARD_UMS_LUNFILE := "/sys/devices/platform/usb_mass_storage/lun0/file"
BOARD_UMS_2ND_LUNFILE := "/sys/devices/platform/usb_mass_storage/lun1/file"
BOARD_HAS_SMALL_RECOVERY = true

#TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 335544320
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1610612736
BOARD_FLASH_BLOCK_SIZE := 4194304

#TARGET_PROVIDES_INIT_RC := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_6_X
#WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/dhd.ko"
#WIFI_DRIVER_MODULE_ARG      := "firmware_path=/etc/wifi/sdio-g-cdc-full11n-reclaim-roml-wme-idsup.bin nvram_path=/etc/wifi/nvram.txt"
#WIFI_DRIVER_MODULE_NAME     := "dhd"
#WIFI_EXT_MODULE_PATH        := ""
#WIFI_EXT_MODULE_ARG         := ""
#WIFI_EXT_MODULE_NAME        := ""

BOARD_HAVE_BLUETOOTH := true
#BOARD_HAVE_BLUETOOTH_BCM := true

TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := false

#COMMON_GLOBAL_CFLAGS += -DEGL_ALWAYS_ASYNC -DMISSING_EGL_EXTERNAL_IMAGE -DMISSING_EGL_PIXEL_FORMAT_YV12 -DMISSING_GRALLOC_BUFFERS
BOARD_USE_LEGACY_TOUCHSCREEN := true
#BOARD_USE_LEGACY_TRACKPAD := true
#BOARD_USES_AUDIO_LEGACY := true
#TARGET_USES_OLD_LIBSENSORS_HAL := true
#TARGET_SENSORS_NO_OPEN_CHECK := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/usb_mass_storage/lun%d/file"

BOARD_USES_AMLOGICPLAYER := true
TARGET_USES_OLD_HARDWARE_NAME := true
