# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		taglib
PKG_VERSION:=		1.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		dcb8bd1b756f2843e18b1fdf3aaeee15
PKG_DESCR:=		Audio Meta-Data library
PKG_SECTION:=		libs
PKG_DEPENDS:=		zlib
PKG_BUILDDEP:=		zlib
PKG_URL:=		http://taglib.github.com/
PKG_SITES:=		http://openadk.org/distfiles/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TAGLIB,taglib,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

do-configure:
	(cd ${WRKBUILD} && cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .)

pre-install:
	$(INSTALL_DATA) ./files/taglib.pc $(WRKBUILD)/

taglib-install:
	$(INSTALL_DIR) $(IDIR_TAGLIB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libtag*.so* \
		$(IDIR_TAGLIB)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
