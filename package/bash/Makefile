# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		bash
PKG_VERSION:=		4.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		3fb927c7c33022f1c327f14a81c0d4b0
PKG_DESCR:=		Bourne-Again SHell
PKG_SECTION:=		shells
PKG_URL:=		http://www.gnu.org/software/bash/
PKG_SITES:=		http://ftp.gnu.org/gnu/bash/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BASH,bash,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		bash_cv_getenv_redef=no \
			bash_cv_job_control_missing=yes
CONFIGURE_ARGS+=	--disable-rpath \
			--cache-file=/dev/null \
			--enable-job-control \
			--enable-history
XAKE_FLAGS+=		LIBS_FOR_BUILD=''

bash-install:
	$(INSTALL_DIR) $(IDIR_BASH)/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/bash $(IDIR_BASH)/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
