# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xz
PKG_VERSION:=		5.0.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		1b7a781fb4cf8938842279bd3e8ee852
PKG_SITES:=		http://tukaani.org/xz/

include ../rules.mk

all: $(WRKBUILD)/.installed

$(WRKBUILD)/.configured: ${WRKDIST}/.prepared
	(cd ${WRKBUILD}; ./configure --prefix=$(STAGING_HOST_DIR)/usr)
	touch $@

$(WRKBUILD)/.compiled: $(WRKBUILD)/.configured
	${MAKE} -C ${WRKBUILD}
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	${MAKE} -C ${WRKBUILD} install
	touch $@

include $(TOPDIR)/mk/tools.mk
