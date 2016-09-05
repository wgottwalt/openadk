# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		genimage
PKG_VERSION:=		9
PKG_RELEASE:=		1
PKG_HASH:=		69f35af7edf6f4dbdac7a18ddc69dcf38c501e43d8b50c524555754c51479078
PKG_DESCR:=		image creation utility
PKG_SECTION:=		dev/tools
HOST_BUILDDEP:=		confuse
PKG_URL:=		http://public.pengutronix.de/software/genimage/
PKG_SITES:=		http://public.pengutronix.de/software/genimage/

PKG_CFLINE_GENIMAGE:=	depends on ADK_HOST_ONLY

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,GENIMAGE,genimage,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_CPPFLAGS+=		-D_GNU_SOURCE

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
