# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		socat
PKG_VERSION:=		1.7.2.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		0565dd58800e4c50534c61bbb453b771
PKG_DESCR:=		A multipurpose relay (SOcket CAT)
PKG_SECTION:=		net/misc
PKG_DEPENDS:=		libpthread libopenssl
PKG_BUILDDEP:=		openssl
PKG_URL:=		http://www.dest-unreach.org/socat/
PKG_SITES:=		http://www.dest-unreach.org/socat/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SOCAT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		sc_cv_termios_ispeed="no" \
			sc_cv_sys_crdly_shift=9 \
			sc_cv_sys_tabdly_shift=11 \
			sc_cv_sys_csize_shift=4
CONFIGURE_ARGS+=	--disable-libwrap \
			--disable-readline

post-install:
	${INSTALL_DIR} ${IDIR_SOCAT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/socat ${IDIR_SOCAT}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
