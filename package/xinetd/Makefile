# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xinetd
PKG_VERSION:=		2.3.15
PKG_RELEASE:=		1
PKG_HASH:=		bf4e060411c75605e4dcbdf2ac57c6bd9e1904470a2f91e01ba31b50a80a5be3
PKG_DESCR:=		powerful and secure superserver
PKG_SECTION:=		net/misc
PKG_URL:=		http://www.xinetd.org/
PKG_SITES:=		ftp://mirror.ovh.net/gentoo-distfiles/distfiles/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XINETD,xinetd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		xinetd_cv_type_rlim_t=yes
CONFIGURE_ARGS+=	--without-libwrap \
			--with-loadavg
ALL_TARGET:=		build
TARGET_CPPFLAGS+=	-I$(STAGING_TARGET_DIR)/usr/include/tirpc
TARGET_LDFLAGS+=	-ltirpc

xinetd-install:
	${INSTALL_DIR} ${IDIR_XINETD}/etc/xinetd.d ${IDIR_XINETD}/usr/sbin
	${INSTALL_DATA} ./files/xinetd.conf ${IDIR_XINETD}/etc/xinetd.conf
	${INSTALL_BIN} ${WRKINST}/usr/sbin/xinetd ${IDIR_XINETD}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
