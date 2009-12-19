# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		fuse
PKG_VERSION:=		2.7.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		4879f06570d2225667534c37fea04213
PKG_DESCR:=		Filesystem in Userspace (utilities)
PKG_SECTION:=		admin
PKG_DEPENDS:=		kmod-fuse
PKG_URL:=		http://fuse.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=${PKG_NAME}/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FUSE_UTILS,fuse-utils,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--enable-lib \
			--disable-shared \
			--enable-static \
			--enable-util \
			--enable-example \
			--disable-auto-modprobe \
			--disable-mtab \
			--disable-kernel-module
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_FUSE_UTILS}/usr/bin
	${CP} ${WRKINST}/usr/bin/fusermount ${IDIR_FUSE_UTILS}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
