# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		gperf
PKG_VERSION:=		3.0.4
PKG_RELEASE:=		1
PKG_HASH:=		767112a204407e62dbc3106647cf839ed544f3cf5d0f0523aaa2508623aad63e
PKG_DESCR:=		perfect hash function generator
PKG_SECTION:=		dev/tools
PKG_BUILDDEP:=		gperf-host
PKG_DEPENDS:=		libstdc++
PKG_URL:=		http://www.gnu.org/software/gperf/
PKG_SITES:=		${MASTER_SITE_GNU:=${PKG_NAME}/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,GPERF,gperf,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,GPERF,gperf,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

gperf-install:
	${INSTALL_DIR} ${IDIR_GPERF}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gperf ${IDIR_GPERF}/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
