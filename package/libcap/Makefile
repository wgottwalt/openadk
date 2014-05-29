# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libcap
PKG_VERSION:=		2.22
PKG_RELEASE:=		3
PKG_MD5SUM:=		ce64058bdb3f086ddbfca8ce6c919845
PKG_DESCR:=		capabilities library
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		pam
PKG_URL:=		http://www.friedhoff.org/posixfilecaps.html
PKG_SITES:=		http://openadk.org/distfiles/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBCAP,libcap,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CPPFLAGS_FOR_BUILD+=	-I$(STAGING_TARGET_DIR)/usr/include
CONFIG_STYLE:=		manual

libcap-install:
	$(INSTALL_DIR) $(IDIR_LIBCAP)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libcap*.so* \
		$(IDIR_LIBCAP)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
