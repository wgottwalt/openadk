# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		valgrind
PKG_VERSION:=		3.6.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		b289c5f4ab8e39741602445f1dd09b34
PKG_DESCR:=		memory management debugging
PKG_SECTION:=		debug
PKG_URL:=		http://valgrind.org/
PKG_SITES:=		http://valgrind.org/downloads/

PKG_ARCH_DEPENDS:=	x86 x86_64 native
PKG_HOST_DEPENDS:=	!darwin

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,VALGRIND,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_cv_file__proc_self_fd=yes \
			ac_cv_file__proc_self_exe=yes \
			ac_cv_file__proc_self_maps=yes
CONFIGURE_ARGS+=	--disable-tls

post-install:
	$(INSTALL_DIR) $(IDIR_VALGRIND)/usr/bin
	$(INSTALL_DIR) $(IDIR_VALGRIND)/usr/lib/valgrind
	$(INSTALL_BIN) $(WRKINST)/usr/bin/valgrind $(IDIR_VALGRIND)/usr/bin/
	$(CP) $(WRKINST)/usr/lib/valgrind/* \
		$(IDIR_VALGRIND)/usr/lib/valgrind
	touch $(IDIR_VALGRIND)/usr/lib/valgrind/default.supp

include ${TOPDIR}/mk/pkg-bottom.mk
