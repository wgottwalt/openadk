# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		rpm
PKG_VERSION:=		5.3.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		08027af2368ecad8060f9f5bf46c2bd9
PKG_DESCR:=		Package Manager
PKG_SECTION:=		base
PKG_URL:=		http://www.rpm.org/
PKG_SITES:=		http://rpm5.org/files/rpm/rpm-5.3/

PKG_HOST_DEPENDS:=	!cygwin !darwin
PKG_ARCH_DEPENDS:=	!cris

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RPM,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_cv_va_copy=no
CONFIGURE_ARGS+=	--with-usecrypto=BeeCrypt \
			--with-beecrypt=internal \
			--with-dbapi=db \
			--with-sqlite=none \
			--without-python \
			--without-perl \
			--without-ruby \
			--without-lua

post-install:
	$(INSTALL_DIR) $(IDIR_RPM)/usr/bin $(IDIR_RPM)/usr/lib/rpm
	$(INSTALL_BIN) $(WRKINST)/usr/bin/rpm* $(IDIR_RPM)/usr/bin
	$(CP) $(WRKINST)/usr/lib/*.so* $(IDIR_RPM)/usr/lib
	$(CP) $(WRKINST)/usr/lib/rpm/* $(IDIR_RPM)/usr/lib/rpm

include ${TOPDIR}/mk/pkg-bottom.mk
