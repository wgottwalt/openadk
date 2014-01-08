# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

ifeq ($(CPU_ARCH),arm)
QEMU:=			qemu-arm
endif
ifeq ($(CPU_ARCH),mipsel)
QEMU:=			qemu-mipsel
endif
ifeq ($(CPU_ARCH),mips64el)
QEMU:=			qemu-mipsel
endif
ifeq ($(CPU_ARCH),mips)
QEMU:=			qemu-mips
endif
ifeq ($(CPU_ARCH),mips64)
QEMU:=			qemu-mips
endif
ifeq ($(CPU_ARCH),ppc)
QEMU:=			qemu-ppc
endif
ifeq ($(CPU_ARCH),i486)
QEMU:=			qemu-i386
endif
ifeq ($(CPU_ARCH),i586)
QEMU:=			qemu-i386
endif
ifeq ($(CPU_ARCH),i686)
QEMU:=			qemu-i386
endif
ifeq ($(CPU_ARCH),x86_64)
QEMU:=			qemu-x86_64
endif

