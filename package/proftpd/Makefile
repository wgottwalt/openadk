# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		proftpd
PKG_VERSION:=		1.3.4d
PKG_RELEASE:=		1
PKG_MD5SUM:=		13c6fd7ce320886adc371c81a3e23f07
PKG_DESCR:=		A very configurable FTP server
PKG_SECTION:=		www
PKG_URL:=		http://www.proftpd.org/
PKG_SITES:=		ftp://ftp.proftpd.org/distrib/source/
PKG_NOPARALLEL:=	1

PKG_LIBC_DEPENDS:=	glibc
PKG_CFLINE_PROFTPD:=	depends on ADK_BROKEN

PKG_FLAVOURS_PROFTPD:=	WITH_FTPUSERS
PKGFD_WITH_FTPUSERS:=	install /etc/ftpusers along with proftpd

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PROFTPD,proftpd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-cap
CONFIGURE_ENV+=		ac_cv_func_setpgrp_void=yes \
			ac_cv_func_setgrent_void=yes
TARGET_LDFLAGS+=	-ltinfo

proftpd-install:
	$(INSTALL_DIR) $(IDIR_PROFTPD)/etc
	$(INSTALL_DATA) ./files/proftpd.conf $(IDIR_PROFTPD)/etc/
	$(INSTALL_DIR) $(IDIR_PROFTPD)/usr/{s,}bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/ftp{count,dctl,top,who} \
		$(IDIR_PROFTPD)/usr/bin/
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/{ftpshut,proftpd} \
		$(IDIR_PROFTPD)/usr/sbin/
ifeq (${ADK_PACKAGE_PROFTPD_WITH_FTPUSERS},y)
	${INSTALL_DATA} ./files/ftpusers ${IDIR_PROFTPD}/etc/
endif

include ${TOPDIR}/mk/pkg-bottom.mk
