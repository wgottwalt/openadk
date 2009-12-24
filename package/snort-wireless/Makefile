# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		snort-wireless
PKG_VERSION:=		2.4.3-alpha04
PKG_RELEASE:=		9
PKG_BUILDDEP+=		libnet libpcap pcre
PKG_MD5SUM:=		1aa699ae279bf7a1140cf6cca02f9999
PKG_DESCR:=		a flexible Wireless Network Intrusion Detection System (NIDS)
PKG_SECTION:=		net
PKG_DEPENDS:=		libnet libpcap pcre
PKG_URL:=		http://www.snort-wireless.org
PKG_SITES:=		http://www.snort-wireless.org/files/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SNORT_WIRELESS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

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
	${INSTALL_DIR} ${IDIR_SNORT_WIRELESS}/usr/bin
	${INSTALL_DIR} ${IDIR_SNORT_WIRELESS}/etc/snort
	${INSTALL_DATA} ${WRKBUILD}/etc/snort.conf ${IDIR_SNORT_WIRELESS}/etc/snort/
	${INSTALL_DATA} ${WRKBUILD}/etc/classification.config \
		${IDIR_SNORT_WIRELESS}/etc/snort/
	${INSTALL_DATA} ${WRKBUILD}/etc/gen-msg.map ${IDIR_SNORT_WIRELESS}/etc/snort/
	${INSTALL_DATA} ${WRKBUILD}/etc/reference.config ${IDIR_SNORT_WIRELESS}/etc/snort/
	${INSTALL_DATA} ${WRKBUILD}/etc/sid-msg.map ${IDIR_SNORT_WIRELESS}/etc/snort/
	${INSTALL_DATA} ${WRKBUILD}/etc/threshold.conf ${IDIR_SNORT_WIRELESS}/etc/snort/
	${INSTALL_DATA} ${WRKBUILD}/etc/unicode.map ${IDIR_SNORT_WIRELESS}/etc/snort/
	${INSTALL_BIN} ${WRKINST}/usr/bin/snort ${IDIR_SNORT_WIRELESS}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
