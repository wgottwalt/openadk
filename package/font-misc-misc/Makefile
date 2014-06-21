# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		font-misc-misc
PKG_VERSION:=		1.1.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		23a79b92275375315129b440206c85b9
PKG_DESCR:=		x fonts
PKG_SECTION:=		x11/fonts
PKG_BUILDDEP:=		font-util
PKG_URL:=		http://www.x.org/
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_HOST_DEPENDS:=      !netbsd !openbsd !cygwin !freebsd !mirbsd

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FONT_MISC_MISC,font-misc-misc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		MAPFILES_PATH=${STAGING_TARGET_DIR}/usr/share/fonts/X11/util

font-misc-misc-install:
	$(INSTALL_DIR) $(IDIR_FONT_MISC_MISC)/usr/share/fonts/X11/misc
	$(CP) ${WRKINST}/usr/share/fonts/X11/misc/* \
		$(IDIR_FONT_MISC_MISC)/usr/share/fonts/X11/misc

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
