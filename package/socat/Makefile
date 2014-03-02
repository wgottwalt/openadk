# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		socat
PKG_VERSION:=		1.7.2.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		6943f7a5e1ffd553ad2a900bbf05b83a
PKG_DESCR:=		A multipurpose relay (SOcket CAT)
PKG_SECTION:=		net/misc
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://www.dest-unreach.org/socat/
PKG_SITES:=		http://www.dest-unreach.org/socat/download/

PKG_FLAVOURS_SOCAT:=	WITH_SSL
PKGFD_WITH_SSL:=	enable SSL support
PKGFS_WITH_SSL:=	libopenssl
PKGFB_WITH_SSL:=	openssl

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SOCAT,socat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		sc_cv_termios_ispeed="no" \
			sc_cv_sys_crdly_shift=9 \
			sc_cv_sys_tabdly_shift=11 \
			sc_cv_sys_csize_shift=4
CONFIGURE_ARGS+=	--disable-libwrap \
			--disable-readline

ifneq (${ADK_PACKAGE_SOCAT_WITH_SSL},)
CONFIGURE_ARGS+=	--enable-openssl
else
CONFIGURE_ARGS+=	--disable-openssl
endif

socat-install:
	${INSTALL_DIR} ${IDIR_SOCAT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/socat ${IDIR_SOCAT}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
