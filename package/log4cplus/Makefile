# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		log4cplus
PKG_VERSION:=		1.0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		977d0a390b3be1a4ad8cfab2e4dd3af3
PKG_DESCR:=		Logging framework for C++
PKG_SECTION:=		libs
PKG_DEPENDS:=		libpthread
PKG_BUILDDEP:=		libpthread
PKG_URL:=		http://log4cplus.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=log4cplus/log4cplus-stable/${PKG_VERSION}/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LOG4CPLUS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${CP} ${WRKINST}/* ${IDIR_LOG4CPLUS}

include ${TOPDIR}/mk/pkg-bottom.mk
