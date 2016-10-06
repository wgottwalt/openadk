# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		device-tree-compiler
PKG_VERSION:=		b06e55c88b9b922ff7e25cd62a4709b65524f0fc
PKG_GIT:=		hash
PKG_RELEASE:=		1
PKG_DESCR:=		compiler for dts files
PKG_SECTION:=		sys/misc
HOST_BUILDDEP:=		m4-host flex-host bison-host
PKG_URL:=		http://www.devicetree.org/Device_Tree_Compiler
PKG_SITES:=		https://git.kernel.org/pub/scm/utils/dtc/dtc.git

PKG_CFLINE_DEVICE_TREE_COMPILER:=	depends on ADK_HOST_ONLY

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,DEVICE_TREE_COMPILER,device-tree-compiler,$(PKG_VERSION)-$(PKG_RELEASE)))

HOST_STYLE:=		manual

host-build:
	(cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} dtc)

device-tree-compiler-hostinstall:
	$(INSTALL_DIR) $(STAGING_HOST_DIR)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/dtc $(STAGING_HOST_DIR)/usr/bin

include $(ADK_TOPDIR)/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
