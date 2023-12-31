# Copyright (C) 2022 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# Attestation
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    aaudio.mmap_policy=1 \
    persist.vendor.audio.delta.refresh=true \
    persist.vendor.audio.misound.disable=true \
    persist.vendor.audio.ring.filter.mask=0 \
    ro.audio.monitorRotation=true \
    ro.config.vc_call_vol_steps=11 \
    ro.vendor.audio.enhance.support=false \
    ro.vendor.audio.gain.support=true \
    ro.vendor.audio.karaok.support=true \
    ro.vendor.audio.ns.support=false \
    ro.vendor.audio.scenario.support=true \
    ro.vendor.audio.sdk.fluencetype=fluence \
    ro.vendor.audio.soundfx.type=mi \
    ro.vendor.audio.soundfx.usb=true \
    ro.vendor.audio.us.proximity=true \
    ro.vendor.audio.us.type=mius \
    ro.vendor.audio.zoom.support=true \
    ro.vendor.audio.zoom.type=1 \
    vendor.audio.adm.buffering.ms=6 \
    vendor.audio.feature.dynamic_ecns.enable=false \
    vendor.audio.feature.spkr_prot.enable=false \
    vendor.audio.hal.output.suspend.supported=false \
    vendor.audio.offload.track.enable=false \
    vendor.audio.spkcal.copy.inhal=true \
    vendor.audio.usb.disable.sidetone=true

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth.audio@2.0-impl \
    audio.bluetooth.default \
    com.dsi.ant@1.0.vendor \
    com.qualcomm.qti.bluetooth_audio@1.0.vendor \
    libbluetooth_audio_session \
    vendor.qti.hardware.bluetooth_audio@2.1.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    vendor.qti.hardware.btconfigstore@2.0.vendor \
    vendor.qti.hardware.fm@1.0.vendor

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.fflag.override.settings_bluetooth_hearing_aid=true \
    persist.vendor.qcom.bluetooth.a2dp_mcast_test.enabled=false \
    persist.vendor.qcom.bluetooth.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac-aptxadaptiver2 \
    persist.vendor.qcom.bluetooth.aac_frm_ctl.enabled=true \
    persist.vendor.qcom.bluetooth.aac_vbr_ctl.enabled=true \
    persist.vendor.qcom.bluetooth.aptxadaptiver2_1_support=false \
    persist.vendor.qcom.bluetooth.enable.splita2dp=true \
    persist.vendor.qcom.bluetooth.scram.enabled=false \
    persist.vendor.qcom.bluetooth.soc=hastings \
    persist.vendor.qcom.bluetooth.twsp_state.enabled=false \
    ro.vendor.bluetooth.wipower=false \
    vendor.qcom.bluetooth.soc=hastings

# Boot
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    camera.disable_zsl_mode=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    libcamera2ndk_vendor \
    libstdc++.vendor \
    vendor.qti.hardware.camera.device@1.0.vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor

# Charging
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.charger.enable_suspend=1

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.cp.fcc_main_ua=400000 \
    persist.vendor.cp.taper_term_mv=7000 \
    persist.vendor.cp.qc3p5_vfloat_offset_uv=110000 \
    persist.vendor.pps.disallowed=1 \
    persist.vendor.hvdcp_opti.disallowed=1

# Config Store
PRODUCT_PACKAGES += \
    disable_configstore

# Consumer IR
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml

PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.display.paneltype=2 \
    ro.vendor.display.sensortype=2 \
    vendor.display.enable_async_powermode=0 \
    vendor.display.qdcm.mode_combine=1 \
    vendor.display.use_layer_ext=0 \
    vendor.display.use_smooth_motion=0

PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.set_idle_timer_ms=4000 \
    ro.surface_flinger.set_touch_timer_ms=4000 \
    ro.surface_flinger.set_display_power_timer_ms=1000 \
    ro.surface_flinger.use_content_detection_for_refresh_rate=true

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.defer_fps_frame_count=2

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/display/,$(TARGET_COPY_OUT_VENDOR)/etc)

# DPM
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.dpmhalservice.enable=1

# Doze
PRODUCT_PACKAGES += \
    ParanoidDoze

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.sensor.pickup=xiaomi.sensor.pickup

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

PRODUCT_PACKAGES += \
    android.hardware.drm@1.4-service.clearkey

# Fastboot
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# FRP
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

# GPS
LOC_HIDL_VERSION = 4.0

# GSI
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Gatekeeper
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.gatekeeper.disable_spu=true

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl-qti \
    android.hardware.health@2.1-service

# Incremental FS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.incremental.enable=1

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom

PRODUCT_PACKAGES += \
    fstab.qcom \
    init.xiaomi.rc \
    init.mi.usb.sh \
    init.qti.dcvs.sh \
    init.target.rc \
    ueventd.xiaomi.rc

# Keymaster
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.allow_encrypt_override=true \
    ro.crypto.volume.filenames_mode="aes-256-cts" \
    ro.hardware.keystore_desede=true

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Overlays
PRODUCT_PACKAGES += \
    AOSPAPsycheFrameworks \
    PsycheFrameworks \
    PsycheSettings \
    PsycheSystemUI \
    FrameworksResTarget \
    WifiResTarget

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Platform
TARGET_BOARD_PLATFORM := kona

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# QTI
TARGET_COMMON_QTI_COMPONENTS := all

# Sensors
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.sensors.allow_non_default_discovery=true \
    persist.vendor.sensors.sync_request=true

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.vendor.sensors.enable.mag_filter=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service \
    libsensorndkbridge

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 30

# SOC Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.soc.manufacturer=QTI \
    ro.soc.model=SM8250

# Subsystem silent restart
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.ssr.restart_level=ALL_ENABLE

# Update Engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# Vendor Service Manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Vendor
$(call inherit-product, vendor/xiaomi/psyche/psyche-vendor.mk)

# Verified Boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# VNDK
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0.vendor \
    android.hardware.drm@1.4.vendor \
    android.hardware.gatekeeper@1.0.vendor \
    android.hardware.keymaster@4.1.vendor \
    android.hardware.neuralnetworks@1.3.vendor \
    android.hardware.radio.config@1.2.vendor \
    android.hardware.radio.deprecated@1.0.vendor \
    android.hardware.radio@1.5.vendor \
    android.hardware.secure_element@1.2.vendor \
    android.system.net.netd@1.1.vendor

# WLAN
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wlan/WCNSS_qcom_cfg_qca6390.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini

# WFD
PRODUCT_PACKAGES += \
    libwfdaac_vendor

