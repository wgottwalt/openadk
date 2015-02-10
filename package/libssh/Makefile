# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libssh
PKG_VERSION:=		0.6.4
PKG_RELEASE:=		1
PKG_HASH:=		7e3205e2e95bf35b23b83a6485a7d59abe7c7546d01b728f691cf0c374216b52
PKG_DESCR:=		secure shell library
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libopenssl zlib
PKG_BUILDDEP:=		cmake-host openssl zlib
PKG_URL:=		http://www.libssh.org/
PKG_SITES:=		https://red.libssh.org/attachments/download/107/
PKG_OPTS:=		dev

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSSH,libssh,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

WRKBUILD=               $(WRKDIR)/$(PKG_NAME)-obj
CONFIG_STYLE:=          cmake
CMAKE_FLAGS:=		-DOPENSSL_INCLUDE_DIRS='$(STAGING_TARGET_DIR)/usr/include' \
			-DOPENSSL_LIBRARIES='-lcrypto -lssl -lz' \
			-DZLIB_INCLUDE_DIR='$(STAGING_TARGET_DIR)/usr/include' \
			-DZLIB_LIBRARY='$(STAGING_TARGET_DIR)/usr/lib'

libssh-install:
	$(INSTALL_DIR) $(IDIR_LIBSSH)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libssh*.so* \
		$(IDIR_LIBSSH)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
