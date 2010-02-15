# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		lvm
PKG_VERSION:=		2.02.51
PKG_RELEASE:=		1
PKG_MD5SUM:=		725d07794007e021bfc592b1636100c7
PKG_DESCR:=		logical volume management
PKG_SECTION:=		misc
PKG_DEPENDS:=		device-mapper libncurses
PKG_URL:=		http://sourceware.org/lvm2/
PKG_SITES:=		ftp://sources.redhat.com/pub/lvm2/

PKG_DESCR_DM:=		device-mapper library and utility
DISTFILES:=		LVM2.${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/LVM2.${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LVM,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,DEVICE_MAPPER,device-mapper,${PKG_VERSION}-${PKG_RELEASE},,${PKG_DESCR_DM},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-user="" --with-group="" \
			--with-optimisation="" \
			--with-lvm1=none

post-install:
	# lvm
	${INSTALL_DIR} ${IDIR_LVM}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/lvm ${IDIR_LVM}/usr/sbin/lvm
	# device-mapper
	${INSTALL_DIR} ${IDIR_DEVICE_MAPPER}/usr/sbin ${IDIR_DEVICE_MAPPER}/usr/lib
	${CP} ${WRKINST}/usr/lib/libdevmapper.so* \
		${IDIR_DEVICE_MAPPER}/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/sbin/dmsetup \
		${IDIR_DEVICE_MAPPER}/usr/sbin
	chmod u+w ${IDIR_DEVICE_MAPPER}/usr/lib/*.so*

include ${TOPDIR}/mk/pkg-bottom.mk
