# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		exmap
PKG_VERSION:=		0.4.1
PKG_RELEASE:=		4
PKG_MD5SUM:=		55aec784e214037e61400287a55b5426
PKG_DESCR:=		memory analysing tools
PKG_SECTION:=		app/debug
PKG_DEPENDS:=		libreadline glib
PKG_BUILDDEP:=		glib readline autotool
PKG_SITES:=		http://labs.o-hand.com/sources/exmap-console/

PKG_ARCH_DEPENDS:=	!m68k
PKG_CFLINE_EXMAP:=	depends on !ADK_TOOLCHAIN_ONLY

DISTFILES:=		${PKG_NAME}-console-${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/${PKG_NAME}-console-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,EXMAP,exmap,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--disable-doc
CONFIGURE_ENV+=		LIBS="-lncurses"

pre-build:
	$(MAKE) -C ${WRKBUILD}/kernel $(KERNEL_MODULE_FLAGS)

exmap-install:
	${INSTALL_DIR} ${IDIR_EXMAP}/etc/modules.d/
	echo "exmap" > ${IDIR_EXMAP}/etc/modules.d/90-exmap
	${INSTALL_DIR} ${IDIR_EXMAP}/lib/modules/${KERNEL_VERSION}/
	${INSTALL_DATA} ${WRKBUILD}/kernel/exmap.ko \
		${IDIR_EXMAP}/lib/modules/${KERNEL_VERSION}
	${INSTALL_DIR} ${IDIR_EXMAP}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/src/exmap* ${IDIR_EXMAP}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
