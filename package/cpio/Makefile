# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cpio
PKG_VERSION:=		2.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		351ab3d38d8949913e478cc23b9d6ad4
PKG_DESCR:=		copies files into or out of a cpio archive
PKG_SECTION:=		net
PKG_URL:=		http://www.gnu.org/software/cpio/
PKG_SITES:=		${MASTER_SITE_GNU:=cpio/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CPIO,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_CPIO}/usr/bin
	${CP} ${WRKINST}/usr/bin/cpio ${IDIR_CPIO}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
