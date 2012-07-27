# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		dillo
PKG_VERSION:=		3.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		448f44a923222270cb0c84e55adc1be1
PKG_DESCR:=		small graphical web browser
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libfltk libxi libiconv libpng zlib libjpeg
PKG_DEPENDS+=		libstdcxx
PKG_BUILDDEP:=		fltk libXi libiconv jpeg libpng zlib
PKG_URL:=		http://www.dillo.org/
PKG_SITES:=		http://www.dillo.org/download/
PKG_NEED_CXX:=		1

PKG_HOST_DEPENDS:=	!cygwin
PKG_ARCH_DEPENDS:=	x86 x86_64 mips arm

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DILLO,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-liconv -lpng

post-install:
	$(INSTALL_DIR) $(IDIR_DILLO)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/dillo $(IDIR_DILLO)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
