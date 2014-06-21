# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libupnp
PKG_VERSION:=		1.6.19
PKG_RELEASE:=		1
PKG_MD5SUM:=		ee16e5d33a3ea7506f38d71facc057dd
PKG_DESCR:=		universal plug and play sdk library
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://pupnp.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=pupnp/}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBUPNP,libupnp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
TARGET_CFLAGS+=		-fPIC
CONFIGURE_ARGS+=	--disable-samples

post-build:
	sed -i -e 's#^libdir=.*#libdir=#' \
		${WRKBUILD}/threadutil/libthreadutil.la

libupnp-install:
	${INSTALL_DIR} ${IDIR_LIBUPNP}/usr/lib
	${CP} ${WRKINST}/usr/lib/lib*.so* ${IDIR_LIBUPNP}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
