# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		nasm
PKG_VERSION:=		2.11.02
PKG_RELEASE:=		1
PKG_MD5SUM:=		ec43582b8febae24e5b440ae816120c8
PKG_DESCR:=		assembler application
PKG_SECTION:=		dev/lang
PKG_BUILDDEP:=		nasm-host
PKG_URL:=		http://sourceforge.net/projects/nasm/
PKG_SITES:=		http://www.nasm.us/pub/nasm/releasebuilds/${PKG_VERSION}/

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,NASM,nasm,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,NASM,nasm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

FAKE_FLAGS+=		INSTALLROOT=${WRKINST}

nasm-install:
	$(INSTALL_DIR) $(IDIR_NASM)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/nasm \
		$(IDIR_NASM)/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
