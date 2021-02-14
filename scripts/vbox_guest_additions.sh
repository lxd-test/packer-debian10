#!/bin/bash

# Install packages needed for Guest Additions installation
export DEBIAN_FRONTEND=noninteractive
apt-get -o Acquire::Check-Valid-Until=false update
apt-get install build-essential dkms linux-headers-$(uname -r)

# Install Guest Additions
mount -o loop,ro ~/VBoxGuestAdditions.iso /mnt/
/mnt/VBoxLinuxAdditions.run
umount /mnt/
rm -f ~/VBoxGuestAdditions.iso

# Install init scripts and enable service
cp /opt/VBoxGuestAdditions*/init/{vboxadd,vboxadd-service} /etc/init.d/
update-rc.d vboxadd defaults
update-rc.d vboxadd-service defaults
