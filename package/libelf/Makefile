# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/libelf/Makefile.inc

PKG_NAME:=		libelf
PKG_DESCR:=		elf library
PKG_SECTION:=		libs/misc
PKG_SITES:=		http://www.mr511.de/software/
PKG_OPTS:=		dev

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBELF,libelf,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ENV+=		mr_cv_target_elf=yes \
			ac_cv_sizeof_long_long=8
CONFIGURE_ARGS+=	--enable-elf64=yes \
			--disable-sanity-checks
FAKE_FLAGS+=		instroot="${WRKINST}"

libelf-install:
	${INSTALL_DIR} ${IDIR_LIBELF}/usr/lib
	${CP} ${WRKINST}/usr/lib/libelf.so* ${IDIR_LIBELF}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
