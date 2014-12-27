# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		flex
PKG_VERSION:=		2.5.35
PKG_RELEASE:=		3
PKG_HASH:=		a6fe3ac80b5f89769d833efde712f95bb0255bcf9089fa324636a9b8a005c717
PKG_DESCR:=		fast lexical analyzer
PKG_SECTION:=		dev/tools
PKG_BUILDDEP:=		m4-host
HOST_BUILDDEP:=		m4-host
PKG_URL:=		http://flex.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=${PKG_NAME}/}
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,FLEX,flex,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,FLEX,flex,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

hostpost-install:
	(cd $(STAGING_HOST_DIR)/usr/bin; ln -sf flex lex)

flex-install:
	${INSTALL_DIR} ${IDIR_FLEX}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/flex ${IDIR_FLEX}/usr/bin
	# workaround for dev subpackage
	${INSTALL_DIR} ${IDIR_FLEX_DEV}/usr/lib
	${CP} ${WRKINST}/usr/lib/libfl.a \
		${IDIR_FLEX_DEV}/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
