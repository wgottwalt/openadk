# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		miredo
PKG_VERSION:=		1.1.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		bf49c1ddc068746760787d0cf76e40de
MASTER_SITES:=		http://www.remlab.net/files/miredo/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MIREDO,miredo,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,MIREDO_SERVER,miredo-server,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--disable-chroot \
			--without-Judy \
			--enable-teredo-client \
			--enable-teredo-relay \
			--enable-teredo-server \
			--enable-miredo-user=root
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
XAKE_FLAGS+		 CXXLINK="\$${LINK}" \

ifeq ($(ADK_TARGET_LIB_UCLIBCXX),y)
TCXXFLAGS+=		-fno-builtin -fno-rtti -nostdinc++
TLDFLAGS+=		-nodefaultlibs
CONFIGURE_ENV+=		LIBS="-luClibc++ -lc -lm" \
			ac_cv_file__proc_self_maps=yes
else
CONFIGURE_ENV+=		LIBS="-lc -lm" \
			ac_cv_file__proc_self_maps=yes
endif

post-install:
	${INSTALL_DIR} ${IDIR_MIREDO}/etc/init.d
	${INSTALL_DIR} ${IDIR_MIREDO}/etc/miredo
	${INSTALL_DIR} ${IDIR_MIREDO}/usr/sbin
	${INSTALL_DATA} ${WRKINST}/etc/miredo/miredo.conf ${IDIR_MIREDO}/etc/miredo/miredo.conf
	${INSTALL_BIN} ./files/miredo.init \
		${IDIR_MIREDO}/etc/init.d/miredo
	${INSTALL_BIN} ${WRKINST}/usr/sbin/miredo ${IDIR_MIREDO}/usr/sbin/
	${INSTALL_DIR} ${IDIR_MIREDO_SERVER}/usr/sbin
	${INSTALL_DIR} ${IDIR_MIREDO_SERVER}/etc/init.d
	${INSTALL_BIN} ./files/miredo-server.init \
		${IDIR_MIREDO_SERVER}/etc/init.d/miredo-server
	${INSTALL_BIN} ${WRKINST}/usr/sbin/miredo-server ${IDIR_MIREDO_SERVER}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
