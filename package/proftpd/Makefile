# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		proftpd
PKG_VERSION:=		1.3.2b
PKG_RELEASE:=		1
PKG_MD5SUM:=		4918908fcae9e591ba84c66edff73410
PKG_DESCR:=		An advanced and very configurable FTP server
PKG_SECTION:=		utils
PKG_DEPENDS:=
PKG_URL:=		http://www.proftpd.org/
PKG_SITES:=		ftp://ftp.proftpd.org/distrib/source/

# if downloaded package is not ending with .tar.gz use following
#DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PROFTPD,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
# use following to add ./configure options
#CONFIGURE_ARGS+=	--disable-foo
# overwrite any configure variables
CONFIGURE_ENV+=		ac_cv_func_setpgrp_void=yes \
			ac_cv_func_setgrent_void=yes
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

# please install all files and directories to the package dir
post-install:
	$(INSTALL_DIR) $(IDIR_PROFTPD)/etc
	$(INSTALL_DATA) $(WRKINST)/etc/proftpd.conf $(IDIR_PROFTPD)/etc/
	$(INSTALL_DIR) $(IDIR_PROFTPD)/usr/{s,}bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/ftp{count,dctl,top,who} $(IDIR_PROFTPD)/usr/bin/
	$(INSTALL_BIN) $(WRKINST)/usr/bin/prxs $(IDIR_PROFTPD)/usr/bin/
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/{ftpshut,proftpd} $(IDIR_PROFTPD)/usr/sbin/
	# XXX: maybe this should be a symlink to /tmp or so
	$(INSTALL_DIR) $(IDIR_PROFTPD)/var/proftpd

include ${TOPDIR}/mk/pkg-bottom.mk
