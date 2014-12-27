# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		bison
PKG_VERSION:=		3.0.2
PKG_RELEASE:=		1
PKG_HASH:=		a2c3e8528bdb50567d6fa26deeb493dc5ccd7e277b865251608a9e43ac928f3c
PKG_DESCR:=		parser generator
PKG_SECTION:=		dev/tools
PKG_BUILDDEP:=		m4-host flex-host bison-host
HOST_BUILDDEP:=		m4-host flex-host
PKG_URL:=		http://www.gnu.org/software/bison/
PKG_SITES:=		${MASTER_SITE_GNU:=${PKG_NAME}/}

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,BISON,bison,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,BISON,bison,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-lrt
XAKE_FLAGS+=		M4=m4

bison-install:
	${INSTALL_DIR} ${IDIR_BISON}/usr/bin ${IDIR_BISON}/usr/share/bison
	${INSTALL_BIN} ${WRKINST}/usr/bin/bison ${IDIR_BISON}/usr/bin
	${CP} ${WRKINST}/usr/share/bison/* ${IDIR_BISON}/usr/share/bison
	$(CP) ./files/yacc ${IDIR_BISON}/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
