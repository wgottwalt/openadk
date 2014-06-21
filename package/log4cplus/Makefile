# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		log4cplus
PKG_VERSION:=		1.0.4
PKG_RELEASE:=		2
PKG_MD5SUM:=		977d0a390b3be1a4ad8cfab2e4dd3af3
PKG_DESCR:=		logging framework for c++
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		libpthread
PKG_BUILDDEP:=		libpthread
PKG_URL:=		http://log4cplus.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=log4cplus/log4cplus-stable/${PKG_VERSION}/}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LOG4CPLUS,log4cplus,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

log4cplus-install:
	${CP} ${WRKINST}/* ${IDIR_LOG4CPLUS}

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
