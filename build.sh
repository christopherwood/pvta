#!/bin/bash

export TMPDIR=./tmp
export PACKER_LOG=1
export PACKER_LOG_PATH=packer.log
export PUBKEY=`cat $HOME/.ssh/id_cwood.pub`

ln -s ../iso

packer build debian1.json
