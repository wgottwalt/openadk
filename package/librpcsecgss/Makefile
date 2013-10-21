# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		librpcsecgss
PKG_VERSION:=		0.19
PKG_RELEASE:=		3
PKG_MD5SUM:=		b45ed565bdc3099023aa35830ec92997
PKG_DESCR:=		Secure RPC library for NFSv4
PKG_SECTION:=		libs
PKG_DEPENDS:=		libgssglue
PKG_BUILDDEP:=		libgssglue
PKG_SITES:=		http://www.citi.umich.edu/projects/nfsv4/linux/librpcsecgss/
PKG_OPTS:=		dev

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBRPCSECGSS,librpcsecgss,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_CPPFLAGS+=	-I$(STAGING_DIR)/usr/include/tirpc
TARGET_LDFLAGS+=	-ltirpc

librpcsecgss-install:
	$(INSTALL_DIR) $(IDIR_LIBRPCSECGSS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/librpcsecgss.so* $(IDIR_LIBRPCSECGSS)/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
