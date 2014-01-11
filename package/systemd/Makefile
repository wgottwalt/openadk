# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		systemd
PKG_VERSION:=		208
PKG_RELEASE:=		3
PKG_MD5SUM:=		df64550d92afbffb4f67a434193ee165
PKG_DESCR:=		System and Service Manager
PKG_SECTION:=		utils
PKG_DEPENDS:=		libblkid libcap
PKG_BUILDDEP:=		autotool usbutils glib kmod util-linux libcap
PKG_BUILDDEP+=		libgcrypt gperf-host
PKG_URL:=		http://freedesktop.org/wiki/Software/systemd/
PKG_SITES:=		http://www.freedesktop.org/software/systemd/
PKG_LIBNAME:=		libudev
PKG_OPTS:=		dev

PKG_LIBC_DEPENDS:=	eglibc glibc
PKG_SUBPKGS:=		UDEV LIBUDEV LIBGUDEV
PKGSC_LIBGUDEV:=	libs
PKGSD_LIBGUDEV:=	GUDEV library
PKGSC_LIBUDEV:=		libs
PKGSD_LIBUDEV:=		UDEV library
PKGSD_UDEV:=		Dynamic device management subsystem

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libmix
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,UDEV,udev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBUDEV,libudev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBGUDEV,libgudev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
TARGET_LDFLAGS+=	-lrt
CONFIGURE_ARGS+=	--disable-static \
			--without-python \
			--enable-gudev \
			--disable-manpages \
			--disable-polkit

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
