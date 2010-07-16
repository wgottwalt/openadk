# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		rpm
PKG_VERSION:=		4.7.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		224715646325df4cd3904e3ac9e16186
PKG_DESCR:=		Package Manager
PKG_SECTION:=		base
PKG_BUILDDEP+=		nss libdb
PKG_URL:=		http://www.rpm.org
PKG_SITES:=		http://rpm.org/releases/rpm-4.7.x/

DISTFILES:=		${PKG_NAME}-$(PKG_VERSION).tar.bz2

PKG_TARGET_DEPENDS:=    !foxboard
PKG_HOST_DEPENDS:=	!cygwin

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RPM,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TCPPFLAGS+=		-I${STAGING_DIR}/usr/include/nspr \
			-I${STAGING_DIR}/usr/include/nss
CONFIGURE_ARGS:=	--with-external-db \
			--without-lua

post-install:
	$(INSTALL_DIR) $(IDIR_RPM)/usr/bin $(IDIR_RPM)/usr/lib
	$(INSTALL_DIR) $(IDIR_RPM)/usr/lib/rpm
	$(INSTALL_BIN) $(WRKINST)/bin/rpm $(IDIR_RPM)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/rpm* $(IDIR_RPM)/usr/bin
	$(CP) $(WRKINST)/usr/lib/*.so* $(IDIR_RPM)/usr/lib
	$(CP) $(WRKINST)/usr/lib/rpm/* $(IDIR_RPM)/usr/lib/rpm

include ${TOPDIR}/mk/pkg-bottom.mk
