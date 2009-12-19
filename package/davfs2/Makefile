# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		davfs2
PKG_VERSION=		1.3.3
PKG_RELEASE=		1
PKG_BUILDDEP+=		libiconv neon
ifneq (${ADK_PACKAGE_DAVFS2_FUSE}${ADK_PACKAGE_DAVFS2_BOTH},)
PKG_BUILDDEP+=		fuse
endif
PKG_MD5SUM=		57def26e4d6d63527e01612d10fd0515
PKG_DESCR:=		WebDAV filesystem
PKG_SECTION:=		admin
PKG_URL:=		http://savannah.nongnu.org/projects/davfs2
PKG_SITES=		${MASTER_SITE_SOURCEFORGE:=dav/}

include ${TOPDIR}/mk/package.mk

ifeq (${ADK_PACKAGE_DAVFS2_FUSE},y)
PKG_DEPENDS:=			fuse-utils kmod-fuse libiconv neon
else ifeq (${ADK_PACKAGE_DAVFS2_CODA},y)
PKG_DEPENDS:=			kmod-fs-coda libiconv neon
else
PKG_DEPENDS:=			kmod-fs-coda fuse-utils kmod-fuse libiconv neon
endif

$(eval $(call PKG_template,DAVFS2,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--with-neon
CONFIGURE_ENV+=		LIBS=-liconv
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_DAVFS2}/etc/davfs2
	${INSTALL_DIR} ${IDIR_DAVFS2}/usr/sbin
	$(CP) ${WRKINST}/etc/davfs2/{davfs2.conf,secrets} \
		${IDIR_DAVFS2}/etc/davfs2
	${INSTALL_BIN} ${WRKINST}/usr/sbin/mount.davfs \
		${IDIR_DAVFS2}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/umount.davfs \
		${IDIR_DAVFS2}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
