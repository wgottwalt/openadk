# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		oprofile
PKG_VERSION:=		0.9.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		82b059379895cf125261d7d773465915
PKG_DESCR:=		system-wide profiles
PKG_SECTION:=		debug
PKG_DEPENDS:=		libpopt
PKG_BUILDDEP+=		popt
PKG_URL:=		http://oprofile.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=oprofile/}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,OPROFILE,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TLDFLAGS+=		-shared
TCFLAGS+=		-fPIC
TCXXFLAGS+=		-fPIC
CONFIGURE_ARGS+=	--with-kernel-support --with-linux=${LINUX_DIR}

post-install:
	$(INSTALL_DIR) $(IDIR_OPROFILE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/opcontrol $(IDIR_OPROFILE)/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
