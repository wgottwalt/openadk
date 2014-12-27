# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		jikes
PKG_VERSION:=		1.22
PKG_RELEASE:=		1
PKG_HASH:=		0cb02c763bc441349f6d38cacd52adf762302cce3a08e269f1f75f726e6e14e3
PKG_DESCR:=		java compiler
PKG_BUILDDEP:=		jikes-host
PKG_SECTION:=		dev/lang
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=jikes/Jikes/1.22/}

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.bz2

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,JIKES,jikes,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,JIKES,jikes,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

hostpost-install:
	$(INSTALL_DIR) ${STAGING_HOST_DIR}/usr/lib/jvm/bin/
	$(INSTALL_DIR) ${STAGING_HOST_DIR}/usr/lib/jvm/jre/bin/
	$(CP) ${STAGING_HOST_DIR}/usr/bin/jikes ${STAGING_HOST_DIR}/usr/lib/jvm/bin/javac
	$(CP) ${STAGING_HOST_DIR}/usr/bin/jikes ${STAGING_HOST_DIR}/usr/lib/jvm/jre/bin/javac

jikes-install:

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
