#
# Copyright (C) 2016 Jonathan Jason Dennis (theonejohnnyd@gmail.com)
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

ifeq ($(I_AM_METICULUS), true)
# Use my custom build ninja that prints to screen sequentially
# so you can see whats going on.
# Resolve depenancy issue: sudo apt-get install libc++-dev
# $(shell echo "Using Meticulus's Ninja" >&2)
# $(shell cp -f $(LOCAL_PATH)/prebuilt/ninja prebuilts/ninja/linux-x86/ninja)

# Meticulus init rc
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/rootdir/init.meticulus.rc:root/init.meticulus.rc

# Meticulus recovery init rc
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/recovery/init.recovery.meticulus.rc:root/init.recovery.meticulus.rc

# Meticulus recovery checks
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/stock-check.sh:install/bin/stock-check.sh \
	$(LOCAL_PATH)/recovery/finalize.sh:install/bin/finalize.sh \
	$(LOCAL_PATH)/recovery/data-formatter.sh:install/bin/data-formatter.sh


# Meticulus Settings Integration
PRODUCT_PACKAGES += \
    CodinalteParts \
    volumeinput

# Meticulus Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/huawei/hi6250

ifeq ($(TARGET_PRODUCT), omni_hi6250)
# TWRP EMUI4.X Support
TW_EMUI4_SUPPORT := true

# Meticulus Recovery Extras
$(call inherit-product, vendor/huawei/hi6250/meticulus_recovery.mk)

endif ## USER eq meticulus
else
$(shell cd prebuilts/build-tools && git checkout linux-x86/bin/ninja)
endif
