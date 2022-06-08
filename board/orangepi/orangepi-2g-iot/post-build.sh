#!/bin/sh
# post-build.sh for OrangePi taken from CubieBoard's post-build.sh
# 2013, Carlo Caione <carlo.caione@gmail.com>

BOARD_DIR="$(dirname $0)"
MKIMAGE=$HOST_DIR/usr/bin/mkimage
BOOT_CMD=$BOARD_DIR/boot.cmd
BOOT_CMD_H=$BINARIES_DIR/boot.scr

git clone https://github.com/orangepi-xunlong/OrangePiRDA_external.git /tmp/OrangePiRDA_external
cp /tmp/OrangePiRDA_external/chips/RDA/bootarg/modem.bin $BINARIES_DIR
rm -fR /tmp/OrangePiRDA_external

# U-Boot script
$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
