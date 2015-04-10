# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		pcrepp
PKG_VERSION:=		0.9.5
PKG_RELEASE:=		2
PKG_HASH:=		77ee9fc1afe142e4ba2726416239ced66c3add4295ab1e5ed37ca8a9e7bb638a
PKG_DESCR:=		cpp wrapper classes for pcre
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		libpcre
PKG_BUILDDEP:=		pcre
PKG_URL:=		http://www.daemon.de/PCRE
PKG_SITES:=		http://www.daemon.de/idisk/Apps/pcre++/
PKG_CXX:=		PCREPP
PKG_OPTS:=		dev

DISTFILES:=		pcre++-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/pcre++-${PKG_VERSION}

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PCREPP,pcrepp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

pcrepp-install:
	$(INSTALL_DIR) $(IDIR_PCREPP)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libpcre++.so* \
		$(IDIR_PCREPP)/usr/lib
	
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
