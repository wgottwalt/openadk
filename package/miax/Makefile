# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		miax
PKG_VERSION:=		1.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		44f0d2ef46ee2697d890b7b96846adc7
PKG_DESCR:=		A console iax (asterisk) client
PKG_SECTION:=		bluetooth
PKG_DEPENDS:=		kmod-bt bluez libpthread
PKG_BUILDDEP+=		bluez
PKG_URL:=		http://sourceforge.net/projects/miax
PKG_SITES:=		http://mesh.dl.sourceforge.net/sourceforge/miax/

DISTFILES:=		${PKG_NAME}_${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MIAX,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=		auto
MAKE_FLAGS+=		CC="${TARGET_CC}" \
			OFLAGS="${TCFLAGS}" \
			CPPFLAGS="${TCPPFLAGS}" \
			LDFLAGS="${TLDFLAGS}" \

do-install:
	${INSTALL_DIR} ${IDIR_MIAX}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/miax ${IDIR_MIAX}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
