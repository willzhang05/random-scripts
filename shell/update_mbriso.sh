#!/bin/bash
### Create custom Arch ISO
xorriso -as mkisofs \
	-o auto.iso \
	-isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin \
	-c isolinux/boot.cat \
	-b isolinux/isolinux.bin \
	-no-emul-boot -boot-load-size 4 -boot-info-table \
	/root/custom

