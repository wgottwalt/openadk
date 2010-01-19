# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		snort
PKG_VERSION:=		2.8.5.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		e6a8bc5aa1ebe4d2100533d7709c4a9e
PKG_DESCR:=		a flexible Network Intrusion Detection System (NIDS)
PKG_SECTION:=		net
PKG_NOPARALLEL:=	1
PKG_DEPENDS:=		libnet libpcap libpcre
PKG_BUILDDEP+=		libnet libpcap pcre
PKG_URL:=		http://www.snort.org/
PKG_SITES:=		http://dl.snort.org/snort-current/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SNORT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--disable-flexresp \
			--with-libnet-includes="${STAGING_DIR}/usr/include" \
			--with-libnet-libraries="${STAGING_DIR}/usr/lib" \
			--with-libpcap-includes="${STAGING_DIR}/usr/include" \
			--with-libpcap-libraries="${STAGING_DIR}/usr/lib" \
			--with-libpcre-includes="${STAGING_DIR}/usr/include" \
			--with-libpcre-libraries="${STAGING_DIR}/usr/lib" \
			--without-mysql \
			--without-postgresql \
			--disable-inline
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

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
