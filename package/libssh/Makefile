# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libssh
PKG_VERSION:=		0.6.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		66cf16e77f60913b4d54f18c92cdbf71
PKG_DESCR:=		secure shell library
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libopenssl zlib
PKG_BUILDDEP:=		cmake-host openssl zlib
PKG_URL:=		http://www.libssh.org/
PKG_SITES:=		https://red.libssh.org/attachments/download/87/
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSSH,libssh,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

WRKBUILD=               ${WRKDIR}/${PKG_NAME}-obj
CONFIG_STYLE:=          manual

do-configure:
	(cd $(WRKBUILD) && PATH='${HOST_PATH}' \
		cmake -DCMAKE_SYSTEM_NAME=Linux \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DOPENSSL_ROOT_DIR='$(STAGING_TARGET_DIR)/usr' \
		-DZLIB_ROOT_DIR='$(STAGING_TARGET_DIR)/usr' $(WRKSRC)/)

libssh-install:
	$(INSTALL_DIR) $(IDIR_LIBSSH)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libssh*.so* \
		$(IDIR_LIBSSH)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
