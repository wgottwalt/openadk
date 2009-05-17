# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		device-mapper
PKG_VERSION:=		1.02.28
PKG_RELEASE:=		1
PKG_MD5SUM:=		c9ae0776994a419f9e1ba842164bb626
DISTFILES:=		${PKG_NAME}.${PKG_VERSION}.tgz
MASTER_SITES:=		ftp://sources.redhat.com/pub/dm/

WRKDIST=		${WRKDIR}/${PKG_NAME}.${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DEVICE_MAPPER,device-mapper,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

ifeq ($(DEBUG),1)
CONFIGURE_ARGS+=	--enable-debug
else
CONFIGURE_ARGS+=	--disable-debug
endif

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--with-user="" --with-group="" \
			--with-optimisation="" \
			--with-kernel-dir=${LINUX_DIR}
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
INSTALL_TARGET+=	install_static_lib

post-install:
	${INSTALL_DIR} ${IDIR_DEVICE_MAPPER}/usr/sbin
	${INSTALL_DIR} ${IDIR_DEVICE_MAPPER}/usr/lib
	${CP} ${WRKINST}/usr/lib/libdevmapper.so* \
		${IDIR_DEVICE_MAPPER}/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/sbin/dmsetup \
		${IDIR_DEVICE_MAPPER}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
