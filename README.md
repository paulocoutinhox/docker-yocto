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
 automake-native-1.15.1-r1 do_fetch: Fetcher failure: Unable to find file file://remove_clock_check.patch anywhere. The paths that were searched were:
```

The log of error is:

```
NOTE: Executing RunQueue Tasks
WARNING: automake-native-1.15.1-r1 do_fetch: Failed to fetch URL file://remove_clock_check.patch, attempting MIRRORS if available
ERROR: automake-native-1.15.1-r1 do_fetch: Fetcher failure: Unable to find file file://remove_clock_check.patch anywhere. The paths that were searched were:
    /shared/yocto/poky/meta/recipes-devtools/automake/automake-1.15.1/poky
    /shared/yocto/poky/meta/recipes-devtools/automake/automake/poky
    /shared/yocto/poky/meta/recipes-devtools/automake/files/poky
    /shared/yocto/poky/meta/recipes-devtools/automake/automake-1.15.1/
    /shared/yocto/poky/meta/recipes-devtools/automake/automake/
    /shared/yocto/poky/meta/recipes-devtools/automake/files/
    /shared/yocto/poky/meta/recipes-devtools/automake/automake-1.15.1/x86-64
    /shared/yocto/poky/meta/recipes-devtools/automake/automake/x86-64
    /shared/yocto/poky/meta/recipes-devtools/automake/files/x86-64
    /shared/yocto/poky/meta/recipes-devtools/automake/automake-1.15.1/
    /shared/yocto/poky/meta/recipes-devtools/automake/automake/
    /shared/yocto/poky/meta/recipes-devtools/automake/files/
    /shared/rpi3-custom/build/downloads
ERROR: automake-native-1.15.1-r1 do_fetch: Fetcher failure for URL: 'file://remove_clock_check.patch'. Unable to fetch URL from any source.
ERROR: automake-native-1.15.1-r1 do_fetch: Function failed: base_do_fetch
ERROR: Logfile of failure stored in: /shared/rpi3-custom/build/tmp/work/x86_64-linux/automake-native/1.15.1-r1/temp/log.do_fetch.690
ERROR: Task (virtual:native:/shared/yocto/poky/meta/recipes-devtools/automake/automake_1.15.1.bb:do_fetch) failed with exit code '1'
```