# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		lsof
PKG_VERSION:=		4.83
PKG_RELEASE:=		1
PKG_MD5SUM:=		243089ccf3672c64b33ec8c9ef2a2a48
PKG_DESCR:=		list open files
PKG_SECTION:=		misc
PKG_URL:=		http://people.freebsd.org/~abe/
PKG_SITES:=		ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/

DISTFILES:=             ${PKG_NAME}_${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}_${PKG_VERSION}/${PKG_NAME}_${PKG_VERSION}_src

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LSOF,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_PROG:=	Configure
CONFIG_STYLE:=		minimal
CONFIGURE_ARGS+=	-n linux
XAKE_FLAGS+=		CC='${TARGET_CC}'
INSTALL_STYLE:=		manual

post-extract:
	(cd ${WRKDIR}/${PKG_NAME}_${PKG_VERSION}; \
		tar xf ${PKG_NAME}_${PKG_VERSION}_src.tar)

do-install:
	$(INSTALL_DIR) $(IDIR_LSOF)/usr/sbin
	$(INSTALL_BIN) $(WRKBUILD)/lsof \
		$(IDIR_LSOF)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
