# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		cmake
PKG_VERSION:=		2.8.12
PKG_RELEASE:=		2
PKG_MD5SUM:=		105bc6d21cc2e9b6aff901e43c53afea
PKG_DESCR:=		cmake utility
PKG_SECTION:=		lang
PKG_URL:=		http://www.cmake.org/
PKG_SITES:=		http://www.cmake.org/files/v2.8/

PKG_CFLINE_CMAKE:=	depends on ADK_BROKEN

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,CMAKE,cmake,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,CMAKE,cmake,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

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

do-configure:
	(cd $(WRKBUILD); ./configure --prefix=/usr)

cmake-install:
	$(INSTALL_DIR) $(IDIR_CMAKE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/cmake \
		$(IDIR_CMAKE)/usr/bin

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
