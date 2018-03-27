# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		gawk
PKG_VERSION:=		4.2.1
PKG_RELEASE:=		1
PKG_HASH:=		d1119785e746d46a8209d28b2de404a57f983aa48670f4e225531d3bdc175551
PKG_DESCR:=		awk programming language interpreter
PKG_SECTION:=		base/tools
PKG_URL:=		http://www.gnu.org/software/gawk/
PKG_SITES:=		${MASTER_SITE_GNU:=gawk/}
PKG_BB:=		1

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,GAWK,gawk,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,GAWK,gawk,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_CONFIGURE_ARGS+=	--disable-shared
CONFIGURE_ARGS+=	--disable-libsigsegv

gawk-install:
	${INSTALL_DIR} ${IDIR_GAWK}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gawk ${IDIR_GAWK}/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
