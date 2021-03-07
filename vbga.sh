#!/bin/bash

modprobe loop
mkdir -p /tmp/vbga
mount -t iso9660 -o loop /root/VBoxGuestAdditions.iso /tmp/vbga

# Debian 10 ships with vboxguest.ko, but this is apparently not enough
# to enable the vboxsf filesystem type to mount /vagrant

# and also this shell script installer exits 2 if the vboxguest kernel
# module is already loaded, messing up a Packer install with the
# inline shell provisioner which always uses "set -e" in bash (search
# for "Exit immediately if a pipeline" in the bash manual)

bash /tmp/vbga/VBoxLinuxAdditions.run || true
