# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		lvm
PKG_VERSION:=		2.02.45
PKG_RELEASE:=		1
PKG_MD5SUM:=		440daa01b8f2ec4fe97b1cc621108220
DISTFILES:=		LVM2.${PKG_VERSION}.tgz
MASTER_SITES:=		ftp://sources.redhat.com/pub/lvm2/

WRKDIST=		${WRKDIR}/LVM2.${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LVM,lvm,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--with-user="" --with-group="" \
			--with-optimisation="" \
			--with-lvm1=none \
			--enable-static_link \
			--with-kernel-dir=${LINUX_DIR}
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LVM}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/lvm.static ${IDIR_LVM}/usr/sbin/lvm

include ${TOPDIR}/mk/pkg-bottom.mk
