# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gperf
PKG_VERSION:=		3.0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		c1f1db32fb6598d6a93e6e88796a8632
PKG_DESCR:=		perfect hash function generator
PKG_SECTION:=		lang
PKG_BUILDDEP:=		gperf-host
PKG_DEPENDS:=		libstdc++
PKG_URL:=		http://www.gnu.org/software/gperf/
PKG_SITES:=		${MASTER_SITE_GNU:=${PKG_NAME}/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,GPERF,gperf,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,GPERF,gperf,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_STYLE:=		auto

gperf-install:
	${INSTALL_DIR} ${IDIR_GPERF}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gperf ${IDIR_GPERF}/usr/bin

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
