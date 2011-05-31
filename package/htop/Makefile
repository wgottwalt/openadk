# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		htop
PKG_VERSION:=		0.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		7c5507f35f363f3f40183a2ba3c561f8
PKG_DESCR:=		grafical process manager
PKG_SECTION:=		utils
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP:=		ncurses
PKG_URL:=		http://sourceforge.net/projects/htop
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=htop/${PKG_VERSION}/}

PKG_FLAVOURS_HTOP:=	MAN
PKGFD_MAN:=		Install man files

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,HTOP,htop,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS += ac_cv_file__proc_stat=yes \
		  ac_cv_file__proc_meminfo=yes \
		  ac_cv_func_malloc_0_nonnull=yes \
		  ac_cv_func_realloc_0_nonnull=yes

htop-install:
	$(INSTALL_DIR) $(IDIR_HTOP)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/htop $(IDIR_HTOP)/usr/bin
ifeq (${ADK_PACKAGE_HTOP_MAN},y)
	${INSTALL_DIR} ${IDIR_HTOP}/usr/share/man
	${CP} ${WRKINST}/usr/share/man/* ${IDIR_HTOP}/usr/share/man
endif

include ${TOPDIR}/mk/pkg-bottom.mk
