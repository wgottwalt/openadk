# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		strace
PKG_VERSION:=		4.11
PKG_RELEASE:=		5
PKG_HASH:=		e86a5f6cd8f941f67f3e4b28f4e60f3d9185c951cf266404533210a2e5cd8152
PKG_DESCR:=		system call trace program
PKG_SECTION:=		app/debug
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=strace/}

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,STRACE,strace,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		GCC_HONOUR_COPTS=s

ifeq ($(ADK_TARGET_LIB_MUSL),y)
TARGET_CPPFLAGS+=	-DMSG_EXCEPT=020000 -D_LARGEFILE64_SOURCE=1
ifeq ($(ADK_TARGET_ARCH_PPC),y)
TARGET_CPPFLAGS+=	-Dsigcontext_struct=sigcontext -include ppc-regs.h
endif
endif

INSTALL_STYLE:=		manual

do-install:
	${INSTALL_DIR} ${IDIR_STRACE}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/strace ${IDIR_STRACE}/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
