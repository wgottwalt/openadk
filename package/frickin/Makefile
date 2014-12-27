# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		frickin
PKG_VERSION:=		1.3
PKG_RELEASE:=		9
PKG_HASH:=		e39b2209af8f519fb93c9ce776b523b4256653a840796161a89fbd9d23f72d66
PKG_DESCR:=		pptp proxy
PKG_SECTION:=		net/proxy
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=frickin/}
PKG_NOPARALLEL:=	1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FRICKIN,frickin,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
	${INSTALL_DIR} ${IDIR_FRICKIN}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/frickin ${IDIR_FRICKIN}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
