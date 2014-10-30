# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		eudev
PKG_VERSION:=		2.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		dd945ce34314b4544e9036153d3a97e9
PKG_DESCR:=		device manager (udev clone)
PKG_SECTION:=		sys/utils
PKG_BUILDDEP:=		gperf-host glib
PKG_DEPENDS:=		glib
PKG_URL:=		http://www.gentoo.org/proj/en/eudev/
PKG_SITES:=		http://dev.gentoo.org/~blueness/eudev/
PKG_LIBNAME:=		libudev
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		UDEV LIBUDEV
PKGSD_UDEV:=		dynamic device management manager
PKGSC_LIBUDEV:=		libs/misc
PKGSD_LIBUDEV:=		dynamic device management library

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,UDEV,udev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBUDEV,libudev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-manpages \
			--disable-gudev \
			--disable-gtk-doc

udev-install:
	${INSTALL_DIR} ${IDIR_UDEV}/usr/bin ${IDIR_UDEV}/etc/udev
	${INSTALL_DIR} ${IDIR_UDEV}/usr/lib/udev
	${CP} ${WRKINST}/etc/udev/* ${IDIR_UDEV}/etc/udev
	${CP} ${WRKINST}/usr/lib/udev/* ${IDIR_UDEV}/usr/lib/udev
	${CP} ${WRKINST}/usr/bin/udevadm ${IDIR_UDEV}/usr/bin

libudev-install:
	${INSTALL_DIR} ${IDIR_LIBUDEV}/usr/lib
	$(CP) $(WRKINST)/usr/lib/libudev.so* $(IDIR_LIBUDEV)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
