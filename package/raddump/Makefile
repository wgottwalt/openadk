# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		raddump
PKG_VERSION:=		0.3.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		f8c29c67141ea78bb6ae8b97d5149480
PKG_DESCR:=		interprets captured radius packets
PKG_SECTION:=		net/radius
PKG_DEPENDS:=		libpcap libopenssl
PKG_BUILDDEP:=		openssl libpcap
PKG_URL:=		http://sourceforge.net/projects/raddump
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=raddump/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RADDUMP,raddump,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

raddump-install:
	${INSTALL_DIR} ${IDIR_RADDUMP}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/raddump ${IDIR_RADDUMP}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
