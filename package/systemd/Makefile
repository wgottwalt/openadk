# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		systemd
PKG_VERSION:=		208
PKG_RELEASE:=		4
PKG_MD5SUM:=		df64550d92afbffb4f67a434193ee165
PKG_DESCR:=		System and Service Manager
PKG_SECTION:=		utils
PKG_DEPENDS:=		libblkid libcap
PKG_BUILDDEP:=		autotool usbutils glib kmod util-linux libcap
PKG_BUILDDEP+=		libgcrypt gperf-host
PKG_URL:=		http://freedesktop.org/wiki/Software/systemd/
PKG_SITES:=		http://www.freedesktop.org/software/systemd/

PKG_LIBC_DEPENDS:=	eglibc glibc
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SYSTEMD,systemd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
TARGET_LDFLAGS+=	-lrt
CONFIGURE_ARGS+=	--disable-static \
			--without-python \
			--enable-gudev \
			--disable-manpages \
			--disable-polkit

# TODO
systemd-install:

include ${TOPDIR}/mk/pkg-bottom.mk
