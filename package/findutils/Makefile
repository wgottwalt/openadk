# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		findutils
PKG_VERSION:=		4.4.2
PKG_RELEASE:=		3
PKG_MD5SUM:=		351cc4adb07d54877fa15f75fb77d39f
PKG_DESCR:=		GNU utilities for finding files
PKG_SECTION:=		utils
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://www.gnu.org/software/findutils/
PKG_SITES:=		http://ftp.gnu.org/pub/gnu/findutils/

PKG_SUBPKGS:=		FINDUTILS LOCATE
PKGSD_LOCATE:=		Locate utility

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FINDUTILS,findutils,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LOCATE,locate,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LOCATE},${PKG_SECTION}))

CONFIGURE_ENV+=		gl_cv_func_wcwidth_works=yes \
			ac_cv_func_working_mktime=yes

findutils-install:
	$(INSTALL_DIR) $(IDIR_FINDUTILS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/{find,oldfind,xargs} \
		 $(IDIR_FINDUTILS)/usr/bin

locate-install:
	${INSTALL_DIR} ${IDIR_LOCATE}/usr/{bin,libexec}
	${INSTALL_BIN} ${WRKINST}/usr/bin/{locate,updatedb} ${IDIR_LOCATE}/usr/bin/
	$(INSTALL_BIN) $(WRKINST)/usr/libexec/{bigram,code,frcode} \
		$(IDIR_LOCATE)/usr/libexec

include ${TOPDIR}/mk/pkg-bottom.mk
