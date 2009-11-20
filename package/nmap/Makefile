# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		nmap
PKG_VERSION:=		5.00
PKG_RELEASE:=		1
PKG_MD5SUM:=		32d27de32166c02d670bb4a086185886
PKG_DESCR:=		utility for network exploration or security auditing
PKG_SECTION:=		net
PKG_DEPENDS:=		libdnet libpcap libpcre
PKG_URL:=		http://nmap.org
PKG_SITES:=		http://download.insecure.org/nmap/dist/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

ifeq ($(ADK_COMPILE_NMAP_WITH_UCLIBCXX),y)
PKG_DEPENDS+=		uclibc++
else
PKG_DEPENDS+=		libstdcxx
endif

$(eval $(call PKG_template,NMAP,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TCPPFLAGS+=		-DNOLUA
ifeq ($(ADK_COMPILE_NMAP_WITH_UCLIBCXX),y)
CONFIGURE_ENV+=		CXXFLAGS="-fno-threadsafe-statics -fno-builtin -fno-rtti -nostdinc++ \
			-I${STAGING_DIR}/usr/include/uClibc++" \
			LIBS="-nodefaultlibs -luClibc++ -lgcc -lm"
endif
CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--without-openssl \
			--without-zenmap \
			--without-ndiff \
			--without-liblua \
			--with-libdnet="${STAGING_DIR}/usr" \
			--with-libpcap="${STAGING_DIR}/usr" \
			--with-libpcre="${STAGING_DIR}/usr"
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_NMAP}/usr/share/nmap
	${INSTALL_DIR} ${IDIR_NMAP}/usr/bin
	for file in mac-prefixes os-db protocols rpc service-probes services; do \
		${CP} ${WRKINST}/usr/share/nmap/nmap-$$file ${IDIR_NMAP}/usr/share/nmap; \
	done
	${INSTALL_BIN} ${WRKINST}/usr/bin/nmap ${IDIR_NMAP}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
