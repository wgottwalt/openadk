# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		shat
PKG_VERSION:=		0.9.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		da06846f35838b14d1513523dad84d24
PKG_DESCR:=		a tool for nomadic routing
PKG_SECTION:=		net/misc
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=shat/}

PKG_LIBC_DEPENDS:=	uclibc glibc

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SHAT,shat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-build:
	${MAKE} -C ${WRKBUILD}/src \
		CC="${TARGET_CC}" LD=${TARGET_CROSS}ld \
		CFLAGS="${TARGET_CFLAGS} -Wall -I${WRKBUILD}/include/linux/include -I${WRKBUILD}/include -DVERSION=\\\"${PKG_VERSION}\\\" -DDROP_NETBIOS"

do-install:
	${INSTALL_DIR} ${IDIR_SHAT}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/src/shat{c,d} ${IDIR_SHAT}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
