# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mrd6
PKG_VERSION:=		0.9.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		93ada53bb414b9d622f80a717bc2694b
MASTER_SITES:=		http://www.openadk.org/distfiles/
WRKBUILD=		${WRKSRC}/src

include ${TOPDIR}/mk/package.mk

ifeq (${ADK_COMPILE_MRD6_WITH_UCLIBCXX},y)
TCXXFLAGS+=		-fno-builtin -nostdinc++ -nodefaultlibs -I${STAGING_DIR}/usr/include/uClibc++
TLDFLAGS+=		-nodefaultlibs -luClibc++ -shared
PKG_DEPENDS:=		uclibc++
else
PKG_DEPENDS:=		libstdcxx
endif

$(eval $(call PKG_template,MRD6,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS}))

BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
XAKE_FLAGS+=		EXTRA_FLAGS="${TCFLAGS}" 

post-install:
	${INSTALL_DIR} ${WRKINST}/etc/init.d
	${INSTALL_DATA} files/${PKG_NAME}.conf ${WRKINST}/etc
	${INSTALL_BIN} files/${PKG_NAME}.init ${WRKINST}/etc/init.d/${PKG_NAME}
	${INSTALL_DIR} ${IDIR_MRD6}/usr/sbin
	${CP} ${WRKINST}/* ${IDIR_MRD6}/

include ${TOPDIR}/mk/pkg-bottom.mk
