# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ethtool
PKG_VERSION:=		2.6.36
PKG_RELEASE:=		1
PKG_MD5SUM:=		3b2322695e9ee7bf447ebcdb85f93e83
PKG_DESCR:=		Display or change ethernet card settings
PKG_SECTION:=		net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=gkernel/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ETHTOOL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_ETHTOOL}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/ethtool ${IDIR_ETHTOOL}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
