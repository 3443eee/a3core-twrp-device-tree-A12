#
# Copyright (C) 2020 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#

ifneq ($(filter a3core, $(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)

# =========================
# Prebuilt vendor libraries
# =========================
define prebuilt-shared-lib
include $(CLEAR_VARS)
LOCAL_MODULE := $(notdir $(1))
LOCAL_SRC_FILES := vendor/lib/$(1)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib
LOCAL_UNSTRIPPED_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib
include $(BUILD_PREBUILT)
endef

PREBUILT_LIBS := \
    libtrusty.so \
    libtrustyHalHelper.so \
    libkeymaster4.so \
    libkeymaster41.so \
    libkeymaster4support.so \
    libkeymaster4_1support.so \
    libkeymaster_portable.so \
    libkeymaster_messages.so \
    libnvitem_crypto.so

$(foreach lib,$(PREBUILT_LIBS),$(eval $(call prebuilt-shared-lib,$(lib))))

# =========================
# Prebuilt vendor binaries
# =========================
define prebuilt-exec-bin
include $(CLEAR_VARS)
LOCAL_MODULE := $(notdir $(1))
LOCAL_SRC_FILES := vendor/bin/$(1)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/bin
include $(BUILD_PREBUILT)
endef

PREBUILT_BINS := \
    vold \
    wait_for_keymaster

$(foreach bin,$(PREBUILT_BINS),$(eval $(call prebuilt-exec-bin,$(bin))))

endif
