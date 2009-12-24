# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ipsec-tools
PKG_VERSION:=		0.7.2
PKG_RELEASE:=		1
PKG_BUILDDEP+=		openssl
PKG_MD5SUM:=		72861f005746ee27984b2ee715ecc629
PKG_DESCR:=		IPsec management tools
PKG_SECTION:=		net
PKG_DEPENDS:=		libopenssl
PKG_URL:=		http://ipsec-tools.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=ipsec-tools/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IPSEC_TOOLS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--with-kernel-headers="${LINUX_DIR}/include" \
			--without-readline \
			--disable-security-context \
			--with-openssl="${STAGING_DIR}/usr" \
			--without-libradius \
			--without-libpam
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_IPSEC_TOOLS}/usr/sbin ${IDIR_IPSEC_TOOLS}/usr/lib
	${INSTALL_DIR} ${IDIR_IPSEC_TOOLS}/etc
	${INSTALL_DATA} ${WRKBUILD}/src/racoon/samples/racoon.conf \
		${IDIR_IPSEC_TOOLS}/etc/
	${CP} ${WRKINST}/usr/lib/libipsec.so.* ${IDIR_IPSEC_TOOLS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libracoon.so.* ${IDIR_IPSEC_TOOLS}/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/sbin/plainrsa-gen \
		${IDIR_IPSEC_TOOLS}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/racoon ${IDIR_IPSEC_TOOLS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/racoonctl ${IDIR_IPSEC_TOOLS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/setkey ${IDIR_IPSEC_TOOLS}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
