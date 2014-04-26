# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		esound
PKG_VERSION:=		0.2.41
PKG_RELEASE:=		8
PKG_MD5SUM:=		3d8973ed87053d7acc1f4d44af2c4688
PKG_DESCR:=		enlightened sound daemon
PKG_SECTION:=		multimedia
PKG_DEPENDS:=		libaudiofile libesd
PKG_BUILDDEP:=		libaudiofile autotool
PKG_URL:=		http://www.tux.org/~ricdude/EsounD.html
PKG_SITES:=		ftp://ftp.gnome.org/pub/gnome/sources/esound/0.2/
PKG_LIBNAME:=		libesd
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		ESOUND LIBESD
PKGSC_LIBESD:=		libs
PKGSD_LIBESD:=		Esound library

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libmix
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ESOUND,esound,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBESD,libesd,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBESD},${PKGSC_LIBESD},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--disable-alsa \
			--disable-arts \
			--enable-oss

esound-install:
	${INSTALL_DIR} ${IDIR_ESOUND}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/esd ${IDIR_ESOUND}/usr/bin/

libesd-install:
	${INSTALL_DIR} ${IDIR_LIBESD}/usr/lib
	$(CP) $(WRKINST)/usr/lib/libesd.so* $(IDIR_LIBESD)/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
