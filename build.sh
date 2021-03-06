#!/bin/bash

case $1 in
    centos)
    ;;
    debian9)
    ;;
    *)
	echo "Usage: $0 [centos|debian9]"
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
packer build ${OS}.json
