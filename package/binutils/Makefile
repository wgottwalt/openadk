# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/binutils/Makefile.inc

PKG_DESCR:=		binary utilities (nm, objdump, as, ..)
PKG_SECTION:=		lang
PKG_DEPENDS:=		libbfd

PKG_NAME_LIBBFD:=	libbfd
PKG_DESCR_LIBBFD:=	bfd library
PKG_SECTION_LIBBFD:=	libs

PKG_HOST_DEPENDS:=      !cygwin

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BINUTILS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBBFD,${PKG_NAME_LIBBFD},${PKG_VERSION}-${PKG_RELEASE},,${PKG_DESCR_LIBBFD},${PKG_SECTION_LIBBFD}))

TCFLAGS+=		-fPIC
CONFIGURE_ARGS+=	--disable-werror \
			--host=$(REAL_GNU_TARGET_NAME) \
			--target=$(REAL_GNU_TARGET_NAME)

post-install:
	${INSTALL_DIR} ${IDIR_LIBBFD}/usr/lib
	$(CP) ${WRKINST}/usr/lib/*.so ${IDIR_LIBBFD}/usr/lib
	${INSTALL_DIR} ${IDIR_BINUTILS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/{ar,as,ld,strip,size,nm} \
		${IDIR_BINUTILS}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/{objcopy,ranlib,readelf,objdump} \
		 ${IDIR_BINUTILS}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
