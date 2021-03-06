#!/bin/bash

case $1 in
    centos)
    ;;
    debian)
    ;;
    *)
	echo "Usage: $0 [centos|debian]"
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
packer build ${OS}1.json
