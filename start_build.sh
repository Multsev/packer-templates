#!/usr/bin/env bash

# $1 - PACKER_TEMPLATE
# $2 - PACKER_VAR

export PACKER_CACHE_DIR="./packer_cache"
export PACKER_LOG=1
export PACKER_LOG_PATH="./packer.log"
PACKER_BUILDER="qemu"
virtio_url="https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso"
http_proxy=""
no_proxy=""
hyperv_switch=""

# Allow VNC ports
firewall-cmd --add-port=5900-6000/tcp

# Get VirtIO drivers for qemu guest
curl -L $virtio_url -o ./_common/virtio

#Run build image
packer build  --only=$PACKER_BUILDER -var-file=$2 $1

