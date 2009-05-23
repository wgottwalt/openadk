# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xinetd
PKG_VERSION:=		2.3.13
PKG_RELEASE:=		9
PKG_MD5SUM:=		4295b5fe12350f09b5892b363348ac8b

MASTER_SITES:=		http://www.xinetd.org/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XINETD,xinetd,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--without-libwrap \
			--with-loadavg
BUILD_STYLE:=		auto
ALL_TARGET:=		build
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_XINETD}/etc
	${INSTALL_DATA} ./files/xinetd.conf ${IDIR_XINETD}/etc/xinetd.conf
	${INSTALL_DIR} ${IDIR_XINETD}/etc/xinetd.d
	${INSTALL_DIR} ${IDIR_XINETD}/etc/init.d
	${INSTALL_BIN} ./files/xinetd.init ${IDIR_XINETD}/etc/init.d/xinetd
	${INSTALL_DIR} ${IDIR_XINETD}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/xinetd ${IDIR_XINETD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
