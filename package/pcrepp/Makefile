# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		pcrepp
PKG_VERSION:=		0.9.5
PKG_RELEASE:=		2
PKG_MD5SUM:=		1fe6ea8e23ece01fde2ce5fb4746acc2
PKG_DESCR:=		Cpp Wrapper classes for PCRE
PKG_SECTION:=		libs
PKG_URL:=		http://www.daemon.de/PCRE
PKG_SITES:=		http://www.daemon.de/idisk/Apps/pcre++/
PKG_DEPENDS:=		libpcre
PKG_BUILDDEP:=		pcre
PKG_NEED_CXX:=		1
PKG_CXX:=		pcrepp
PKG_OPTS:=		dev

PKG_LIBC_DEPENDS:=	glibc musl

DISTFILES:=		pcre++-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/pcre++-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PCREPP,pcrepp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

pcrepp-install:
	$(INSTALL_DIR) $(IDIR_PCREPP)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libpcre++.so* \
		$(IDIR_PCREPP)/usr/lib
	
include ${TOPDIR}/mk/pkg-bottom.mk
