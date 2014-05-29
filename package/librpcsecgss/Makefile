# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		librpcsecgss
PKG_VERSION:=		0.19
PKG_RELEASE:=		3
PKG_MD5SUM:=		b45ed565bdc3099023aa35830ec92997
PKG_DESCR:=		secure rpc library for nfsv4
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libgssglue libtirpc
PKG_BUILDDEP:=		libgssglue libtirpc autotool
PKG_SITES:=		http://www.citi.umich.edu/projects/nfsv4/linux/librpcsecgss/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_LIBC_DEPENDS:=	uclibc glibc

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBRPCSECGSS,librpcsecgss,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
TARGET_CPPFLAGS+=	-I$(STAGING_TARGET_DIR)/usr/include/tirpc
TARGET_LDFLAGS+=	-ltirpc

librpcsecgss-install:
	$(INSTALL_DIR) $(IDIR_LIBRPCSECGSS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/librpcsecgss.so* $(IDIR_LIBRPCSECGSS)/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
