#!/bin/sh

mount --bind  /proc /root/armchroot/proc &&\
	mount --bind /sys /root/armchroot/sys &&\
	mount --bind /dev /root/armchroot/dev &&\
	mount --bind /dev/pts /root/armchroot/dev/pts

/etc/init.d/binfmt-support start

chroot /root/armchroot /debootstrap/debootstrap --second-stage

exec /bin/bash
