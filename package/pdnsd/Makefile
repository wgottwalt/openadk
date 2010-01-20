# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pdnsd
PKG_VERSION:=		1.2.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		114b3b21b09b43cbfcccdde726b84c12
PKG_DESCR:=		Proxy DNS server with permanent caching
PKG_SECTION:=		net
PKG_DEPENDS:=
PKG_URL:=		http://www.phys.uu.nl/~rombouts/pdnsd.html
PKG_SITES:=		http://www.phys.uu.nl/~rombouts/pdnsd/releases/

# if downloaded package is not ending with .tar.gz use following
DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}-par.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PDNSD,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
# use following to add ./configure options
#CONFIGURE_ARGS+=	--disable-foo
# overwrite any configure variables
#CONFIGURE_ENV+=	ac_cv_func_setpgrp_void=yes
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

# please install all files and directories to the package dir
post-install:
	$(INSTALL_DIR) $(IDIR_PDNSD)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/pdnsd{,-ctl} $(IDIR_PDNSD)/usr/sbin/
	$(INSTALL_DIR) $(IDIR_PDNSD)/var/cache/pdnsd
	$(INSTALL_BIN) $(WRKINST)/var/cache/pdnsd/pdnsd.cache $(IDIR_PDNSD)/var/cache/pdnsd/

include ${TOPDIR}/mk/pkg-bottom.mk
