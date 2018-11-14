# stress-android README
stress is a simple package to put pressure on CPU and IO in various and
multi-threaded ways. Originally developed by Amos Waterland, the added value
here is the Android.mk file that lets you add it to Android AOSP to build.
This is not an Android Java program, but a bare command line tool. To execute
it, you need access to a shell terminal. You may need to have root access to
push it in /system/bin directory.

## Build using NDK standalone toolchain

```shell
export ANDROID_SDK_HOME=**Your SDK home**
export ANDROID_NDK_HOME=**Your NDK home**
export ANDROID_STANDALONE_TOOLCHAIN_HOME=**Your installed standalone toolchain home**
export SYSROOT=$ANDROID_STANDALONE_TOOLCHAIN_HOME/sysroot

# User specific environment and startup programs
PATH=${ANDROID_NDK_HOME}
PATH=$PATH:${ANDROID_SDK_HOME}/tools:${ANDROID_SDK_HOME}/platform-tools
PATH=$PATH:${ANDROID_STANDALONE_TOOLCHAIN_HOME}/bin:/usr/local/sbin:/usr/local/bin
PATH=$PATH:/usr/sbin:/usr/bin:/sbin:/bin
export PATH=$PATH

cd jni
aarch64-linux-android-gcc -fPIE -fPIC --sysroot=$SYSROOT -stress\" -DVERSION=\"1.0.4\" -lm stress.c -o stress
```

## INSTALL

ndk-build

adb shell mkdir /data/tmp

adb shell chmod 755 /data/tmp

adb push obj/local/armeabi/stress

## USAGE

You can see the program's usage statement by invoking it with --help.  A
typical invocation is:

 stress --cpu 8 --io 4 --vm 2 --vm-bytes 128M --timeout 10s

A user manual is available:

 info stress

The project home page is:

 http://weather.ou.edu/~apw/projects/stress/

## PATCHES

This program works really well for me, but it might not have some of the
features that you want.  If you would like, please extend the code and send 
me the patch.  Please use the context diff format.  That is: save the 
original program as stress.c.orig, then make and test your desired changes 
to stress.c, then run `diff -u stress.c.orig stress.c' to produce a context 
diff.  Enjoy the program :-)

Amos Waterland <apw@rossby.metr.ou.edu>
Norman, Oklahoma
27 Nov 2001
