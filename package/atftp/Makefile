# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		atftp
PKG_VERSION:=		0.7.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		367bf401965fbed04585b1229c2191a8
PKG_DESCR:=		tftp client
PKG_SECTION:=		net/misc
PKG_DEPENDS:=		libreadline libncurses
PKG_BUILDDEP:=		readline ncurses
PKG_URL:=		http://sourceforge.net/projects/atftp/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=atftp/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_LIBC_DEPENDS:=	uclibc glibc

PKG_SUBPKGS:=		ATFTP ATFTPD
PKGSD_ATFTPD:=		tftp server
PKGSS_ATFTPD:=		libreadline libncurses

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ATFTP,atftp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ATFTPD,atftpd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_ATFTPD},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-libpcre
MAKE_FLAGS+=		CFLAGS="${TARGET_CFLAGS} -Wall -D_REENTRANT -fno-inline"

atftp-install:
	$(INSTALL_DIR) $(IDIR_ATFTP)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/atftp $(IDIR_ATFTP)/usr/bin

atftpd-install:
	$(INSTALL_DIR) $(IDIR_ATFTPD)/usr/sbin
	$(INSTALL_BIN) $(WRKBUILD)/atftpd $(IDIR_ATFTPD)/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
