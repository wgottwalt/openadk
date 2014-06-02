# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

ifeq ($(ADK_TARGET_CPU_ARCH),arm)
QEMU:=			qemu-arm
endif
ifeq ($(ADK_TARGET_CPU_ARCH),mipsel)
QEMU:=			qemu-mipsel
endif
ifeq ($(ADK_TARGET_CPU_ARCH),mips64el)
QEMU:=			qemu-mipsel
endif
ifeq ($(ADK_TARGET_CPU_ARCH),mips)
QEMU:=			qemu-mips
endif
ifeq ($(ADK_TARGET_CPU_ARCH),mips64)
QEMU:=			qemu-mips
endif
ifeq ($(ADK_TARGET_CPU_ARCH),ppc)
QEMU:=			qemu-ppc
endif
ifeq ($(ADK_TARGET_CPU_ARCH),i486)
QEMU:=			qemu-i386
endif
ifeq ($(ADK_TARGET_CPU_ARCH),i586)
QEMU:=			qemu-i386
endif
ifeq ($(ADK_TARGET_CPU_ARCH),i686)
QEMU:=			qemu-i386
endif
ifeq ($(ADK_TARGET_CPU_ARCH),x86_64)
QEMU:=			qemu-x86_64
endif

