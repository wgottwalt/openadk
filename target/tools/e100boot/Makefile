# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		e100boot
PKG_VERSION:=		0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		11fd53e7824dc550e4cffbc4cd114c3e
PKG_SITES:=		http://download.tuxfamily.org/crisos/repository/source/
DISTFILES:=		${PKG_NAME}.tar.bz2
WRKDIST=                ${WRKDIR}/${PKG_NAME}

include ../rules.mk

all: $(BIN_DIR)/etrax100boot

$(WRKBUILD)/.compiled: ${WRKDIST}/.prepared
	$(MAKE) -C $(WRKBUILD)
	touch $@

$(BIN_DIR)/etrax100boot: $(WRKBUILD)/.compiled
	$(INSTALL_BIN) $(WRKBUILD)/sbl/e100boot.stripped $(BIN_DIR)/etrax100boot

include $(TOPDIR)/mk/tools.mk
