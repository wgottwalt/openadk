# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		proftpd
PKG_VERSION:=		1.3.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		97ad29f31f4fe633a9f8d021bab2df20
PKG_DESCR:=		An advanced and very configurable FTP server
PKG_SECTION:=		www
PKG_NOPARALLEL:=	1
PKG_URL:=		http://www.proftpd.org/
PKG_SITES:=		ftp://ftp.proftpd.org/distrib/source/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PROFTPD,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-cap
CONFIGURE_ENV+=		ac_cv_func_setpgrp_void=yes \
			ac_cv_func_setgrent_void=yes

post-install:
	$(INSTALL_DIR) $(IDIR_PROFTPD)/etc
	$(INSTALL_DATA) ./files/proftpd.conf $(IDIR_PROFTPD)/etc/
	$(INSTALL_DIR) $(IDIR_PROFTPD)/usr/{s,}bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/ftp{count,dctl,top,who} \
		$(IDIR_PROFTPD)/usr/bin/
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/{ftpshut,proftpd} \
		$(IDIR_PROFTPD)/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
