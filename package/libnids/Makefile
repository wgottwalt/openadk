# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libnids
PKG_VERSION:=		1.23
PKG_RELEASE:=		2
PKG_MD5SUM:=		af35e8ef403a0ca95df2da94db856428
PKG_DESCR:=		Network Intrusion Detection System library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libnet libpcap glib
PKG_BUILDDEP:=		libnet libpcap glib
PKG_URL:=		http://libnids.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libnids/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBNIDS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-libpcap=${STAGING_DIR}/usr
XAKE_FLAGS+=		install_prefix="${WRKINST}"

post-install:
	${INSTALL_DIR} ${IDIR_LIBNIDS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnids.so* ${IDIR_LIBNIDS}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
