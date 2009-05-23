# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		wondershaper
PKG_VERSION:=		1.1a
PKG_RELEASE:=		7
PKG_MD5SUM:=		bbc5a3a4485ab286e337ce8550e7b990
MASTER_SITES:=		http://lartc.org/wondershaper/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WONDERSHAPER,wondershaper,${PKG_VERSION}-${PKG_RELEASE}))

do-install:
	${INSTALL_DIR} ${IDIR_WONDERSHAPER}/usr/sbin/
	${INSTALL_DIR} ${IDIR_WONDERSHAPER}/etc/init.d/
	${INSTALL_BIN} ${WRKBUILD}/wshaper.htb ${IDIR_WONDERSHAPER}/usr/sbin/wshaper
	${INSTALL_DATA} ${WRKBUILD}/wshaper.conf ${IDIR_WONDERSHAPER}/etc/
	$(INSTALL_BIN) ./files/wondershaper.init \
		$(IDIR_WONDERSHAPER)/etc/init.d/wondershaper

include ${TOPDIR}/mk/pkg-bottom.mk
