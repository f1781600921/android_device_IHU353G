#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from IHU353G device
$(call inherit-product, device/ecarx/IHU353G/device.mk)

PRODUCT_DEVICE := IHU353G
PRODUCT_NAME := omni_IHU353G
PRODUCT_BRAND := ecarx
PRODUCT_MODEL := IHU353G
PRODUCT_MANUFACTURER := ecarx

PRODUCT_GMS_CLIENTID_BASE := android-ecarx

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="IHU353G-user 9 PQ2A.190405.003 75 dev-keys"

BUILD_FINGERPRINT := ecarx/IHU353G/IHU353G:9/PQ2A.190405.003/75:user/dev-keys
