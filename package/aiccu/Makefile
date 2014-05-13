# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		aiccu
PKG_VERSION:=		20070115
PKG_RELEASE:=		11
PKG_MD5SUM:=		c9bcc83644ed788e22a7c3f3d4021350
PKG_DESCR:=		SixXS Automatic IPv6 Connectivity Client Utility
PKG_SECTION:=		ipv6
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://www.sixxs.net/
PKG_SITES:=		http://www.sixxs.net/archive/sixxs/aiccu/unix/

PKG_LIBC_DEPENDS:=	uclibc glibc

DISTFILES:=		$(PKG_NAME)_$(PKG_VERSION).tar.gz
WRKDIST=		${WRKDIR}/$(PKG_NAME)

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,AICCU,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

TARGET_CPPFLAGS+=	-D_REENTRANT -D_GNU_SOURCE -DAICCU_CONSOLE \
		 	-D_LINUX -DHAS_IFHEAD -DAICCU_TYPE=\"linux\"
TARGET_LDFLAGS+=	-pthread -lresolv
MAKE_FLAGS+=		CC='${TARGET_CC}' CFLAGS='${TARGET_CFLAGS}' LDFLAGS='${TARGET_LDFLAGS}'

do-install:
	$(INSTALL_DIR) $(IDIR_AICCU)/usr/sbin $(IDIR_AICCU)/etc
	$(INSTALL_BIN) $(WRKBUILD)/unix-console/aiccu $(IDIR_AICCU)/usr/sbin/
	$(INSTALL_DATA) $(WRKBUILD)/doc/aiccu.conf $(IDIR_AICCU)/etc/aiccu.conf

include ${TOPDIR}/mk/pkg-bottom.mk
