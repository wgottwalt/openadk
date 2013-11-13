# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bison
PKG_VERSION:=		2.4.3
PKG_RELEASE:=		2
PKG_MD5SUM:=		ea45c778b36bdc7a720096819e292a73
PKG_DESCR:=		GNU parser generator
PKG_SECTION:=		lang
PKG_BUILDDEP:=		flex-host bison-host
PKG_URL:=		http://www.gnu.org/software/bison/
PKG_SITES:=		${MASTER_SITE_GNU:=${PKG_NAME}/}

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,BISON,bison,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,BISON,bison,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_STYLE:=		auto

bison-install:
	${INSTALL_DIR} ${IDIR_BISON}/usr/bin ${IDIR_BISON}/usr/share/bison
	${INSTALL_BIN} ${WRKINST}/usr/bin/bison ${IDIR_BISON}/usr/bin
	${CP} ${WRKINST}/usr/share/bison/* ${IDIR_BISON}/usr/share/bison
	$(CP) ./files/yacc ${IDIR_BISON}/usr/bin

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
