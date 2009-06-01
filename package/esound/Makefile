# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		esound
PKG_VERSION:=		0.2.41
PKG_RELEASE:=		1
PKG_MD5SUM:=		3d8973ed87053d7acc1f4d44af2c4688
PKG_DESCR:=		Enlightened Sound Daemon
PKG_SECTION:=		net
PKG_DEPENDS:=		libaudiofile
PKG_URL:=		http://www.tux.org/~ricdude/EsounD.html
PKG_SITES:=		ftp://ftp.gnome.org/pub/gnome/sources/esound/0.2/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ESOUND,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_ESOUND}/usr/bin ${IDIR_ESOUND}/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/bin/esd ${IDIR_ESOUND}/usr/bin/
	$(CP) $(WRKINST)/usr/lib/libesd.so.* $(IDIR_ESOUND)/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
