# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		mozjs
PKG_VERSION:=		17.0.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		20b6f8f1140ef6e47daa3b16965c9202
PKG_DESCR:=		javascript library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		bzip2-host python2-host nspr
PKG_SITES:=		http://ftp.mozilla.org/pub/mozilla.org/js/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}${PKG_VERSION}
WRKSRC=                 ${WRKDIST}/js/src

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MOZJS,mozjs,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ENV+=		HOST_CC="${CC_FOR_BUILD}" HOST_CFLAGS="${CFLAGS_FOR_BUILD}"
CONFIGURE_ENV+=		HOST_LDFLAGS="${LDFLAGS_FOR_BUILD}"
CONFIGURE_ENV+=		HOST_CXXFLAGS="${CXXFLAGS_FOR_BUILD}" HOST_CXX="${CXX_FOR_BUILD}"
CONFIGURE_ARGS+=	--disable-optimize \
			--with-system-nspr

mozjs-install:
	$(INSTALL_DIR) $(IDIR_MOZJS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libmozjs*.so* \
		$(IDIR_MOZJS)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
