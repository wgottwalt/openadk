# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		ed
PKG_VERSION:=		1.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		e66c03d7e4c67b025d5b6093ec678267
PKG_DESCR:=		unix editor
PKG_SECTION:=		editor
PKG_URL:=		http://www.gnu.org/software/ed/ed.html
PKG_SITES:=		${MASTER_SITE_GNU:=ed/}
PKG_BB:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ED,ed,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ed-install:
	$(INSTALL_DIR) $(IDIR_ED)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/ed \
		$(IDIR_ED)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
