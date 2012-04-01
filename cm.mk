# Release name
PRODUCT_RELEASE_NAME := AML8726M

# Boot animation
TARGET_BOOTANIMATION_NAME := vertical-320x480

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/amlogic/aml8726m/full_aml8726m.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := aml8726m
PRODUCT_NAME := cm_aml8726m
PRODUCT_BRAND := Amlogic
PRODUCT_MODEL := AML8726M
PRODUCT_MANUFACTURER := Amlogic

#Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=aml8726m BUILD_FINGERPRINT="motorola/tervigon/wingray:4.0.4/IMM76/292727:user/release-keys" PRIVATE_BUILD_DESC="tervigon-user 4.0.4 IMM76 292727 release-keys"
