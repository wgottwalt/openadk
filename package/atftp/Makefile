# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		atftp
PKG_VERSION:=		0.7
PKG_RELEASE:=		2
PKG_MD5SUM:=		3b27365772d918050b2251d98a9c7c82
MASTER_SITES:=		ftp://ftp.mamalinux.com/pub/atftp/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ATFTP,atftp,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,ATFTPD,atftpd,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

MAKE_FLAGS+=		CFLAGS="${TCFLAGS} -Wall -D_REENTRANT -fno-inline"
CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	# atftp client
	$(INSTALL_DIR) $(IDIR_ATFTP)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/atftp $(IDIR_ATFTP)/usr/bin
	# atftp server
	$(INSTALL_DIR) $(IDIR_ATFTPD)/usr/sbin
	$(INSTALL_BIN) $(WRKBUILD)/atftpd $(IDIR_ATFTPD)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
