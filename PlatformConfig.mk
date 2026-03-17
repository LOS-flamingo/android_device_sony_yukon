# Copyright (C) 2014 The CyanogenMod Project
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

# inherit from qcom-common
include device/sony/qcom-common/BoardConfigCommon.mk

# inherit from Sony common
include device/sony/common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH += device/sony/yukon/include

# Platform
TARGET_BOOTLOADER_BOARD_NAME := MSM8226
TARGET_BOARD_PLATFORM := msm8226
BOARD_VENDOR_PLATFORM := yukon

# Architecture
# Purposefully krait due to lack of cortex-a7 optimizations in clang
TARGET_CPU_VARIANT := krait

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64

# Kernel information
BOARD_KERNEL_BASE     := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE  := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ignore_loglevel loglevel=8 initcall_debug lk2nd.pass-ramoops ramoops.mem_address=0x2ff80000 ramoops.mem_size=0x80000 ramoops.record_size=0x2000 ramoops.console_size=0x40000 ramoops.ftrace_size=0
BOARD_MKBOOTIMG_ARGS  := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000
BOARD_KERNEL_SEPARATED_DT := true
BOARD_CUSTOM_BOOTIMG_MK := device/sony/yukon/boot/custombootimg.mk

# Qualcomm
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QC_TIME_SERVICES := true
TARGET_USES_QCOM_BSP := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
TARGET_QCOM_AUDIO_VARIANT := caf
TARGET_QCOM_DISPLAY_VARIANT := caf-new
TARGET_QCOM_MEDIA_VARIANT := caf-new

# Audio
BOARD_USES_ALSA_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true

# Camera
BOARD_CAMERA_HAVE_ISO := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Dumpstate
BOARD_LIB_DUMPSTATE := libdumpstate.sony

# GPS
TARGET_PROVIDES_GPS_LOC_API := true

# Graphics
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

# NFC
BOARD_NFC_CHIPSET := pn547
BOARD_NFC_HAL_SUFFIX := $(TARGET_BOARD_PLATFORM)

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"

BOARD_USE_SONY_MACUPDATE := true

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072

# Partition information
BOARD_VOLD_MAX_PARTITIONS := 26

BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
TARGET_USERIMAGES_USE_EXT4 := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_NO_SELECT_BUTTON := true
