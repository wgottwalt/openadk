# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		stlink
PKG_VERSION:=		04dc7ead42f99d80696cd12496ee2299428675e7
PKG_RELEASE:=		1
PKG_DESCR:=		st flash utility
PKG_SECTION:=		dev/tools
HOST_BUILDDEP:=		cmake-host
PKG_SITES:=		https://github.com/texane/stlink.git

PKG_CFLINE_STLINK:=	depends on ADK_HOST_ONLY

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,STLINK,stlink,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		cmake

host-build:
	(cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} ${HOST_ALL_TARGET})

hostpost-install:
	(cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		DESTDIR=$(STAGING_HOST_DIR) ${HOST_FAKE_FLAGS} ${HOST_INSTALL_TARGET})

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
