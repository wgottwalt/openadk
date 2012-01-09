# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		lzma
PKG_VERSION:=		4.65
PKG_RELEASE:=		1
PKG_MD5SUM:=		434e51a018b4c8ef377bf81520a53af0
PKG_SITES:=		http://downloads.openwrt.org/sources/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2
#WRKDIST=		${WRKDIR}/$(PKG_NAME)${PKG_VERSION}

include ../rules.mk

all: ${STAGING_HOST_DIR}/bin/lzma

UTIL_DIR=$(WRKBUILD)/C/LzmaUtil
ALONE_DIR=$(WRKBUILD)/CPP/7zip/Compress/LZMA_Alone

$(WRKBUILD)/.compiled: ${WRKDIST}/.prepared
	$(MAKE) -C $(UTIL_DIR) -f makefile.gcc
	$(MAKE) -C $(ALONE_DIR) -f makefile.gcc
	touch $@

${STAGING_HOST_DIR}/bin/lzma: $(WRKBUILD)/.compiled
	$(INSTALL_BIN) $(WRKBUILD)/CPP/7zip/Compress/LZMA_Alone/lzma_alone \
		$(STAGING_DIR)/bin/lzma

include $(TOPDIR)/mk/tools.mk
