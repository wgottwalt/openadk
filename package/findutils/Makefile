# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		findutils
PKG_VERSION:=		4.4.2
PKG_RELEASE:=		4
PKG_MD5SUM:=		351cc4adb07d54877fa15f75fb77d39f
PKG_DESCR:=		utilities for finding files
PKG_SECTION:=		utils
PKG_DEPENDS:=		libpthread
PKG_BUILDDEP:=		autotool
PKG_URL:=		http://www.gnu.org/software/findutils/
PKG_SITES:=		http://ftp.gnu.org/pub/gnu/findutils/

PKG_SUBPKGS:=		FIND XARGS LOCATE
PKGSD_LOCATE:=		locate utility
PKGSD_XARGS:=		xargs utility

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,FINDUTILS,findutils,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,FIND,find,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,XARGS,xargs,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_XARGS},${PKG_SECTION}))
$(eval $(call PKG_template,LOCATE,locate,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LOCATE},${PKG_SECTION}))

HOST_STYLE:=		auto
AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ENV+=		gl_cv_func_wcwidth_works=yes \
			ac_cv_func_working_mktime=yes

find-install:
	$(INSTALL_DIR) $(IDIR_FIND)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/find \
		 $(IDIR_FIND)/usr/bin

xargs-install:
	$(INSTALL_DIR) $(IDIR_XARGS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xargs \
		 $(IDIR_XARGS)/usr/bin

locate-install:
	${INSTALL_DIR} ${IDIR_LOCATE}/usr/{bin,libexec}
	${INSTALL_BIN} ${WRKINST}/usr/bin/{locate,updatedb} ${IDIR_LOCATE}/usr/bin/
	$(INSTALL_BIN) $(WRKINST)/usr/libexec/{bigram,code,frcode} \
		$(IDIR_LOCATE)/usr/libexec

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
