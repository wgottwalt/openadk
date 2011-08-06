# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		resource-agents
PKG_VERSION:=		3.9.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		b5d0c178082ff186c36ab145b5bbf5df
PKG_DESCR:=		Resource agents for clusters
PKG_SECTION:=		ha
PKG_URL:=		https://github.com/ClusterLabs/resource-agents
PKG_SITES:=		http://openadk.org/distfiles/

PKG_CFLINE_RESOURCE_AGENTS:=	depends on ADK_TARGET_LIB_GLIBC || ADK_TARGET_LIB_EGLIBC
PKG_HOST_DEPENDS:=	!darwin

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RESOURCE_AGENTS,resource-agents,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

resource-agents-install:
	$(INSTALL_DIR) $(IDIR_RESOURCE_AGENTS)/usr/share/cluster
	$(CP) $(WRKINST)/usr/share/cluster/*.sh \
		$(IDIR_RESOURCE_AGENTS)/usr/share/cluster

include ${TOPDIR}/mk/pkg-bottom.mk
