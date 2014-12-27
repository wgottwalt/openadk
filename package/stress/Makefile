# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		stress
PKG_VERSION:=		1.0.0
PKG_RELEASE:=		1
PKG_HASH:=		778126fdcc3ecb54d4a8dad6164001603bcc3b79ba64b3c2c5285275bc0cbedf
PKG_DESCR:=		simple tool that imposes certain types of compute stress
PKG_SECTION:=		sys/utils
PKG_SITES:=		http://weather.ou.edu/~apw/projects/stress/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,STRESS,stress,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-static

stress-install:
	${INSTALL_DIR} ${IDIR_STRESS}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/stress ${IDIR_STRESS}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
