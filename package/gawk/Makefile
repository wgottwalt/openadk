# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gawk
PKG_VERSION:=		4.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		a2a26543ce410eb74bc4a508349ed09a
PKG_DESCR:=		awk programming language interpreter
PKG_SECTION:=		dev/lang
PKG_URL:=		http://www.gnu.org/software/gawk/
PKG_SITES:=		${MASTER_SITE_GNU:=gawk/}
PKG_BB:=		1

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,GAWK,gawk,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,GAWK,gawk,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-libsigsegv

gawk-install:
	${INSTALL_DIR} ${IDIR_GAWK}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gawk ${IDIR_GAWK}/usr/bin

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
