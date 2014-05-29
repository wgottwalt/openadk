# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		vilistextum
PKG_VERSION:=		2.6.9
PKG_RELEASE:=		1
PKG_MD5SUM:=            5ba56ffdc56758da716bb46c3e0f517e
PKG_DESCR:=		html to ascii converter
PKG_SECTION:=		net/mail
PKG_BUILDDEP:=		libiconv-tiny
PKG_SITES:=		http://bhaak.dyndns.org/${PKG_NAME}/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VILISTEXTUM,vilistextum,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

vilistextum-install:
	${INSTALL_DIR} ${IDIR_VILISTEXTUM}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/vilistextum \
		 ${IDIR_VILISTEXTUM}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
