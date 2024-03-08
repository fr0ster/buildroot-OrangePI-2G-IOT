## Important info

It's old repo and it's never will be added into original repo because differntces between this repo and original is enormous.
So I renamed this repo and recomend use Vagrant or other virtual machine with Ubintu 16.04 for building of images.
I added my Vagrant config for it.

## How build
```
$ make orangepi_2g-iot_defconfig
$ make
$ sudo dd if=./output/images/sdcard.img of=/dev/sdX bs=1M && sync
```
If you prefere docker you can use docker images for building
```
docker run -v $(pwd)/images:/workdir --rm -it luckycatalex/dev_environment_light:amd64-ubuntu-16.04 bash -c 'sudo apt install build-essential cpio unzip bc -y && git clone https://github.com/fr0ster/buildroot-OrangePI-2G-IOT.git && cd buildroot-OrangePI-2G-IOT && make orangepi_2g-iot_defconfig && make && cd output/images && tar czf /workdir/image.tar.gz *'
```

## Original README
Buildroot is a simple, efficient and easy-to-use tool to generate embedded
Linux systems through cross-compilation.

The documentation can be found in docs/manual. You can generate a text
document with 'make manual-text' and read output/docs/manual/manual.text.
Online documentation can be found at http://buildroot.org/docs.html

To build and use the buildroot stuff, do the following:

1) run 'make menuconfig'
2) select the target architecture and the packages you wish to compile
3) run 'make'
4) wait while it compiles
5) find the kernel, bootloader, root filesystem, etc. in output/images

You do not need to be root to build or run buildroot.  Have fun!

Buildroot comes with a basic configuration for a number of boards. Run
'make list-defconfigs' to view the list of provided configurations.

Please feed suggestions, bug reports, insults, and bribes back to the
buildroot mailing list: buildroot@buildroot.org
You can also find us on #buildroot on Freenode IRC.

If you would like to contribute patches, please read
https://buildroot.org/manual.html#submitting-patches
