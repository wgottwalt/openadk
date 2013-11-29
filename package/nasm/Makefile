# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		nasm
PKG_VERSION:=		2.07
PKG_RELEASE:=		1
PKG_MD5SUM:=		84d8e009b3d2565a810ab3ddad1f4f63
PKG_DESCR:=		the netwide assembler
PKG_SECTION:=		lang
PKG_URL:=		http://sourceforge.net/projects/nasm/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=nasm/nasm%20sources/2.07/}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,NASM,nasm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

FAKE_FLAGS+=		INSTALLROOT=${WRKINST}

nasm-install:
	$(INSTALL_DIR) $(IDIR_NASM)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/nasm \
		$(IDIR_NASM)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
