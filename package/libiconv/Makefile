# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libiconv
PKG_VERSION:=		1.13
PKG_RELEASE:=		1
PKG_MD5SUM:=		048032a3032ebd182150bdee30a5d533
PKG_DESCR:=		character set conversion library
PKG_SECTION:=		libs
PKG_URL:=		http://www.gnu.org/software/libiconv
PKG_SITES:=		${MASTER_SITE_GNU:=libiconv/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBICONV,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog
FAKE_FLAGS+=		libdir="${WRKINST}/usr/lib" \
			includedir="${WRKINST}/usr/include" \
INSTALL_TARGET=		install-lib

post-extract:
	@find ${WRKBUILD} -name *.rej -delete

post-install:
	${INSTALL_DIR} ${IDIR_LIBICONV}/usr/lib
	${CP} ${WRKINST}/usr/lib/libiconv.so.* ${IDIR_LIBICONV}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
