# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		pango
PKG_VERSION:=		1.36.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		d9532826e95bdb374355deebc42441bb
PKG_DESCR:=		library for laying out and rendering of text
PKG_SECTION:=		libs
PKG_DEPENDS:=		libstdcxx
PKG_BUILDDEP:=		libXft glib cairo harfbuzz libstdcxx fontconfig
HOST_BUILDDEP:=		cairo-host harfbuzz-host
PKG_URL:=		http://www.pango.org/
PKG_SITES:=		${MASTER_SITE_GNOME:=pango/1.36/}
PKG_OPTS:=		dev

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libonly
endif

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,PANGO,pango,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,PANGO,pango,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto
CONFIGURE_ENV+=		ac_cv_path_EGREP="grep -E"

pango-install:
	$(INSTALL_DIR) $(IDIR_PANGO)/etc/pango
	$(INSTALL_DIR) $(IDIR_PANGO)/usr/lib/pango/1.8.0/modules
	$(INSTALL_DATA) ./files/pango.modules $(IDIR_PANGO)/etc/pango
	$(CP) $(WRKINST)/usr/lib/libpango*.so* $(IDIR_PANGO)/usr/lib
	$(CP) $(WRKINST)/usr/lib/pango/1.8.0/modules/*.so \
		$(IDIR_PANGO)/usr/lib/pango/1.8.0/modules

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
