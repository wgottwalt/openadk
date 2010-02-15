# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		nspr
PKG_VERSION:=		4.8.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		2a6fbfa56c9760ed3651d527272249c7
PKG_DESCR:=		Netscape Portable Runtime library
PKG_SECTION:=		libs
PKG_URL:=		http://www.mozilla.org/projects/nspr/
PKG_SITES:=		https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PKG_VERSION}/src/

PKG_TARGET_DEPENDS:=	!foxboard

WRKSRC=			${WRKDIST}/mozilla/nsprpub

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,NSPR,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		OS_TARGET="Linux" HOST_CC="${HOSTCC}" HOST_CFLAGS="${HOSTCFLAGS}"
CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	$(INSTALL_DIR) $(IDIR_NSPR)/usr/lib
	$(CP) $(WRKINST)/usr/lib/*.so* $(IDIR_NSPR)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
