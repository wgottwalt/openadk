# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libqb
PKG_VERSION:=		0.16.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		51d2ca372c6b8151bf3544d93bcdc8db
PKG_DESCR:=		high performance client server reusable features
PKG_SECTION:=		libs/misc
PKG_URL:=		https://github.com/asalkeld/libqb/wiki#wiki-Releases
PKG_SITES:=		https://fedorahosted.org/releases/q/u/quarterback/
PKG_OPTS:=		dev

PKG_LIBC_DEPENDS:=	glibc musl

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBQB,libqb,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libqb-install:
	$(INSTALL_DIR) $(IDIR_LIBQB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libqb*so.* \
		$(IDIR_LIBQB)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
