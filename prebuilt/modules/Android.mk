LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := prebuilt_modules_a3core
LOCAL_SRC_FILES := \
    chipone-tddi.ko \
    chipone-tddi_ss.ko \
    focaltech_ts.ko \
    ilitek-tddi.ko \
    gcore_ss.ko \
    gcore_7202h.ko \
    nt36xxx_ss.ko \
    tcs3430.ko
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib/modules
LOCAL_INSTALLED_MODULE_STEM := $(notdir $(LOCAL_SRC_FILES))
include $(BUILD_PREBUILT)
