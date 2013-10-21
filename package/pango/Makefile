# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		pango
PKG_VERSION:=		1.28.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		22ad1c8d3fda7e73b0798035f3dd96bc
PKG_DESCR:=		pango library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		libXft glib cairo libstdcxx fontconfig
PKG_URL:=		http://www.pango.org/
PKG_SITES:=		${MASTER_SITE_GNOME:=pango/1.28/}
PKG_NEED_CXX:=		1

PKG_ARCH_DEPENDS:=	!m68k

#DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz

PKG_SUBPKGS:=		PANGO PANGO_DEV
PKGSC_PANGO_DEV:=	devel
PKGSD_PANGO_DEV:=	pango headers

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PANGO,pango,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,PANGO_DEV,pango-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_PANGO_DEV},${PKGSC_PANGO_DEV},${PKG_OPTS}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
TARGET_LDFLAGS+=	-L$(STAGING_DIR)/usr/lib64 -L$(STAGING_DIR)/usr/lib32
CONFIGURE_ENV+=		ac_cv_path_EGREP="grep -E"

pango-install:
	$(INSTALL_DIR) $(IDIR_PANGO)/etc/pango
	$(INSTALL_DIR) $(IDIR_PANGO)/usr/lib $(IDIR_PANGO)/usr/lib/pango/1.6.0/modules
	$(INSTALL_DATA) ./files/pango.modules $(IDIR_PANGO)/etc/pango
	$(CP) $(WRKINST)/usr/lib/libpango*.so* $(IDIR_PANGO)/usr/lib
	$(CP) $(WRKINST)/usr/lib/pango/1.6.0/modules/*.so \
		$(IDIR_PANGO)/usr/lib/pango/1.6.0/modules

pango-dev-install:
	$(INSTALL_DIR) $(IDIR_PANGO_DEV)/usr/include
	${CP} $(WRKINST)/usr/include/* \
		$(IDIR_PANGO_DEV)/usr/include
	$(INSTALL_DIR) $(IDIR_PANGO_DEV)/usr/lib/pkgconfig
	${CP} $(WRKINST)/usr/lib/pkgconfig/*.pc \
		$(IDIR_PANGO_DEV)/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
