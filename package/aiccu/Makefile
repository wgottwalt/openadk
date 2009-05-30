# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		aiccu
PKG_VERSION:=		20070115
PKG_RELEASE:=		7
PKG_MD5SUM:=		c9bcc83644ed788e22a7c3f3d4021350
PKG_DESCR:=		SixXS Automatic IPv6 Connectivity Client Utility
PKG_SECTION:=		net
PKG_DEPENDS:=		kmod-ipv6 libpthread
PKG_URL:=		http://www.sixxs.net
PKG_SITES:=		http://www.sixxs.net/archive/sixxs/aiccu/unix/

DISTFILES:=		$(PKG_NAME)_$(PKG_VERSION).tar.gz
WRKDIST=		${WRKDIR}/$(PKG_NAME)

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,AICCU,aiccu,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TCFLAGS+=	-D_REENTRANT -D_GNU_SOURCE -DAICCU_CONSOLE \
		-D_LINUX -DHAS_IFHEAD -DAICCU_TYPE=\"linux\"
TLDFLAGS+=	-lpthread -lresolv
BUILD_STYLE=	auto
MAKE_FLAGS+=	CC='${TARGET_CC}' CFLAGS='${TCFLAGS}' LDFLAGS='${TLDFLAGS}'

do-install:
	$(INSTALL_DIR) $(IDIR_AICCU)/usr/sbin
	$(INSTALL_DIR) $(IDIR_AICCU)/etc/init.d
	$(INSTALL_BIN) $(WRKBUILD)/unix-console/aiccu $(IDIR_AICCU)/usr/sbin/
	$(INSTALL_BIN) ./files/aiccu.init \
		$(IDIR_AICCU)/etc/init.d/aiccu
	$(INSTALL_DATA) $(WRKBUILD)/doc/aiccu.conf $(IDIR_AICCU)/etc/aiccu.conf

include ${TOPDIR}/mk/pkg-bottom.mk
