# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		exmap
PKG_VERSION:=		0.4.1
PKG_RELEASE:=		4
PKG_HASH:=		53082354ae893fd385051c96214640cbeba527131ccf9f5320626252a4aef8d5
PKG_DESCR:=		memory analysing tools
PKG_SECTION:=		app/debug
PKG_DEPENDS:=		libreadline glib
PKG_BUILDDEP:=		glib readline
PKG_SITES:=		http://labs.o-hand.com/sources/exmap-console/

PKG_ARCH_DEPENDS:=	!m68k
PKG_SYSTEM_DEPENDS:=	!raspberry-pi3 !raspberry-pi3p
PKG_CFLINE_EXMAP:=	depends on !ADK_APPLIANCE_TOOLCHAIN

DISTFILES:=		${PKG_NAME}-console-${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/${PKG_NAME}-console-${PKG_VERSION}

include ${ADK_TOPDIR}/mk/package.mk
include $(ADK_TOPDIR)/mk/$(ADK_TARGET_OS)-ver.mk

$(eval $(call PKG_template,EXMAP,exmap,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--disable-doc
CONFIGURE_ENV+=		LIBS="-lncurses"

pre-build:
	LDFLAGS="" $(MAKE) -C ${WRKBUILD}/kernel $(KERNEL_MODULE_FLAGS)

exmap-install:
	${INSTALL_DIR} ${IDIR_EXMAP}/etc/modules.d/
	echo "exmap" > ${IDIR_EXMAP}/etc/modules.d/90-exmap
	${INSTALL_DIR} ${IDIR_EXMAP}/lib/modules/${KERNEL_VERSION}/
	${INSTALL_DATA} ${WRKBUILD}/kernel/exmap.ko \
		${IDIR_EXMAP}/lib/modules/${KERNEL_VERSION}
	${INSTALL_DIR} ${IDIR_EXMAP}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/src/exmap* ${IDIR_EXMAP}/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
