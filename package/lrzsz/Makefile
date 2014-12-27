# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		lrzsz
PKG_VERSION:=		0.12.20
PKG_RELEASE:=		1
PKG_HASH:=		c28b36b14bddb014d9e9c97c52459852f97bd405f89113f30bee45ed92728ff1
PKG_DESCR:=		x-Modem, y-modem, z-modem protocol handlers
PKG_SECTION:=		sys/serial
PKG_URL:=		http://www.ohse.de/uwe/software/lrzsz.html
PKG_SITES:=		http://www.ohse.de/uwe/releases/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LRZSZ,lrzsz,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

INSTALL_STYLE:=		manual

CONFIGURE_ARGS+=	--without-libiconv-prefix \
			--without-libintl-prefix

do-install:
	${INSTALL_DIR} ${IDIR_LRZSZ}/usr/bin
	${CP} ${WRKBUILD}/src/lrz ${IDIR_LRZSZ}/usr/bin/
	${CP} ${WRKBUILD}/src/lsz ${IDIR_LRZSZ}/usr/bin/
	(cd ${IDIR_LRZSZ}/usr/bin; \
		ln -fs lrz lrx; \
		ln -fs lrz lrb; \
		ln -fs lsz lsx; \
		ln -fs lsz lsb; \
	);

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
