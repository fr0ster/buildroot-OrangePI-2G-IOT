if test "${boot_device}" = "mmc"; then

	setenv rootdev "/dev/mmcblk0p2"
	setenv rootfstype "ext4"

	setenv bootargs "root=${rootdev} rootwait rootfstype=${rootfstype} console=ttyS0,921600 kgdboc=ttyS0,921600 panic=10 consoleblank=0 earlyprintk"

	fatload mmc 0:1 ${kernel_addr} zImage
	fatload mmc 0:1 ${modem_addr} modem.bin
else
	echo "NAND boot is not implemented yet"
fi

# modem init is mandatory according to u-boot sources
mdcom_loadm ${modem_addr}
mdcom_check 1

bootz ${kernel_addr}
