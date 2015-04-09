# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libnids
PKG_VERSION:=		1.24
PKG_RELEASE:=		3
PKG_HASH:=		314b4793e0902fbf1fdb7fb659af37a3c1306ed1aad5d1c84de6c931b351d359
PKG_DESCR:=		network intrusion detection system library
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libnet libpcap glib
PKG_BUILDDEP:=		libnet libpcap glib
PKG_URL:=		http://libnids.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libnids/}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_LIBC_DEPENDS:=	uclibc-ng uclibc glibc

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBNIDS,libnids,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_LDFLAGS+=	-lpthread
CONFIGURE_ENV+=		ac_cv_lib_nsl_gethostbyname=no
CONFIGURE_ARGS+=	--with-libpcap=${STAGING_TARGET_DIR}/usr
AUTOTOOL_STYLE:=	autoreconf
XAKE_FLAGS+=		install_prefix="${WRKINST}"

libnids-install:
	${INSTALL_DIR} ${IDIR_LIBNIDS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnids.so* ${IDIR_LIBNIDS}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
