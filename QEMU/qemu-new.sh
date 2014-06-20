#!/bin/bash

/home/cuiy/9P/qemu/qemu/x86_64-softmmu/qemu-system-x86_64 -machine q35 -boot reboot-timeout'=15000' -serial stdio -smp 2 -m 768M -net nic',model=rtl8139' -net 'user,net=172.16.0.0/255.240.0.0,host=172.16.0.2' -kernel /home/cuiy/9P/nomwait_v2.elf
