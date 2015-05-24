# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libsquish
PKG_VERSION:=		1.10
PKG_RELEASE:=		1
PKG_HASH:=		a0118a79d927058b656e94dc4ffce5da37839962e4952be1fedbbdd901b42848
PKG_DESCR:=		c++ compression library
PKG_SECTION:=		libs/misc
PKG_SITES:=		http://sources.openelec.tv/devel/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION)-openelec.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}-$(PKG_VERSION)-openelec

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSQUISH,libsquish,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		INSTALL_DIR="${WRKINST}/usr"

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
