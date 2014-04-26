# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		vgp
PKG_VERSION:=		0.2.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		b8c25b5dfcb944f78bbc584be9c230c7
PKG_DESCR:=		daemon working like Cisco HSRP
PKG_SECTION:=		net/misc
PKG_URL:=		http://vgpd.freaknet.org/
PKG_SITES:=		http://vgpd.freaknet.org/files/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VGP,vgp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

vgp-install:
	${INSTALL_DIR} ${IDIR_VGP}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/vgpd ${IDIR_VGP}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
