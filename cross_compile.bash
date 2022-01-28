#!/bin/bash
# Go to build_a1m manually

echo "You can pass cmake options such as -DCMAKE_BUILD_TYPE=Debug to this bash directly"

# Check we're in build directory
#if [[ "$(basename "`pwd`")" != "build_sm6125" ]]; then
#	echo "Please go to build_sm6125 directory within cbtn"
#	exit -1
#fi

ANDROID_NDK_PATH="../../android-ndk-r22-linux-x86_64"

# Check existance of Android NDK
if [[ ! -d "../${ANDROID_NDK_PATH}" ]] || [[ -z "$(ls -A ../${ANDROID_NDK_PATH})" ]]; then
	echo "$ANDROID_NDK_PATH is empty or not exist"
	exit -1
fi


# cmake with passed options
# Note that user build type will overwrite release option
cmake                                   \
    -DANDROID_NDK="${ANDROID_NDK_PATH}" \
    -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK_PATH}"/build/cmake/android.toolchain.cmake \
    -DANDROID_ABI=arm64-v8a \
    -DANDROID_PLATFORM=android-29 \
    -DANDROID_NATIVE_API_LEVEL=29 \
    -DANDROID_STL=c++_static \
    -DCMAKE_BUILD_TYPE=Release \
    "$@" ..

make -j6
#make install


#adb -s $ANDROID_DEV_ID push ark.tar.gz /data/local/tmp
echo "You may use \"adb -s \$ANDROID_DEV_ID push \$EXECUTABLE \$PATH\" to push to the device"
