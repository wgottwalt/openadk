# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		cmake
PKG_VERSION:=		3.0.2
PKG_RELEASE:=		1
PKG_HASH:=		6b4ea61eadbbd9bec0ccb383c29d1f4496eacc121ef7acf37c7a24777805693e
PKG_DESCR:=		cmake utility
PKG_SECTION:=		dev/tools
PKG_URL:=		http://www.cmake.org/
PKG_SITES:=		http://www.cmake.org/files/v3.0/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_CFLINE_CMAKE:=	depends on ADK_HOST_ONLY

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,CMAKE,cmake,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		manual

host-configure:
	(cd $(WRKBUILD); ./configure --prefix=${STAGING_HOST_DIR}/usr )

host-build:
	(cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} ${HOST_ALL_TARGET}) $(MAKE_TRACE)

cmake-hostinstall:
	cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_FAKE_FLAGS} ${HOST_INSTALL_TARGET} $(MAKE_TRACE)

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
