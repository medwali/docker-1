FROM ubuntu:18.04

RUN apt-get update && apt-get install -y gcc-arm-linux-gnueabihf vim git qemu-user-static debootstrap 

WORKDIR /root

RUN mkdir armchroot && debootstrap --arch=armhf --foreign bionic armchroot

RUN cp /usr/bin/qemu-arm-static armchroot/usr/bin &&\
	echo "export QEMU_LD_PREFIX=/usr/arm-linux-gnueabihf" >> .bashrc

COPY entrypoint.sh .

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
