# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		classpath
PKG_VERSION:=		0.98
PKG_RELEASE:=		1
PKG_MD5SUM:=		90c6571b8b0309e372faa0f9f6255ea9
PKG_DESCR:=		GNU Classpath
PKG_SECTION:=		lang
PKG_BUILDDEP:=		gtk+ gdk-pixbuf orbit2 gconf
PKG_DEPENDS:=		libgtk gdk-pixbuf orbit2 gconf
PKG_URL:=		http://www.gnu.org/software/classpath/home.html
PKG_SITES:=		${MASTER_SITE_GNU:=classpath/}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CLASSPATH,classpath,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-plugin \
			--disable-tools \
			--disable-examples

classpath-install:
	$(INSTALL_DIR) $(IDIR_CLASSPATH)/usr/share/classpath
	$(CP) $(WRKINST)/usr/share/classpath/glibj.zip \
		$(IDIR_CLASSPATH)/usr/share/classpath
	$(INSTALL_DIR) $(IDIR_CLASSPATH)/usr/lib/classpath
	$(CP) $(WRKINST)/usr/lib/classpath/lib*so.* \
		$(IDIR_CLASSPATH)/usr/lib/classpath
	# install to staging directory
	$(INSTALL_DIR) $(STAGING_DIR)/usr/share/classpath
	$(CP) $(WRKINST)/usr/share/classpath/glibj.zip \
		$(STAGING_DIR)/usr/share/classpath

include ${TOPDIR}/mk/pkg-bottom.mk
