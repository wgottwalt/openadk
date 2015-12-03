# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		aiccu
PKG_VERSION:=		20070115
PKG_RELEASE:=		11
PKG_HASH:=		2260f426c13471169ccff8cb4a3908dc5f79fda18ddb6a55363e7824e6c4c760
PKG_DESCR:=		sixxs automatic ipv6 connectivity client utility
PKG_SECTION:=		net/ipv6
PKG_KDEPENDS:=		tun
PKG_NEEDS:=		threads
PKG_URL:=		http://www.sixxs.net/
PKG_SITES:=		http://www.sixxs.net/archive/sixxs/aiccu/unix/

PKG_LIBC_DEPENDS:=	uclibc-ng glibc

DISTFILES:=		$(PKG_NAME)_$(PKG_VERSION).tar.gz
WRKDIST=		${WRKDIR}/$(PKG_NAME)

include $(ADK_TOPDIR)/mk/package.mk

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

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
