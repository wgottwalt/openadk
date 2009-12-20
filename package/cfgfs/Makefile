# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cfgfs
PKG_VERSION:=		1.0.6
PKG_RELEASE:=		5
PKG_DESCR:=		compressed config filesystem
PKG_SECTION:=		base
PKG_TARGET_DEPENDS:=	alix1c alix2d wrap foxboard ag241 rb532

WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}
NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CFGFS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

PKGDFLT_CFGFS=		y

BUILD_STYLE:=		auto

do-configure:
	mkdir -p ${WRKBUILD}
	${CP} ./src/* ${WRKBUILD}

do-install:
	${INSTALL_DIR} ${IDIR_CFGFS}/sbin
	${INSTALL_BIN} ${WRKBUILD}/fwcf.sh ${IDIR_CFGFS}/sbin/cfgfs
	${INSTALL_BIN} ${WRKBUILD}/fwcf.helper.out \
		${IDIR_CFGFS}/sbin/cfgfs.helper

include ${TOPDIR}/mk/pkg-bottom.mk
