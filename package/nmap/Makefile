# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		nmap
PKG_VERSION:=		7.40
PKG_RELEASE:=		1
PKG_HASH:=		9e14665fffd054554d129d62c13ad95a7b5c7a046daa2290501909e65f4d3188
PKG_DESCR:=		utility for network exploration or security auditing
PKG_SECTION:=		net/security
PKG_DEPENDS:=		libdnet libpcap libpcre
PKG_BUILDDEP:=		libdnet libpcap pcre
PKG_NEEDS:=		c++
PKG_URL:=		http://nmap.org/
PKG_SITES:=		http://download.insecure.org/nmap/dist/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NMAP,nmap,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-DNOLUA
TARGET_LDFLAGS+=	-lpthread
CONFIGURE_ENV+=		ac_cv_dnet_bsd_bpf=no
CONFIGURE_ARGS+=	--without-openssl \
			--without-zenmap \
			--without-ndiff \
			--without-liblua \
			--with-libpcap="${STAGING_TARGET_DIR}/usr" \
			--with-libpcre="${STAGING_TARGET_DIR}/usr" \
			--enable-static

nmap-install:
	${INSTALL_DIR} ${IDIR_NMAP}/usr/share/nmap
	${INSTALL_DIR} ${IDIR_NMAP}/usr/bin
	for file in mac-prefixes os-db protocols rpc service-probes services; do \
		${CP} ${WRKINST}/usr/share/nmap/nmap-$$file ${IDIR_NMAP}/usr/share/nmap; \
	done
	${INSTALL_BIN} ${WRKINST}/usr/bin/nmap ${IDIR_NMAP}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
