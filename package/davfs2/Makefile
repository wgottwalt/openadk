# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		davfs2
PKG_VERSION=		1.3.3
PKG_RELEASE=		1
PKG_MD5SUM=		57def26e4d6d63527e01612d10fd0515
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=dav/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DAVFS2,davfs2,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--with-neon
CONFIGURE_ENV+=		LIBS=-liconv
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

ifeq (${ADK_PACKAGE_DAVFS2_FUSE},y)
DEPS=			fuse-utils, kmod-fuse, libfuse, libiconv, neon
else ifeq (${ADK_PACKAGE_DAVFS2_CODA},y)
DEPS=			kmod-fs-coda, libiconv, neon
else
DEPS=			kmod-fs-coda, fuse-utils, kmod-fuse, libfuse, libiconv, neon
endif

post-install:
	${INSTALL_DIR} ${IDIR_DAVFS2}/etc/davfs2
	${INSTALL_DIR} ${IDIR_DAVFS2}/usr/sbin
	$(CP) ${WRKINST}/etc/davfs2/{davfs2.conf,secrets} \
		${IDIR_DAVFS2}/etc/davfs2
	${INSTALL_BIN} ${WRKINST}/usr/sbin/mount.davfs \
		${IDIR_DAVFS2}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/umount.davfs \
		${IDIR_DAVFS2}/usr/sbin
	echo 'Depends: ${DEPS}' >>${IDIR_DAVFS2}/CONTROL/control

include ${TOPDIR}/mk/pkg-bottom.mk
