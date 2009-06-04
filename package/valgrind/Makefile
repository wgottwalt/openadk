# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		valgrind
PKG_VERSION:=		3.3.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		0539e2fa4aadb2cd4ca4bba65b1fe8b5
PKG_DESCR:=		memory management debugging
PKG_SECTION:=		utils
PKG_URL:=		http://valgrind.org
PKG_SITES:=		http://valgrind.org/downloads/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,VALGRIND,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--disable-tls
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	$(INSTALL_DIR) $(IDIR_VALGRIND)/usr/bin
	$(INSTALL_DIR) $(IDIR_VALGRIND)/usr/lib/valgrind/${ARCH}-linux
	$(INSTALL_BIN) $(WRKINST)/usr/bin/valgrind $(IDIR_VALGRIND)/usr/bin/
	$(CP) $(WRKINST)/usr/lib/valgrind/${ARCH}-linux/* \
		$(IDIR_VALGRIND)/usr/lib/valgrind/${ARCH}-linux
	rm $(IDIR_VALGRIND)/usr/lib/valgrind/${ARCH}-linux/*.a
	touch $(IDIR_VALGRIND)/usr/lib/valgrind/default.supp

include ${TOPDIR}/mk/pkg-bottom.mk
