# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		findutils
PKG_VERSION:=		4.6.0
PKG_RELEASE:=		1
PKG_HASH:=		ded4c9f73731cd48fec3b6bdaccce896473b6d8e337e9612e16cf1431bb1169d
PKG_DESCR:=		utilities for finding files
PKG_SECTION:=		base/tools
HOST_BUILDDEP:=		bison-host
PKG_NEEDS:=		threads
PKG_URL:=		http://www.gnu.org/software/findutils/
PKG_SITES:=		http://ftp.gnu.org/pub/gnu/findutils/
PKG_BB:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		FINDUTILS XARGS LOCATE FIND
PKGSD_LOCATE:=		locate utility
PKGSN_LOCATE:=		findutils
PKGSD_XARGS:=		xargs utility
PKGSN_XARGS:=		findutils
PKGSD_FIND:=		find utility
PKGSN_FIND:=		findutils

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,FINDUTILS,findutils,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,FIND,find,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_FIND},${PKG_SECTION}))
$(eval $(call PKG_template,LOCATE,locate,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LOCATE},${PKG_SECTION}))
$(eval $(call PKG_template,XARGS,xargs,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_XARGS},${PKG_SECTION}))

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

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
