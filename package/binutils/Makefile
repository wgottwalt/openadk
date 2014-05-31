# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/binutils/Makefile.inc

PKG_NAME:=		binutils
PKG_DESCR:=		binary utilities (nm, objdump, as, ..)
PKG_SECTION:=		dev/tools
PKG_DEPENDS:=		libbfd
PKG_OPTS:=		dev

PKG_SUBPKGS:=		BINUTILS LIBBFD
PKGSD_LIBBFD:=		binary file descriptor library
PKGSC_LIBBFD:=		libs/misc

PKG_HOST_DEPENDS:=      !cygwin

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BINUTILS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBBFD,libbfd,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBBFD},${PKGSC_LIBBFD},${PKG_OPTS}))

ifeq ($(ADK_LINUX_SH)$(ADK_LINUX_X86_64),)
CONFIGURE_ARGS+=	--disable-multilib
else
CONFIGURE_ARGS+=	--enable-multilib
endif

TARGET_CFLAGS+=		-fPIC
CONFIGURE_ARGS+=	--disable-werror \
			--disable-install-libiberty \
			--host=$(GNU_TARGET_NAME) \
			--target=$(GNU_TARGET_NAME)
# disable honour cflags stuff
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s

libbfd-install:
	${INSTALL_DIR} ${IDIR_LIBBFD}/usr/lib
	$(CP) ${WRKINST}/usr/lib/*.so* ${IDIR_LIBBFD}/usr/lib

binutils-install:
	${INSTALL_DIR} ${IDIR_BINUTILS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/{ar,as,ld,strip,strings,size,nm} \
		${IDIR_BINUTILS}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/{objcopy,ranlib,readelf,objdump} \
		 ${IDIR_BINUTILS}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
