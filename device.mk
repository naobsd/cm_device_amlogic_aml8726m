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

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/amlogic/aml8726m/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

DEVICE_PACKAGE_OVERLAYS := device/amlogic/aml8726m/overlay

#PRODUCT_PACKAGES := \

PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel \
	device/amlogic/aml8726m/init.amlogic.rc:root/init.amlogic.rc \
	device/amlogic/aml8726m/init.amlogic.usb.rc:root/init.amlogic.usb.rc \
	device/amlogic/aml8726m/ueventd.amlogic.rc:root/ueventd.amlogic.rc \
	device/amlogic/aml8726m/etc/vold.fstab:system/etc/vold.fstab \
	device/amlogic/aml8726m/etc/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Bluetooth configuration files
#PRODUCT_COPY_FILES += \
#	system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# Wifi
PRODUCT_PROPERTY_OVERRIDES := \
	wifi.interface=eth0 \
	wifi.supplicant_scan_interval=15

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage

# Live Wallpapers
PRODUCT_PACKAGES += \
	LiveWallpapers \
	LiveWallpapersPicker \
	VisualizationWallpapers \
	librs_jni

# Key maps
PRODUCT_COPY_FILES += \
	device/amlogic/aml8726m/prebuilt/adc_keypad.kl:system/usr/keylayout/adc_keypad.kl \
	device/amlogic/aml8726m/prebuilt/aml_keypad.kl:system/usr/keylayout/aml_keypad.kl \
	device/amlogic/aml8726m/prebuilt/jogball.kl:system/usr/keylayout/jogball.kl

# Input device calibration files
PRODUCT_COPY_FILES += \
	device/amlogic/aml8726m/prebuilt/Goodix_TouchScreen_of_Guitar.idc:system/usr/idc/Goodix_TouchScreen_of_Guitar.idc \
	device/amlogic/aml8726m/prebuilt/Touch_Screen.idc:system/usr/idc/Touch_Screen.idc \
	device/amlogic/aml8726m/prebuilt/eGalax_Touch_Screen.idc:system/usr/idc/eGalax_Touch_Screen.idc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dexopt-data-only=1 \
	hwui.render_dirty_regions=false \
	qemu.sf.lcd_density=160 \
	ro.vold.switchablepair=/mnt/sdcard,/mnt/nand

# AmlogicPlayer
PRODUCT_PROPERTY_OVERRIDES += \
	media.amplayer.enable-acodecs=asf,wav,aac,mp3,m4a,ape,flac,alac \
	media.amplayer.enable=true \
	media.amplayer.thumbnail=true \
	media.amsuperplayer.defplayer=PV_PLAYER \
	media.amsuperplayer.enable=true \
	media.amsuperplayer.m4aplayer=STAGEFRIGHT_PLAYER

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

# Filesystem management tools
#PRODUCT_PACKAGES += \
#	make_ext4fs \
#	setup_fs

# for bugmailer
PRODUCT_PACKAGES += send_bug
PRODUCT_COPY_FILES += \
	system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
	system/extras/bugmailer/send_bug:system/bin/send_bug

$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/amlogic/aml8726m/device-vendor.mk)
