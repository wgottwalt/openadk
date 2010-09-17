# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		qingy
PKG_VERSION:=		0.9.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		34f40172a71e9a6c2c77ddce11d2a63a
PKG_DESCR:=		a DirectFB getty replacement
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		directfb libxscrnsaver
PKG_BUILDDEP:=		DirectFB libXScrnSaver
PKG_URL:=		http://qingy.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=qingy/}

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,QINGY,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-screen-savers \
			--disable-optimizations \
			--disable-pam \
			--disable-crypto

post-install:
	$(INSTALL_DIR) $(IDIR_QINGY)/etc/qingy/sessions
	${INSTALL_BIN} ./files/{pre,post}_GUI.sh ${IDIR_QINGY}/etc/qingy/
	${INSTALL_DATA} ./files/{settings,welcomes} ${IDIR_QINGY}/etc/qingy/
	touch ${IDIR_QINGY}/etc/qingy/sessions/.keep_me
	$(INSTALL_DIR) $(IDIR_QINGY)/usr/lib/qingy
	${CP} $(WRKINST)/usr/lib/qingy/libqingy*.so ${IDIR_QINGY}/usr/lib/qingy/
	$(INSTALL_DIR) $(IDIR_QINGY)/usr/sbin
	${INSTALL_BIN} $(WRKINST)/usr/sbin/qingy* ${IDIR_QINGY}/usr/sbin/
	$(INSTALL_DIR) $(IDIR_QINGY)/usr/share/qingy
	${CP} $(WRKINST)/usr/share/qingy/themes ${IDIR_QINGY}/usr/share/

include ${TOPDIR}/mk/pkg-bottom.mk
