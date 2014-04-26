# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gmediaserver
PKG_VERSION:=		0.13.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		c422de386331e2a1a859d45f6fa270a3
PKG_DESCR:=		UPnP music media server
PKG_SECTION:=		multimedia
PKG_DEPENDS:=		id3lib libupnp libmagic
PKG_BUILDDEP:=		id3lib libupnp file libiconv-tiny
PKG_URL:=		http://www.gnu.org/software/gmediaserver
PKG_SITES:=		http://savannah.nongnu.org/download/gmediaserver/
PKG_CXX:=		GMEDIASERVER

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_LIBC_DEPENDS:=	uclibc glibc

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GMEDIASERVER,gmediaserver,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-D_GNU_SOURCE
CONFIGURE_ENV+=		LIBS=" -lixml -lthreadutil -lupnp -lz"
CONFIGURE_ARGS+=	--with-id3lib="${STAGING_TARGET_DIR}/usr" \
			--with-libupnp="${STAGING_TARGET_DIR}/usr"

ifeq ($(ADK_TARGET_LIB_UCLIBCXX),y)
CONFIGURE_ENV+=		LIBS=" -lixml -lthreadutil -lupnp -luClibc++ -lz -lc"
endif

gmediaserver-install:
	${INSTALL_DIR} ${IDIR_GMEDIASERVER}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gmediaserver \
		${IDIR_GMEDIASERVER}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
