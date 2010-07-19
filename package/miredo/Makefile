# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		miredo
PKG_VERSION:=		1.1.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		bf49c1ddc068746760787d0cf76e40de
PKG_DESCR:=		A Teredo client and relay daemon
PKG_SECTION:=		ipv6
ifeq (${ADK_COMPILE_MIREDO_WITH_UCLIBCXX},y)
PKG_BUILDDEP+=		uclibc++
endif
PKG_URL:=		http://www.remlab.net
PKG_SITES:=		http://www.remlab.net/files/miredo/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MIREDO,miredo,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,MIREDO_SERVER,miredo-server,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TCFLAGS+=		-std=gnu99
CONFIGURE_ENV+=		ac_cv_file__proc_self_maps=yes
CONFIGURE_ARGS+=	--disable-chroot \
			--without-Judy \
			--enable-teredo-client \
			--enable-teredo-relay \
			--enable-teredo-server \
			--enable-miredo-user=root

XAKE_FLAGS+=		 CXXLINK="\$${LINK}" \

ifeq ($(ADK_TARGET_LIB_UCLIBCXX),y)
TCXXFLAGS+=		-fno-builtin -fno-rtti -nostdinc++
TLDFLAGS+=		-nodefaultlibs
CONFIGURE_ENV+=		LIBS="-luClibc++ -lc -lm"
endif

post-install:
	${INSTALL_DIR} ${IDIR_MIREDO}/etc/miredo ${IDIR_MIREDO}/usr/sbin
	${INSTALL_DIR} ${IDIR_MIREDO}/usr/lib
	${INSTALL_DATA} ${WRKINST}/etc/miredo/miredo.conf \
		${IDIR_MIREDO}/etc/miredo
	${CP} ${WRKINST}/usr/lib/libtun*.so* ${IDIR_MIREDO}/usr/lib
	${CP} ${WRKINST}/usr/lib/libteredo.so* ${IDIR_MIREDO}/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/sbin/miredo ${IDIR_MIREDO}/usr/sbin/
	${INSTALL_DIR} ${IDIR_MIREDO_SERVER}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/miredo-server \
		${IDIR_MIREDO_SERVER}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
