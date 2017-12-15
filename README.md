# Yocto docker image

This repository contains docker image for Yocto Project.

## How to use

The sequence to generate the image is:  

```
make get-yocto
make update-yocto-metadata
make get-rpi3-yocto
make build-rpi3
```