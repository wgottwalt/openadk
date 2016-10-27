# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		valgrind
PKG_VERSION:=		3.12.0
PKG_RELEASE:=		1
PKG_HASH:=		67ca4395b2527247780f36148b084f5743a68ab0c850cb43e4a5b4b012cf76a1
PKG_DESCR:=		memory management debugging tool
PKG_SECTION:=		app/debug
PKG_URL:=		http://valgrind.org/
PKG_SITES:=		http://valgrind.org/downloads/

PKG_ARCH_DEPENDS:=	aarch64 arm ppc ppc64 mips mipsel mips64 mips64el tile s390 x86 x86_64

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,VALGRIND,valgrind,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
ifeq ($(ADK_TARGET_LIB_MUSL),y)
TARGET_CPPFLAGS+=	-D__MUSL__
endif
CONFIGURE_ENV+=		ac_cv_file__proc_self_fd=yes \
			ac_cv_file__proc_self_exe=yes \
			ac_cv_file__proc_self_maps=yes

valgrind-install:
	$(INSTALL_DIR) $(IDIR_VALGRIND)/usr/bin
	$(INSTALL_DIR) $(IDIR_VALGRIND)/usr/lib/valgrind
	$(INSTALL_BIN) $(WRKINST)/usr/bin/valgrind $(IDIR_VALGRIND)/usr/bin/
	$(CP) $(WRKINST)/usr/lib/valgrind/* \
		$(IDIR_VALGRIND)/usr/lib/valgrind
	touch $(IDIR_VALGRIND)/usr/lib/valgrind/default.supp

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
