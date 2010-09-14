# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		lvm
PKG_VERSION:=		2.02.72
PKG_RELEASE:=		1
PKG_MD5SUM:=		a7d0d1235a589869bd13cde0f0d7375d
PKG_DESCR:=		logical volume management
PKG_SECTION:=		fs
PKG_DEPENDS:=		libdevmapper libncurses
PKG_URL:=		http://sourceware.org/lvm2/
PKG_SITES:=		ftp://sources.redhat.com/pub/lvm2/

PKG_SUBPKGS:=		LVM DEVICE_MAPPER LIBDEVMAPPER
PKGSD_DEVICE_MAPPER:=	device-mapper utility
PKGSD_LIBDEVMAPPER:=	device-mapper library
PKGSC_LIBDEVMAPPER:=	libs

DISTFILES:=		LVM2.${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/LVM2.${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LVM,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,DEVICE_MAPPER,device-mapper,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_DEVICE_MAPPER},${PKG_SECTION}))
$(eval $(call PKG_template,LIBDEVMAPPER,libdevmapper,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBDEVMAPPER},${PKGSC_LIBDEVMAPPER}))

CONFIGURE_ARGS+=	--with-user="" --with-group="" \
			--with-optimisation="" \
			--with-lvm1=none

post-install:
	# lvm
	${INSTALL_DIR} ${IDIR_LVM}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/lvm ${IDIR_LVM}/usr/sbin/lvm
	# libdevmapper
	${INSTALL_DIR} ${IDIR_LIBDEVMAPPER}/usr/lib
	${CP} ${WRKINST}/usr/lib/libdevmapper.so* \
		${IDIR_LIBDEVMAPPER}/usr/lib
	# device-mapper
	${INSTALL_DIR} ${IDIR_DEVICE_MAPPER}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/dmsetup \
		${IDIR_DEVICE_MAPPER}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
