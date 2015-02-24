# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		elfutils
PKG_VERSION:=		0.161
PKG_RELEASE:=		1
PKG_HASH:=		570c91a1783fa5386aaa2dfdd08dda1de777c2b63bf3b9c1437d635ffdd7a070
PKG_DESCR:=		Libraries/utilities to handle ELF objects (drop in replacement for libelf)
PKG_SECTION:=		base/libs
PKG_URL:=		https://fedorahosted.org/elfutils/
PKG_SITES:=		https://fedorahosted.org/releases/e/l/elfutils/${PKG_VERSION}/
DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ELFUTILS,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

# not only because we pass -DNDEBUG, this package won't build with -Werror
TARGET_CFLAGS+=		-Wno-error

post-install:
	$(INSTALL_DIR) $(IDIR_ELFUTILS)/usr/lib/elfutils
	${CP} ${WRKINST}/usr/lib/lib{asm,dw,elf}*.so* \
		${IDIR_ELFUTILS}/usr/lib
	${CP} ${WRKINST}/usr/lib/elfutils/libebl*.so \
		${IDIR_ELFUTILS}/usr/lib/elfutils
	${INSTALL_DIR} ${IDIR_ELFUTILS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/* \
		${IDIR_ELFUTILS}/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
