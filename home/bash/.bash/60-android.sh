# ---------------------------------------------------------------------------- #
#   #ANDROID
# ---------------------------------------------------------------------------- #

android_sdk_dir="/opt/android-sdk/"

if [ -d "$android_sdk_dir" ]; then
  export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
  export ANDROID_HOME=/opt/android-sdk
  export ANDROID_SDK=/opt/android-sdk
  export PATH="${PATH}:/opt/android-sdk/tools/:/opt/android-sdk/platform-tools/"
fi

android_ndk_dir="/opt/android-ndk/"
if [ -d "$android_ndk_dir" ]; then
  export ANDROID_NDK=/opt/android-ndk
fi
