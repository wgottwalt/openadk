# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		snort
PKG_VERSION:=		2.6.1.2
PKG_RELEASE:=		8
PKG_BUILDDEP+=		libnet libpcap pcre
PKG_MD5SUM:=		22c448e25538cdf74c62abe586aeac0a
PKG_DESCR:=		a flexible Network Intrusion Detection System (NIDS)
PKG_SECTION:=		net
PKG_DEPENDS:=		libnet libpcap libpcre
PKG_SITES:=		http://www.snort.org/dl/current/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SNORT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--enable-flexresp \
			--with-libnet-includes="${STAGING_DIR}/usr/include" \
			--with-libnet-libraries="${STAGING_DIR}/usr/lib" \
			--with-libpcap-includes="${STAGING_DIR}/usr/include" \
			--with-libpcap-libraries="${STAGING_DIR}/usr/lib" \
			--with-libpcre-includes="${STAGING_DIR}/usr/include" \
			--with-libpcre-libraries="${STAGING_DIR}/usr/lib" \
			--without-mysql \
			--without-postgresql \
			--disable-inline
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_SNORT}/usr/bin
	${INSTALL_DIR} ${IDIR_SNORT}/etc/snort
	${INSTALL_DATA} ${WRKBUILD}/etc/snort.conf ${IDIR_SNORT}/etc/snort/
	${INSTALL_DATA} ${WRKBUILD}/etc/classification.config \
		${IDIR_SNORT}/etc/snort/
	${INSTALL_DATA} ${WRKBUILD}/etc/gen-msg.map ${IDIR_SNORT}/etc/snort/
	${INSTALL_DATA} ${WRKBUILD}/etc/reference.config ${IDIR_SNORT}/etc/snort/
	${INSTALL_DATA} ${WRKBUILD}/etc/sid-msg.map ${IDIR_SNORT}/etc/snort/
	${INSTALL_DATA} ${WRKBUILD}/etc/threshold.conf ${IDIR_SNORT}/etc/snort/
	${INSTALL_DATA} ${WRKBUILD}/etc/unicode.map ${IDIR_SNORT}/etc/snort/
	${INSTALL_BIN} ${WRKINST}/usr/bin/snort ${IDIR_SNORT}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
