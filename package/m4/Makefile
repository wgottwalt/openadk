# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		m4
PKG_VERSION:=		1.4.17
PKG_RELEASE:=		1
PKG_MD5SUM:=		a5e9954b1dae036762f7b13673a2cf76
PKG_DESCR:=		macro processor
PKG_SECTION:=		lang
PKG_BUILDDEP:=		m4-host
PKG_URL:=		http://www.gnu.org/software/m4/
PKG_SITES:=		${MASTER_SITE_GNU:=m4/}

PKG_LIBC_DEPENDS:=	glibc musl

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,M4,m4,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,M4,m4,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_STYLE:=		auto
CONFIGURE_ENV+=		ac_cv_func_posix_spawn=yes \
			ac_cv_func_posix_spawn_works=yes
TARGET_LDFLAGS+=	-lrt

m4-install:
	${INSTALL_DIR} ${IDIR_M4}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/m4 ${IDIR_M4}/usr/bin

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
