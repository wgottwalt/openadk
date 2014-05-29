# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		flex
PKG_VERSION:=		2.5.35
PKG_RELEASE:=		1
PKG_MD5SUM:=		201d3f38758d95436cbc64903386de0b
PKG_DESCR:=		fast lexical analyzer
PKG_SECTION:=		dev/tools
PKG_BUILDDEP:=		m4-host flex-host
PKG_URL:=		http://flex.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=${PKG_NAME}/}
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,FLEX,flex,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,FLEX,flex,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto

flex-install:
	${INSTALL_DIR} ${IDIR_FLEX}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/flex ${IDIR_FLEX}/usr/bin
	# workaround for dev subpackage
	${INSTALL_DIR} ${IDIR_FLEX_DEV}/usr/lib
	${CP} ${WRKINST}/usr/lib/libfl.a \
		${IDIR_FLEX_DEV}/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
