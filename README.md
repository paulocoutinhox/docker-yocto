# Yocto docker image

This repository contains docker image for Yocto Project.

## How to use

Build the docker image using:

```
make build-docker-image
```

After docker image creation you can download and build all.  

The sequence to create all is:  

```
make get-yocto
make update-yocto-metadata
make get-rpi3-yocto
make build-rpi3
```

## Problems

The error when build using Yocto is:

```
Applying patch remove_clock_check.patch
can't find file to patch at input line 5
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Index: automake-1.15.1/configure
|===================================================================
|--- automake-1.15.1.orig/configure
|+++ automake-1.15.1/configure
--------------------------
No file to patch.  Skipping patch.
```

The log of error is:

```
NOTE: Executing RunQueue Tasks
ERROR: automake-native-1.15.1-r1 do_patch: Command Error: 'quilt --quiltrc /shared/rpi3-custom/build/tmp/work/x86_64-linux/automake-native/1.15.1-r1/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
Applying patch remove_clock_check.patch
can't find file to patch at input line 5
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Index: automake-1.15.1/configure
|===================================================================
|--- automake-1.15.1.orig/configure
|+++ automake-1.15.1/configure
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch remove_clock_check.patch does not apply (enforce with -f)
ERROR: automake-native-1.15.1-r1 do_patch: Function failed: patch_do_patch
ERROR: Logfile of failure stored in: /shared/rpi3-custom/build/tmp/work/x86_64-linux/automake-native/1.15.1-r1/temp/log.do_patch.111
ERROR: Task (virtual:native:/shared/yocto/poky/meta/recipes-devtools/automake/automake_1.15.1.bb:do_patch) failed with exit code '1'
```