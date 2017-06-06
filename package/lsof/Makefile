# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		lsof
PKG_VERSION:=		4.89
PKG_RELEASE:=		2
PKG_HASH:=		5d08da7ebe049c9d9a6472d6afb81aa5af54c4733a3f8822cbc22b57867633c9
PKG_DESCR:=		list open files
PKG_SECTION:=		sys/utils
PKG_DEPENDS:=		libtirpc
PKG_BUILDDEP:=		libtirpc
PKG_URL:=		http://people.freebsd.org/~abe/
PKG_SITES:=		https://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/

PKG_LIBC_DEPENDS:=	uclibc-ng glibc

DISTFILES:=             ${PKG_NAME}_${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}_${PKG_VERSION}
WRKSRC=			${WRKDIR}/${PKG_NAME}_${PKG_VERSION}/${PKG_NAME}_${PKG_VERSION}_src

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LSOF,lsof,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		minimal
CONFIGURE_PROG:=	Configure
CONFIGURE_ARGS:=	-n linux
XAKE_FLAGS+=		CC='${TARGET_CC}' CFLAGS='${TARGET_CFLAGS} -I$(STAGING_TARGET_DIR)/usr/include/tirpc'
XAKE_FLAGS+=		CFGL='${TARGET_LDFLAGS} -L./lib -llsof -ltirpc'
INSTALL_STYLE:=		manual

post-extract:
	(cd ${WRKDIR}/${PKG_NAME}_${PKG_VERSION}; \
		tar xf ${PKG_NAME}_${PKG_VERSION}_src.tar)

do-install:
	$(INSTALL_DIR) $(IDIR_LSOF)/usr/sbin
	$(INSTALL_BIN) $(WRKBUILD)/lsof \
		$(IDIR_LSOF)/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
