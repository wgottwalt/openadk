# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		rdate
PKG_VERSION:=		20070817
PKG_RELEASE:=		4
PKG_HASH:=		905fc261c5e15da299895027326a0ea7b45b947f8df7ad82971d778061869e4b
PKG_DESCR:=		small ntp client
PKG_SECTION:=		net/ntp
PKG_SITES:=		${MASTER_SITE_MIRBSD:distfiles/=dist/mir/rdate/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RDATE,rdate,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
TARGET_CPPFLAGS+=	-D_GNU_SOURCE
MAKE_FILE=		GNUmakefile

rdate-install:
	${INSTALL_DIR} ${IDIR_RDATE}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/rdate ${IDIR_RDATE}/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
