# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		eudev
PKG_VERSION:=		1.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		164df78f6f0093578a20bdd00335845f
PKG_DESCR:=		udev device manager
PKG_SECTION:=		utils
PKG_BUILDDEP:=		gperf-host glib
PKG_DEPENDS:=		glib
PKG_URL:=		http://www.gentoo.org/proj/en/eudev/
PKG_SITES:=		http://dev.gentoo.org/~blueness/eudev/
PKG_LIBNAME:=		libudev
PKG_OPTS:=		dev

PKG_SUBPKGS:=		UDEV LIBUDEV LIBGUDEV
PKGSC_LIBGUDEV:=	libs
PKGSD_LIBGUDEV:=	GUDEV library
PKGSC_LIBUDEV:=		libs
PKGSD_LIBUDEV:=		UDEV library
PKGSD_UDEV:=		Dynamic device management subsystem

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,UDEV,udev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBUDEV,libudev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBGUDEV,libgudev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-manpages \
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

libgudev-install:
	${INSTALL_DIR} ${IDIR_LIBGUDEV}/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgudev*.so* $(IDIR_LIBGUDEV)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
