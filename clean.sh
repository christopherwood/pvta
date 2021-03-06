#!/bin/bash

rm -r *.box output
for i in $(vagrant box list | awk '{print $1}'); do
    vagrant box remove $i
done
