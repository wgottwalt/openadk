# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libqb
PKG_VERSION:=		0.16.0
PKG_RELEASE:=		2
PKG_HASH:=		b8cda1efb33d0ce991aad552bbd71b59c16038c2095d139644a95b5b5ea17f48
PKG_DESCR:=		high performance client server reusable features
PKG_SECTION:=		libs/misc
PKG_URL:=		https://github.com/asalkeld/libqb/wiki#wiki-Releases
PKG_SITES:=		https://fedorahosted.org/releases/q/u/quarterback/
PKG_OPTS:=		dev

PKG_LIBC_DEPENDS:=	glibc musl

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBQB,libqb,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libqb-install:
	$(INSTALL_DIR) $(IDIR_LIBQB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libqb*so.* \
		$(IDIR_LIBQB)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
