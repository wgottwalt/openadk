# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		openocd
PKG_VERSION:=		0.10.0-rc1
PKG_RELEASE:=		1
PKG_HASH:=		e1892003b2d992a54b882e1096fbeea80eec742071b4f6402cacd9173d7c6191
PKG_DESCR:=		jtag flash and debugging utility
PKG_SECTION:=		dev/tools
HOST_BUILDDEP:=		libusb-host
PKG_URL:=		http://openocd.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=openocd/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

PKG_CFLINE_OPENOCD:=	depends on ADK_HOST_ONLY

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,OPENOCD,openocd,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		auto

HOST_CONFIGURE_ARGS+=	--with-jim-shared=no \
			--disable-shared

openocd-hostinstall:
	cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_FAKE_FLAGS} ${HOST_INSTALL_TARGET} $(MAKE_TRACE)

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
