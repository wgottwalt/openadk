# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		jikes
PKG_VERSION:=		1.22
PKG_RELEASE:=		1
PKG_MD5SUM:=		cda958c7fef6b43b803e1d1ef9afcb85
PKG_DESCR:=		jikes java compiler
PKG_SECTION:=		lang
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=jikes/Jikes/1.22/}

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.bz2

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,JIKES,jikes,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		auto

hostpost-install:
	$(INSTALL_DIR) ${STAGING_HOST_DIR}/usr/lib/jvm/bin/
	$(INSTALL_DIR) ${STAGING_HOST_DIR}/usr/lib/jvm/jre/bin/
	$(CP) ${STAGING_HOST_DIR}/usr/bin/jikes ${STAGING_HOST_DIR}/usr/lib/jvm/bin/javac
	$(CP) ${STAGING_HOST_DIR}/usr/bin/jikes ${STAGING_HOST_DIR}/usr/lib/jvm/jre/bin/javac


include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
