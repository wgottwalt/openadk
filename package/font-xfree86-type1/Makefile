# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		font-xfree86-type1
PKG_VERSION:=		1.0.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		785f2b6e8d6d0dafec08b8d4c54ae2e3
PKG_DESCR:=		X fonts
PKG_SECTION:=		x11/fonts
PKG_URL:=		http://www.x.org/
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_HOST_DEPENDS:=      !netbsd !openbsd !cygwin !freebsd !mirbsd !darwin

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FONT_XFREE86_TYPE1,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_FONT_XFREE86_TYPE1)/usr/share/fonts/X11/Type1
	$(CP) ${WRKINST}/usr/share/fonts/X11/Type1/* \
		$(IDIR_FONT_XFREE86_TYPE1)/usr/share/fonts/X11/Type1

include ${TOPDIR}/mk/pkg-bottom.mk
