# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		siproxd
PKG_VERSION:=		0.8.1
PKG_RELEASE:=		1
PKG_HASH:=		df2df04faf5bdb4980cbdfd5516a47898fc47ca1ebc2c628aa48305b20a09dad
PKG_DESCR:=		session initiation protocol proxy
PKG_SECTION:=		net/voip
PKG_DEPENDS:=		libosip2
PKG_BUILDDEP:=		libosip2
PKG_NEEDS:=		threads
PKG_URL:=		http://siproxd.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=siproxd/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SIPROXD,siproxd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf

siproxd-install:
	${INSTALL_DIR} ${IDIR_SIPROXD}/usr/sbin ${IDIR_SIPROXD}/etc
	${INSTALL_DATA} ${WRKINST}/etc/siproxd.conf.example \
		${IDIR_SIPROXD}/etc/siproxd.conf
	${INSTALL_DATA} ${WRKINST}/etc/siproxd_passwd.cfg ${IDIR_SIPROXD}/etc/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/siproxd ${IDIR_SIPROXD}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
