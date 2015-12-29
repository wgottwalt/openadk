# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXdmcp
PKG_VERSION:=		1.1.2
PKG_RELEASE:=		1
PKG_HASH:=		6f7c7e491a23035a26284d247779174dedc67e34e93cc3548b648ffdb6fc57c0
PKG_DESCR:=		display manager control protocol library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xproto
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxdmcp
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXDMCP,libxdmcp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libxdmcp-install:
	${INSTALL_DIR} ${IDIR_LIBXDMCP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXdmcp.so* ${IDIR_LIBXDMCP}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
