# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		autoconf
PKG_VERSION:=		2.69
PKG_RELEASE:=		1
PKG_MD5SUM:=		50f97f4159805e374639a73e2636f22e
PKG_DESCR:=		automatically configure software source code packages
PKG_SECTION:=		dev/tools
HOST_BUILDDEP:=		m4-host
PKG_URL:=		http://www.gnu.org/software/autoconf/
PKG_SITES:=		${MASTER_SITE_GNU:=autoconf/}
PKG_OPTS:=		noscripts

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,AUTOCONF,autoconf,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,AUTOCONF,autoconf,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto
XAKE_FLAGS+=		PERL="/usr/bin/perl"

autoconf-install:
	${INSTALL_DIR} ${IDIR_AUTOCONF}/usr/bin
	${INSTALL_DIR} ${IDIR_AUTOCONF}/usr/share/autoconf
	${CP} ${WRKINST}/usr/bin/auto* ${IDIR_AUTOCONF}/usr/bin
	${CP} ${WRKINST}/usr/share/autoconf/* \
		${IDIR_AUTOCONF}/usr/share/autoconf

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
