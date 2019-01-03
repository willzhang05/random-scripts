#!/bin/bash
### Start VM from filepath given by first arg
qemu-system-x86_64 -enable-kvm -cpu host -nographic -drive format=raw,file=$1
