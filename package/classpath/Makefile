# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		classpath
PKG_VERSION:=		0.98
PKG_RELEASE:=		1
PKG_MD5SUM:=		90c6571b8b0309e372faa0f9f6255ea9
PKG_DESCR:=		java classpath
PKG_SECTION:=		dev/tools
PKG_BUILDDEP:=		gtk+ gdk-pixbuf orbit2 gconf
PKG_DEPENDS:=		libgtk gdk-pixbuf orbit2 gconf
PKG_URL:=		http://www.gnu.org/software/classpath/home.html
PKG_SITES:=		${MASTER_SITE_GNU:=classpath/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_HOST_DEPENDS:=	linux
PKG_ARCH_DEPENDS:=	!arm

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,CLASSPATH,classpath,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,CLASSPATH,classpath,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_STYLE:=		auto
HOST_CONFIGURE_ARGS+=	--disable-plugin \
			--disable-tools \
			--disable-examples \
			--disable-gtk-peer \
			--disable-gconf-peer \
			--disable-alsa \
			--disable-Werror \
			--without-x
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
	$(INSTALL_DIR) $(STAGING_TARGET_DIR)/usr/share/classpath
	$(CP) $(WRKINST)/usr/share/classpath/glibj.zip \
		$(STAGING_TARGET_DIR)/usr/share/classpath

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
