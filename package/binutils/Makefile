# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/binutils/Makefile.inc
include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BINUTILS,binutils,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--disable-werror
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-patch:
	${PREVENT_PATCH} ${PATCH} ${WRKDIST} \
	    ${TOPDIR}/toolchain/binutils/${BINUTILS_VERSION} \*.patch

post-install:
	${INSTALL_DIR} ${IDIR_BINUTILS}/usr/lib
	$(CP) ${WRKINST}/usr/lib/*.so ${IDIR_BINUTILS}/usr/lib
	${INSTALL_DIR} ${IDIR_BINUTILS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/nm ${IDIR_BINUTILS}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/size ${IDIR_BINUTILS}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/ar ${IDIR_BINUTILS}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/as ${IDIR_BINUTILS}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/ld ${IDIR_BINUTILS}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/strip ${IDIR_BINUTILS}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/objdump ${IDIR_BINUTILS}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/objcopy ${IDIR_BINUTILS}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/ranlib ${IDIR_BINUTILS}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/readelf ${IDIR_BINUTILS}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
