#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/ecarx/IHU353G

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := generic

TARGET_USES_UEFI := true
TARGET_USES_64_BIT_BINDER := true

# Android Verified Boot
BOARD_AVB_ENABLE := false
BOARD_BUILD_DISABLED_VBMETAIMAGE := true

# Assert
TARGET_OTA_ASSERT_DEVICE := IHU519G

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := IHU353G
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 480

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive buildvariant=user
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x14f88000
BOARD_KERNEL_TAGS_OFFSET := 0x13f88000
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_CONFIG := IHU353G_defconfig
TARGET_KERNEL_SOURCE := kernel/ecarx/IHU353G

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_KERNEL_SEPARATED_DTBO := 
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 8589934592
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEMIMAGE_PARTITION_TYPE := ext4

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor

# Platform
TARGET_BOARD_PLATFORM := ecarxp

# File systems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Fstab
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# Recovery
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0
TW_DEVICE_VERSION := IHU519G by KB

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_INPUT_BLACKLIST := "hbtp_vm"
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
TW_CUSTOM_BATTERY_PATH := /sys/devices/platform/bat_gm30/power_supply/battery
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 128

TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_FUSE_NTFS := true
TW_IGNORE_MISC_WIPE_DATA := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TARGET_RECOVERY_INITRC := $(DEVICE_PATH)/recovery/root/init.recovery.ecarxp.rc
TARGET_USES_MKE2FS := true
TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_SUPERSU := true
TW_USE_TOOLBOX := true
TW_NO_SCREEN_BLANK := true
TW_HAS_EDL_MODE := true
TW_INCLUDE_FASTBOOTD := true
TW_INCLUDE_APEX := true
TW_NEW_ION_HEAP := true
TW_SCREEN_BLANK_ON_BOOT := true

# zh_CN
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := "zh_CN"

# Debugging
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD    := true

# PBRP specific flags
PB_DISABLE_DEFAULT_DM_VERITY := true
PB_DISABLE_DEFAULT_TREBLE_COMP := true

################### ############################################
# MANDATORY FLAGS # These flags HAVE TO be set/changed by you! #
################### ############################################

# Device codename
# Default (if not set): N/A
SHRP_DEVICE_CODE := IHU353G

# Path of your SHRP device tree
# Replace <device-brand> with the device brand name
# (SHRP_DEVICE_CODE will expand to the above variable so check if that is correct)
SHRP_PATH := device/ecarx/$(SHRP_DEVICE_CODE)

# Maintainer name
# Default (if not set): N/A
SHRP_MAINTAINER := KB

# Recovery Type (for "About" section only)
# Default (if not set): N/A
SHRP_REC_TYPE := Treble

# Device Type (for "About" section only)
# Default (if not set): N/A
SHRP_DEVICE_TYPE := A_Only

# Your device's recovery path, dont use blindly
# Default (if not set): N/A
SHRP_REC := /dev/block/platform/bootdevice/by-name/recovery

# Use this flag only if SHRP_REC is set
# Default (if not set): N/A
SHRP_HAS_RECOVERY_PARTITION := true

################### ################################################################################
# IMPORTANT FLAGS # These are usually good to check - at least if the defaults are what you expect #
################### ################################################################################

# Flashlight: (0 = disable, 1 = enable)
# Default (if not set): 0
SHRP_FLASH := 1

# Do not include the SHRP theming system
# Useful to save space for devices with a smaller recovery partition
# Default (if not set) is full theming support
SHRP_LITE := true

SHRP_SKIP_DEFAULT_ADDON_1 := true
SHRP_SKIP_DEFAULT_ADDON_2 := true
SHRP_SKIP_DEFAULT_ADDON_3 := true
SHRP_SKIP_DEFAULT_ADDON_4 := true
INC_IN_REC_MAGISK := true
