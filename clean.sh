#!/bin/bash

rm -r *.box output
# decomment if you want to clean boxes too
# for i in $(vagrant box list | grep -v 'There are no installed boxes' | awk '{print $1}'); do
#     vagrant box remove $i
# done
ssh-keygen -f $HOME/.ssh/known_hosts -R "[localhost]:3333"
