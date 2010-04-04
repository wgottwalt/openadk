# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc

include ${TOPDIR}/mk/buildhlp.mk

$(WRKBUILD)/.headers: 
	touch $@

$(WRKBUILD)/.configured:
	touch $@

$(WRKBUILD)/.compiled:
	touch $@

$(WRKBUILD)/.installed:
	touch $@

include ${TOPDIR}/mk/toolchain.mk
