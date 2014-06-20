GSOC plan9 code

original image, based on which we create our own amd64 kernel
http://plan9.bell-labs.com/wiki/plan9/download/

To run our amd64 kernel

1. install the iso

2. mkdir -p /amd64/bin/^(ape auth aux bitsy dial disk fossil fs games ip ndb oventi pub replica upas usb venti aux/jot aux/style ip/httpd) /amd64/lib/ape

3. copy 9K to /sys/src

4. copy PART1 to kinds of directories

5. cd /sys/src/cmd; for(a in 6a 6c 6l)@{cd $a && mk clean && mk install}

6. copy PART2 to kinds of directories

7. cd /sys/src; objtype=amd64 mk install

8. mk clean in /sys/src && rm /amd64/lib/\*.a

9. copy AMD64\_compiler into /usr/glenda

10. cd 6a && mk install;  cd 6c && mk install ; cd 6l && mk install; cd cc && mk install

11. cd /sys/src/ && objtype=amd64 mk install

12. copy PART3 to kinds of directories

13. cd /sys/src/9k/k10/ && mk install  it makes 9k10cpu and 9k10cpu.elf for use
9k10cpu is plan9 bootable, while 9k10cpu.elf is used for QEMU
This kernel is with MCS and monitor and mwait

There is a bug when running on QEMU, not sure it is caused by QEMU or not. 
When using more than 1 cpu, registers dump

14. PART4 forces the code return to normal MCS, when runing the kernel, it is OK for up to 4 cpus in
QEMU and KVM, but some problems happened when using 8 cores. 

Note, there is a bug for QEMU which prevents the instance takes root from remote file server 
and auth server, please use the mainstream code,  git clone git://git.qemu-project.org/qemu.git

some useful docs for setting up auth+fs+cpu server,
http://wildflower.diablonet.net/~scaron/p9setup.html
http://mirror.9grid.fr/mirror.9grid.fr/plan9-cpu-auth-server-howto.html
and plan9 wiki, of course!

