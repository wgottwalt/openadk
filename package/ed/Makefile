# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ed
PKG_VERSION:=		1.13
PKG_RELEASE:=		1
PKG_HASH:=		cd66c54a53cd6ef35a217556e7b2b2fdd973ca2708f4fc41636b0bc06388c7d3
PKG_DESCR:=		unix editor
PKG_SECTION:=		app/editor
PKG_BUILDDEP+=		lzip-host
PKG_URL:=		http://www.gnu.org/software/ed/ed.html
PKG_SITES:=		${MASTER_SITE_GNU:=ed/}
PKG_BB:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.lz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ED,ed,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ed-install:
	$(INSTALL_DIR) $(IDIR_ED)/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/ed \
		$(IDIR_ED)/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
