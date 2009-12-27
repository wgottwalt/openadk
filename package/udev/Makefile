# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		udev
PKG_VERSION:=		149
PKG_RELEASE:=		1
PKG_MD5SUM:=		b218bd15939e8afc6368e1907a48bb26
PKG_DESCR:=		Dynamic device management subsystem
PKG_SECTION:=		base
PKG_URL:=		http://www.kernel.org/pub/linux/utils/kernel/hotplug/udev.html
PKG_SITES:=		${MASTER_SITE_KERNEL:=utils/kernel/hotplug/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,UDEV,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--disable-extras \
			--disable-logging \
			--disable-introspection
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_UDEV}/usr/sbin ${IDIR_UDEV}/etc/udev
	${CP} ${WRKINST}/etc/udev/* ${IDIR_UDEV}/etc/udev
	${CP} ${WRKINST}/usr/sbin/udevd ${IDIR_UDEV}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/udevadm ${IDIR_UDEV}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
