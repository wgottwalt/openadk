# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		classpath
PKG_VERSION:=		0.99
PKG_RELEASE:=		1
PKG_MD5SUM:=		0ae1571249172acd82488724a3b8acb4 acfa69f928a0f1653555bda73091efca
PKG_DESCR:=		java classpath
PKG_SECTION:=		dev/tools
PKG_BUILDDEP:=		gtk+ gdk-pixbuf orbit2 gconf
PKG_DEPENDS:=		libgtk gdk-pixbuf orbit2 gconf
HOST_BUILDDEP:=		gcj-host ecj-host
PKG_URL:=		http://www.gnu.org/software/classpath/home.html
PKG_SITES:=		ftp.gnu.org/classpath/ \
			http://www.antlr3.org/download/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz antlr-3.5.2-complete.jar

PKG_HOST_DEPENDS:=	linux

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,CLASSPATH,classpath,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,CLASSPATH,classpath,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_CONFIGURE_ARGS+=	--disable-plugin \
			--enable-tools \
			--with-antlr-jar=${WRKBUILD}/antlr-3.5.2-complete.jar \
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

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
