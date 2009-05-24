# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		nmap
PKG_VERSION:=		4.76
PKG_RELEASE:=		1
PKG_MD5SUM:=		278dd2e849cc3dbb947df961a1aaffd0
MASTER_SITES:=		http://download.insecure.org/nmap/dist/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

PKG_DEPEND:=		libgcc libdnet libpcap libpcre
ifeq ($(ADK_COMPILE_NMAP_WITH_UCLIBCXX),y)
PKG_DEPEND+=		uclibc++
else
PKG_DEPEND+=		libstdcxx
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NMAP,nmap,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPEND}))

TCPPFLAGS+=		-DNOLUA
ifeq ($(ADK_COMPILE_NMAP_WITH_UCLIBCXX),y)
CONFIGURE_ENV+=		CXXFLAGS="-fno-builtin -fno-rtti -nostdinc++ \
			-I${STAGING_DIR}/usr/include/uClibc++" \
			LIBS="-nodefaultlibs -luClibc++ -lc -lm -lgcc"
endif
CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--without-openssl \
			--without-zenmap \
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
