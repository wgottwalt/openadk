# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xinetd
PKG_VERSION:=		2.3.13
PKG_RELEASE:=		9
PKG_MD5SUM:=		4295b5fe12350f09b5892b363348ac8b
PKG_DESCR:=		a powerful and secure superserver
PKG_SECTION:=		net
PKG_URL:=		http://www.xinetd.org
PKG_SITES:=		http://www.xinetd.org/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XINETD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--without-libwrap \
			--with-loadavg
BUILD_STYLE:=		auto
ALL_TARGET:=		build
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_XINETD}/etc/xinetd.d ${IDIR_XINETD}/usr/sbin
	${INSTALL_DATA} ./files/xinetd.conf ${IDIR_XINETD}/etc/xinetd.conf
	${INSTALL_BIN} ${WRKINST}/usr/sbin/xinetd ${IDIR_XINETD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
