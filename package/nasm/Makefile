# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		nasm
PKG_VERSION:=		2.11.02
PKG_RELEASE:=		1
PKG_MD5SUM:=		ec43582b8febae24e5b440ae816120c8
PKG_DESCR:=		assembler application
PKG_SECTION:=		lang
PKG_BUILDDEP:=		nasm-host
PKG_URL:=		http://sourceforge.net/projects/nasm/
PKG_SITES:=		http://www.nasm.us/pub/nasm/releasebuilds/${PKG_VERSION}/

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,NASM,nasm,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,NASM,nasm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

FAKE_FLAGS+=		INSTALLROOT=${WRKINST}
HOST_STYLE:=		auto

nasm-install:
	$(INSTALL_DIR) $(IDIR_NASM)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/nasm \
		$(IDIR_NASM)/usr/bin

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
