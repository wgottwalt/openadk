# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		nspr
PKG_VERSION:=		4.8.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		592c275728c29d193fdba8009165990b
PKG_DESCR:=		Netscape Portable Runtime library
PKG_SECTION:=		libs
PKG_URL:=		http://www.mozilla.org/projects/nspr/
PKG_SITES:=		ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PKG_VERSION}/src/

PKG_ARCH_DEPENDS:=	!cris

WRKSRC=			${WRKDIST}/mozilla/nsprpub

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,NSPR,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		OS_TARGET="Linux" HOST_CC="${CC_FOR_BUILD}" HOST_CFLAGS="${CFLAGS_FOR_BUILD}" \
			cross_compiling=yes

ifeq (${ADK_LINUX_64},y)
CONFIGURE_ARGS+=	--enable-64bit
endif

post-install:
	$(INSTALL_DIR) $(IDIR_NSPR)/usr/lib
	$(CP) $(WRKINST)/usr/lib/*.so* $(IDIR_NSPR)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
