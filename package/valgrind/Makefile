# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		valgrind
PKG_VERSION:=		3.9.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		0947de8112f946b9ce64764af7be6df2
PKG_DESCR:=		memory management debugging
PKG_SECTION:=		app/debug
PKG_URL:=		http://valgrind.org/
PKG_SITES:=		http://valgrind.org/downloads/

PKG_ARCH_DEPENDS:=	ppc ppc64 mips mipsel mips64 mips64el x86 x86_64

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

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

include ${TOPDIR}/mk/pkg-bottom.mk
