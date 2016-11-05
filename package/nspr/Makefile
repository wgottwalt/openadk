# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		nspr
PKG_VERSION:=		4.13
PKG_RELEASE:=		1
PKG_HASH:=		19c33334bb3fa6d24800ffa65d7d806c54ad5f8c3758a5c11352ad43212ab181
PKG_DESCR:=		netscape portable runtime library
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.mozilla.org/projects/nspr/
PKG_SITES:=		https://ftp.mozilla.org/pub/nspr/releases/v$(PKG_VERSION)/src/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
WRKSRC=			${WRKDIST}/nspr

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,NSPR,nspr,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ENV+=		OS_TARGET="Linux" \
			HOST_CC="${HOST_CC}" \
			HOST_CFLAGS="${HOST_CFLAGS}"

ifeq (${ADK_LINUX_64},y)
CONFIGURE_ARGS+=	--enable-64bit
endif

nspr-install:
	$(INSTALL_DIR) $(IDIR_NSPR)/usr/lib
	$(CP) $(WRKINST)/usr/lib/*.so* $(IDIR_NSPR)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
