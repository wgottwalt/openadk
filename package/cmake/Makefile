# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		cmake
PKG_VERSION:=		2.8.12
PKG_RELEASE:=		2
PKG_MD5SUM:=		105bc6d21cc2e9b6aff901e43c53afea
PKG_DESCR:=		cmake utility
PKG_SECTION:=		dev/tools
PKG_URL:=		http://www.cmake.org/
PKG_SITES:=		http://www.cmake.org/files/v2.8/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_CFLINE_CMAKE:=	depends on ADK_HOST_ONLY

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,CMAKE,cmake,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		manual
CONFIG_STYLE:=		manual
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s

host-configure:
	(cd $(WRKBUILD); ./configure --prefix=/usr)

host-build:
	(cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} ${HOST_ALL_TARGET})

cmake-hostinstall:
	$(INSTALL_BIN) $(WRKBUILD)/bin/cmake \
		$(STAGING_HOST_DIR)/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
