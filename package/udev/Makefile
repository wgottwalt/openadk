# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		udev
PKG_VERSION:=		077
PKG_RELEASE:=		1
PKG_MD5SUM:=		61ec646daf7795e9777e8f33975408fe

MASTER_SITES:=		ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/ \
			http://ftp.kernel.org/pub/linux/utils/kernel/hotplug/ \
			ftp://ftp.de.kernel.org/pub/linux/utils/kernel/hotplug/ \
			http://ftp.de.kernel.org/pub/linux/utils/kernel/hotplug/ \
			ftp://ftp.fr.kernel.org/pub/linux/utils/kernel/hotplug/ \
			http://ftp.fr.kernel.org/pub/linux/utils/kernel/hotplug/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,UDEV,udev,${PKG_VERSION}-${PKG_RELEASE}))

BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
XAKE_FLAGS+=		CROSS="${TARGET_CROSS}" \
			STRIP="/bin/true" \
			OPTFLAGS="${TARGET_CFLAGS}" \
			INSTALL="install -c"

post-install:
	${INSTALL_DIR} ${IDIR_UDEV}/etc/udev/
	${CP} ${WRKINST}/etc/udev/* ${IDIR_UDEV}/etc/udev/
	${INSTALL_DIR} ${IDIR_UDEV}/lib/udev
	${INSTALL_DIR} ${IDIR_UDEV}/sbin/
	${CP} ${WRKINST}/sbin/udev ${IDIR_UDEV}/sbin/
	${CP} ${WRKINST}/sbin/udevcontrol ${IDIR_UDEV}/sbin/
	${CP} ${WRKINST}/sbin/udevd ${IDIR_UDEV}/sbin/
	${CP} ${WRKINST}/sbin/udevsend ${IDIR_UDEV}/sbin/
	${CP} ${WRKINST}/sbin/udevstart ${IDIR_UDEV}/sbin/
	${INSTALL_DIR} ${IDIR_UDEV}/usr/bin/
	${CP} ${WRKINST}/usr/bin/udevinfo ${IDIR_UDEV}/usr/bin/
	${CP} ${WRKINST}/usr/bin/udevtest ${IDIR_UDEV}/usr/bin/
	${INSTALL_DIR} ${IDIR_UDEV}/usr/sbin/
	${CP} ${WRKINST}/usr/sbin/udevmonitor ${IDIR_UDEV}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
