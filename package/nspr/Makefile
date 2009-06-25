# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		nspr
PKG_VERSION:=		4.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		e0916a72bcc6c427551ea262183fdb26
PKG_DESCR:=		NSPR library
PKG_SECTION:=		libs
PKG_URL:=		http://www.mozilla.org/projects/nspr/
PKG_SITES:=		https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v4.8/src/

WRKSRC=			${WRKDIST}/mozilla/nsprpub

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,NSPR,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		HOST_CC="${HOSTCC}" HOST_CFLAGS="${HOSTCFLAGS}"
CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	$(INSTALL_DIR) $(IDIR_NSPR)/usr/lib
	$(CP) $(WRKINST)/usr/lib/*.so* $(IDIR_NSPR)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
