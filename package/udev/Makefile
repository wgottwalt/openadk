# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		udev
PKG_VERSION:=		171
PKG_RELEASE:=		1
PKG_MD5SUM:=		bdf4617284be2ecac11767437417e209
PKG_DESCR:=		Dynamic device management subsystem
PKG_SECTION:=		utils
PKG_BUILDDEP:=		usbutils glib
PKG_URL:=		http://www.kernel.org/pub/linux/utils/kernel/hotplug/udev.html
PKG_SITES:=		${MASTER_SITE_KERNEL:=utils/kernel/hotplug/}

PKG_CFLINE_UDEV:=	depends on ADK_TARGET_LIB_EGLIBC || ADK_TARGET_LIB_GLIBC

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,UDEV,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-extras \
			--disable-logging \
			--disable-udev_acl \
			--with-pci-ids-path=/usr/share/pci.ids \
			--disable-introspection

post-install:
	${INSTALL_DIR} ${IDIR_UDEV}/usr/sbin ${IDIR_UDEV}/etc/udev
	${INSTALL_DIR} ${IDIR_UDEV}/usr/lib
	$(CP) $(WRKINST)/usr/lib/libudev.so* $(IDIR_UDEV)/usr/lib
	${CP} ${WRKINST}/etc/udev/* ${IDIR_UDEV}/etc/udev
	${CP} ${WRKINST}/usr/sbin/udevd ${IDIR_UDEV}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/udevadm ${IDIR_UDEV}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
