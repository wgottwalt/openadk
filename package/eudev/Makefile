# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		eudev
PKG_VERSION:=		1.5.3
PKG_RELEASE:=		2
PKG_MD5SUM:=		51380938b489385cc394f4ebabc048f0
PKG_DESCR:=		device manager (udev clone)
PKG_SECTION:=		utils
PKG_BUILDDEP:=		gperf-host glib
PKG_DEPENDS:=		glib
PKG_URL:=		http://www.gentoo.org/proj/en/eudev/
PKG_SITES:=		http://dev.gentoo.org/~blueness/eudev/
PKG_LIBNAME:=		libudev
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		UDEV LIBUDEV
PKGSD_UDEV:=		Dynamic device management manager
PKGSC_LIBUDEV:=		libs
PKGSD_LIBUDEV:=		Dynamic device management library

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libmix
endif

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,UDEV,udev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBUDEV,libudev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-manpages \
			--datadir=${STAGING_TARGET_PREFIX}/usr/lib \
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

include ${TOPDIR}/mk/pkg-bottom.mk
