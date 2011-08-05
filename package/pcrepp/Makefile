# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		pcrepp
PKG_VERSION:=		0.9.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		1fe6ea8e23ece01fde2ce5fb4746acc2
PKG_DESCR:=		Cpp Wrapper classes for PCRE
PKG_SECTION:=		libs
PKG_URL:=		http://www.daemon.de/PCRE
PKG_SITES:=		http://www.daemon.de/idisk/Apps/pcre++/
PKG_DEPENDS:=		libpcre
PKG_BUILDDEP:=		pcre
PKG_NEED_CXX:=		1
PKG_CXX:=		pcrepp

PKG_CFLINE_PCREPP:=	depends on ADK_TARGET_LIB_EGLIBC || ADK_TARGET_LIB_GLIBC

DISTFILES:=		pcre++-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/pcre++-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PCREPP,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_PCREPP)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libpcre++.so* \
		$(IDIR_PCREPP)/usr/lib
	
include ${TOPDIR}/mk/pkg-bottom.mk
