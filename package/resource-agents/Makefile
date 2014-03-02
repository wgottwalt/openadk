# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		resource-agents
PKG_VERSION:=		3.9.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		b5d0c178082ff186c36ab145b5bbf5df
PKG_DESCR:=		Resource agents for clusters
PKG_SECTION:=		ha
PKG_BUILDDEP:=		glib cluster-glue
PKG_URL:=		https://github.com/ClusterLabs/resource-agents
PKG_SITES:=		http://openadk.org/distfiles/

PKG_LIBC_DEPENDS:=	glibc musl
PKG_ARCH_DEPENDS:=	x86 x86_64

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RESOURCE_AGENTS,resource-agents,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-ocf-root=/usr/lib/ocf

resource-agents-install:
	$(INSTALL_DIR) $(IDIR_RESOURCE_AGENTS)/usr/share/cluster
	$(CP) $(WRKINST)/usr/share/cluster/*.sh \
		$(IDIR_RESOURCE_AGENTS)/usr/share/cluster
	$(INSTALL_DIR) $(IDIR_RESOURCE_AGENTS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/* $(IDIR_RESOURCE_AGENTS)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
