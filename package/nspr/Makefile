# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		nspr
PKG_VERSION:=		4.9.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		62b1e9d376d503d972f90c3c0031d879
PKG_DESCR:=		Netscape Portable Runtime library
PKG_SECTION:=		libs
PKG_URL:=		http://www.mozilla.org/projects/nspr/
PKG_SITES:=		ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PKG_VERSION}/src/
PKG_OPTS:=		dev

PKG_ARCH_DEPENDS:=	!cris

WRKSRC=			${WRKDIST}/mozilla/nsprpub

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
