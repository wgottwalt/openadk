# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		zile
PKG_VERSION:=		2.4.11
PKG_RELEASE:=		1
PKG_MD5SUM:=		7a460ccec64e3bec2835697b2eae533c
PKG_DESCR:=		tiny emacs clone
PKG_SECTION:=		app/editor
PKG_DEPENDS:=		libgc
PKG_BUILDDEP:=		libgc
PKG_URL:=		http://www.gnu.org/software/zile/
PKG_SITES:=		${MASTER_SITE_GNU:=zile/}

PKG_LIBC_DEPENDS:=	glibc
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ZILE,zile,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
TARGET_LDFLAGS+=	-ltinfo

zile-install:
	$(INSTALL_DIR) $(IDIR_ZILE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/zile \
		$(IDIR_ZILE)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
