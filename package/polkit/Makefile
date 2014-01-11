# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		polkit
PKG_VERSION:=		0.112
PKG_RELEASE:=		2
PKG_MD5SUM:=		23973dcfd8b92ab2b7db3a925642b76d
PKG_DESCR:=		application-level toolkit
PKG_SECTION:=		libs
PKG_BUILDDEP:=		autotool mozjs
PKG_DEPENDS:=		mozjs
PKG_URL:=		http://www.freedesktop.org/wiki/Software/polkit/
PKG_SITES:=		http://openadk.org/distfiles/
PKG_OPTS:=		dev

PKG_LIBC_DEPENDS:=	eglibc glibc

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,POLKIT,polkit,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autogen
CONFIGURE_ARGS+=	--disable-man-pages \
			--disable-examples \
			--enable-libsystemd-login=no \
			--without-systemdsystemunitdir \
			--with-authfw=shadow \
			--with-os-type=unknown

polkit-install:
	$(INSTALL_DIR) $(IDIR_POLKIT)/etc $(IDIR_POLKIT)/usr/bin
	$(CP) $(WRKINST)/etc/* $(IDIR_POLKIT)/etc
	$(INSTALL_DIR) $(IDIR_POLKIT)/usr/lib/polkit-1
	$(CP) $(WRKINST)/usr/lib/libpolkit*.so* \
		$(IDIR_POLKIT)/usr/lib
	$(CP) $(WRKINST)/usr/lib/polkit-1/* \
		$(IDIR_POLKIT)/usr/lib/polkit-1
	$(CP) $(WRKINST)/usr/bin/* $(IDIR_POLKIT)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
