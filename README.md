ports
=====

FreeBSD Ports Compiler System

THIS IS NOT FINISHED.

The goal is for this to be a fully chroot/jail isolated Canadian Cross Ports Builder, however, a non-chroot/jail, 
non-install-as-root execution path will also be available in the future.

First a description of the Canadian Cross Layout and then an explaination as to why.

HOST machine - i.e. typical workstation.
BUILD machine (Jail) - This 'machine' has everything you need geared towards cross-compiling for the TARGET.
                      - This machine is a typical build environment.
                          - Clang supports various target achitectures OOTB.
                          - If your port requires GCC (USE_GCC).  This is where you must install xdev
                          from FreeBSD sources.
                      - Often, ports are required to be installed on the build system for a successful target port build
                      outcome. A Build env. machine jail is ideal for this as to meet the required dependencies needed
                      on the build machine for the target ports build, whilst leaving your HOST/workstation
                      untouched/uneffected.
                          - This can be especially useful in cases of dependencies versioning requirements.
                              - With this system, you can keep HOST libraries and executables at a working version, AND
                              If a target port requires a newer version library or binary dependency, it is installed
                              within the jail, eliminating any complications.

TARGET machine - ultimately the TARGET machine's root filesystem directory structure will be contained within the BUILD
                  jail, under /usr/obj/${TARGET}.${TARGET_ARCH}/rootfs
                  
                  HOWEVER - this is currently not implemented, at this current stage of development, everything is
                  installed into the PREFIX=/opt.
                  
                  
HOW TO RUN:

on HOST system:
cd /usr/ports/dest/program (e.g. /usr/ports/net/asterisk10)
env TARGET=mips TARGET_ARCH=mipseb make DESTDIR=/usr/jails/x_mips.mipseb/

any combination of TARGET and TARGET_ARCH are open to experimentation, with release goal being extensive major architecture support.
