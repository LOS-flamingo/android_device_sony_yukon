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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# qcom common
$(call inherit-product, device/sony/qcom-common/qcom-common.mk)

COMMON_PATH := device/sony/yukon

DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \

# Recovery
PRODUCT_PACKAGES += \
    extract_elf_ramdisk

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio.primary.msm8226 \
    audio.r_submix.default \
    audio.usb.default \
    audio_policy.msm8226

PRODUCT_PACKAGES += \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    tinymix

# Display
PRODUCT_PACKAGES += \
    hwcomposer.msm8226 \
    gralloc.msm8226 \
    copybit.msm8226 \
    memtrack.msm8226

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck

# FM Radio
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh

# GPS
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/gps/flp.conf:system/etc/flp.conf \
    $(COMMON_PATH)/gps/gps.conf:system/etc/gps.conf \
    $(COMMON_PATH)/gps/izat.conf:system/etc/izat.conf \
    $(COMMON_PATH)/gps/sap.conf:system/etc/sap.conf

PRODUCT_PACKAGES += \
    com.qualcomm.location \
    gps.msm8226

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/sec_config:system/etc/sec_config

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8226

# NFC packages
PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    Tag \
    com.android.nfc_extras \
    nfc_nci.msm8226

# NFCEE access control
NFCEE_ACCESS_PATH := $(COMMON_PATH)/rootdir/system/etc/nfcee_access.xml

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/nfcee_access.xml:system/etc/nfcee_access.xml

# Time
PRODUCT_PACKAGES += \
    libtime_genoff

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# WiFi
PRODUCT_PACKAGES += \
    mac-update \
    wcnss_service

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(COMMON_PATH)/rootdir/system/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh \

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.bt.hci_transport=smd

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.izat.premium_enabled=1 \
    ro.qc.sdk.izat.service_mask=0x0 \
    persist.gps.qc_nlp_in_use=1 \
    persist.loc.nlp_name=com.qualcomm.services.location \
    ro.gps.agps_provider=1

# SIM Props
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1 \

# msm8226 common
$(call inherit-product, vendor/sony/msm8226-common/msm8226-common-vendor.mk)

