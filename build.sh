#!/bin/bash

case $1 in
    centos7)
    ;;
    centos8)
    ;;
    debian9)
    ;;
    debian10)
    ;;
    *)
	echo "Usage: $0 [centos7|centos8|debian9|debian10]"
	exit
	;;
esac

OS=$1

export TMPDIR=./tmp
export PACKER_LOG=debug
export PACKER_LOG_PATH=packer-${OS}.log
export PUBKEY=`cat $HOME/.ssh/id_cwood.pub`

[ -h iso ] || ln -s ../iso
rm -f $PACKER_LOG_PATH
packer build --on-error=abort ${OS}.json
