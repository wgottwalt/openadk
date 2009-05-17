# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libelf
PKG_VERSION:=		0.8.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		11904a77b948bcfab671e80100b6098d
MASTER_SITES:=		http://www.mr511.de/software/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBELF,libelf,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		mr_cv_target_elf=yes \
			libelf_64bit=yes \
			libelf_cv_struct_elf64_ehdr=yes \
			libelf_cv_type_elf64_addr=no \
			libelf_cv_struct_elf64_rel=yes \
			ac_cv_sizeof_long_long=8
CONFIGURE_ARGS+=	--enable-elf64=yes
BUILD_STYLE=		auto
INSTALL_STYLE=		confprog auto
FAKE_FLAGS+=		instroot="${WRKINST}"

post-install:
	${INSTALL_DIR} ${IDIR_LIBELF}/usr/lib
	${CP} ${WRKINST}/usr/lib/libelf.so.* ${IDIR_LIBELF}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
