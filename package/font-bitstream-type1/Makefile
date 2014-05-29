# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		font-bitstream-type1
PKG_VERSION:=		1.0.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		ff91738c4d3646d7999e00aa9923f2a0
PKG_DESCR:=		x fonts
PKG_SECTION:=		x11/fonts
PKG_BUILDDEP:=		font-util
PKG_URL:=		http://www.x.org/
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_HOST_DEPENDS:=      !netbsd !openbsd !cygwin !freebsd !mirbsd

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FONT_BITSTREAM_TYPE1,font-bitstream-type1,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

font-bitstream-type1-install:
	$(INSTALL_DIR) $(IDIR_FONT_BITSTREAM_TYPE1)/usr/share/fonts/X11/Type1
	$(CP) ${WRKINST}/usr/share/fonts/X11/Type1/* \
		$(IDIR_FONT_BITSTREAM_TYPE1)/usr/share/fonts/X11/Type1

include ${TOPDIR}/mk/pkg-bottom.mk
