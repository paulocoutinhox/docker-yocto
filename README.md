# Yocto docker image

This repository contains docker image for Yocto Project.

## How to use

First of all, edit Dockerfile and put on enviroment variable TZ your host machine timezone, to avoid problems with system clock check of automake.  

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
checking whether build environment is sane...  

configure: error: newly created file is older than distributed files!  

Check your system clock
```

The log of error is:

```
DEBUG: Executing shell function autotools_preconfigure
DEBUG: Shell function autotools_preconfigure finished
DEBUG: Executing python function autotools_aclocals
DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
DEBUG: Python function autotools_aclocals finished
DEBUG: Executing shell function do_configure
NOTE: Running ../automake-1.15.1/configure  --build=x86_64-linux 		  --host=x86_64-linux 		  --target=x86_64-linux 		  --prefix=/shared/rpi3-custom/build/tmp/work/x86_64-linux/automake-native/1.15.1-r0/recipe-sysroot-native/usr 		  --exec_prefix=/shared/rpi3-custom/build/tmp/work/x86_64-linux/automake-native/1.15.1-r0/recipe-sysroot-native/usr 		  --bindir=/shared/rpi3-custom/build/tmp/work/x86_64-linux/automake-native/1.15.1-r0/recipe-sysroot-native/usr/bin 		  --sbindir=/shared/rpi3-custom/build/tmp/work/x86_64-linux/automake-native/1.15.1-r0/recipe-sysroot-native/usr/sbin 		  --libexecdir=/shared/rpi3-custom/build/tmp/work/x86_64-linux/automake-native/1.15.1-r0/recipe-sysroot-native/usr/libexec 		  --datadir=/shared/rpi3-custom/build/tmp/work/x86_64-linux/automake-native/1.15.1-r0/recipe-sysroot-native/usr/share 		  --sysconfdir=/shared/rpi3-custom/build/tmp/work/x86_64-linux/automake-native/1.15.1-r0/recipe-sysroot-native/etc 		  --sharedstatedir=/shared/rpi3-custom/build/tmp/work/x86_64-linux/automake-native/1.15.1-r0/recipe-sysroot-native/com 		  --localstatedir=/shared/rpi3-custom/build/tmp/work/x86_64-linux/automake-native/1.15.1-r0/recipe-sysroot-native/var 		  --libdir=/shared/rpi3-custom/build/tmp/work/x86_64-linux/automake-native/1.15.1-r0/recipe-sysroot-native/usr/lib 		  --includedir=/shared/rpi3-custom/build/tmp/work/x86_64-linux/automake-native/1.15.1-r0/recipe-sysroot-native/usr/include 		  --oldincludedir=/shared/rpi3-custom/build/tmp/work/x86_64-linux/automake-native/1.15.1-r0/recipe-sysroot-native/usr/include 		  --infodir=/shared/rpi3-custom/build/tmp/work/x86_64-linux/automake-native/1.15.1-r0/recipe-sysroot-native/usr/share/info 		  --mandir=/shared/rpi3-custom/build/tmp/work/x86_64-linux/automake-native/1.15.1-r0/recipe-sysroot-native/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		    --disable-static  
configure: WARNING: unrecognized options: --disable-dependency-tracking, --disable-static
checking whether make supports nested variables... yes
checking build system type... x86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
checking for a BSD-compatible install... /shared/rpi3-custom/build/tmp/hosttools/install -c
checking whether build environment is sane... configure: error: newly created file is older than distributed files!
Check your system clock
NOTE: The following config.log files may provide further information.
NOTE: /shared/rpi3-custom/build/tmp/work/x86_64-linux/automake-native/1.15.1-r0/build/config.log
ERROR: configure failed
WARNING: exit code 1 from a shell command.
ERROR: Function failed: do_configure (log file is located at /shared/rpi3-custom/build/tmp/work/x86_64-linux/automake-native/1.15.1-r0/temp/log.do_configure.12548)
```