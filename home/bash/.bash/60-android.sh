# ---------------------------------------------------------------------------- #
#   #ANDROID
# ---------------------------------------------------------------------------- #

android_sdk_dir="/opt/android-sdk/"

if [ -d "$android_sdk_dir" ]; then
  export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
  export ANDROID_HOME=/opt/android-sdk
  export ANDROID_SDK=/opt/android-sdk
  export ANDROID_SDK_ROOT=/opt/android-sdk
  export PATH="${PATH}:/opt/android-sdk/tools/bin/:/opt/android-sdk/tools/:/opt/android-sdk/platform-tools/"

  adbscreen() {
    if [ $# -eq 0 ]
    then
       name="screenshot.png"
    else
       name="$1.png"
    fi

    adb shell "screencap -p > /sdcard/$name"
    adb pull /sdcard/$name
    adb shell rm /sdcard/$name
    curr_dir=pwd
    echo "Saved to `pwd`/$name"
  }
fi

android_ndk_dir="/opt/android-ndk/"
if [ -d "$android_ndk_dir" ]; then
  export ANDROID_NDK=/opt/android-ndk
fi
