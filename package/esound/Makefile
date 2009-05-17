# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		esound
PKG_VERSION:=		0.2.38
PKG_RELEASE:=		5
PKG_MD5SUM:=		77c4e9805a017fba06552487df3c6662
MASTER_SITES:=		ftp://ftp.gnome.org/pub/gnome/sources/esound/0.2/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ESOUND,esound,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_ESOUND}/etc/init.d
	${INSTALL_DIR} ${IDIR_ESOUND}/usr/bin
	${INSTALL_DIR} ${IDIR_ESOUND}/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/bin/esd ${IDIR_ESOUND}/usr/bin/
	$(CP) $(WRKINST)/usr/lib/libesd.so.* $(IDIR_ESOUND)/usr/lib/
	$(INSTALL_DATA) ./files/esd.init $(IDIR_ESOUND)/etc/init.d/esd

include ${TOPDIR}/mk/pkg-bottom.mk
