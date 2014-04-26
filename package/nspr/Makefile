# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		nspr
PKG_VERSION:=		4.10.2
PKG_RELEASE:=		2
PKG_MD5SUM:=		f0d254da0b2b870d9a5fa094e879d4b8
PKG_DESCR:=		Netscape Portable Runtime library
PKG_SECTION:=		libs
PKG_URL:=		http://www.mozilla.org/projects/nspr/
PKG_SITES:=		ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PKG_VERSION}/src/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
WRKSRC=			${WRKDIST}/nspr

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,NSPR,nspr,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ENV+=		OS_TARGET="Linux" HOST_CC="${CC_FOR_BUILD}" HOST_CFLAGS="${CFLAGS_FOR_BUILD}"

ifeq (${ADK_LINUX_64},y)
CONFIGURE_ARGS+=	--enable-64bit
endif

nspr-install:
	$(INSTALL_DIR) $(IDIR_NSPR)/usr/lib
	$(CP) $(WRKINST)/usr/lib/*.so* $(IDIR_NSPR)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
