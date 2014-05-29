# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		automake
PKG_VERSION:=		1.14.1
PKG_RELEASE:=		1
PKG_EXTRAVER:=		1.14
PKG_MD5SUM:=		7fc29854c520f56b07aa232a0f880292
PKG_DESCR:=		tool for automatically generating makefiles
PKG_SECTION:=		dev/tools
PKG_BUILDDEP:=		m4-host autoconf-host autoconf
HOST_BUILDDEP:=		autoconf-host
PKG_URL:=		http://www.gnu.org/software/automake/
PKG_SITES:=		${MASTER_SITE_GNU:=automake/}
PKG_OPTS:=		noscripts

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,AUTOMAKE,automake,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,AUTOMAKE,automake,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

XAKE_FLAGS+=		PERL="/usr/bin/perl"
HOST_STYLE:=		auto

automake-install:
	${INSTALL_DIR} ${IDIR_AUTOMAKE}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/automake ${IDIR_AUTOMAKE}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/aclocal ${IDIR_AUTOMAKE}/usr/bin
	${INSTALL_DIR} ${IDIR_AUTOMAKE}/usr/share/aclocal-${PKG_EXTRAVER}
	${CP} ${WRKINST}/usr/share/aclocal-${PKG_EXTRAVER} \
		${IDIR_AUTOMAKE}/usr/share
	${INSTALL_DIR} ${IDIR_AUTOMAKE}/usr/share/automake-${PKG_EXTRAVER}
	${CP} ${WRKINST}/usr/share/automake-${PKG_EXTRAVER} \
		${IDIR_AUTOMAKE}/usr/share

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
