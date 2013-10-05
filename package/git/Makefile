# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		git
PKG_VERSION:=		1.8.4
PKG_RELEASE:=		2
PKG_MD5SUM:=		355768a1c70d0cb4fedf4b598ac1375b
PKG_DESCR:=		fast version control system
PKG_SECTION:=		scm
PKG_BUILDDEP:=		openssl curl expat
PKG_DEPENDS:=		libopenssl libcurl libexpat libpthread
PKG_URL:=		http://git-scm.com/
PKG_SITES:=		http://git-core.googlecode.com/files/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GIT,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		NO_PERL=1 NO_NSEC=1 NO_TCLTK=1 NO_PYTHON=1 \
			NO_INSTALL_HARDLINKS=1 NO_GETTEXT=1 NO_ICONV=1 \
			CURLDIR=${STAGING_TARGET_DIR} \
			EXPATDIR=${STAGING_TARGET_DIR}
XAKE_FLAGS+=		uname_S=Linux uname_O=GNU/Linux
CONFIGURE_ARGS+=	--without-iconv
CONFIGURE_ENV+=		ac_cv_c_c99_format=yes \
			ac_cv_fread_reads_directories=no \
			ac_cv_snprintf_returns_bogus=no

post-install:
	$(INSTALL_DIR) $(IDIR_GIT)/usr/bin $(IDIR_GIT)/usr/libexec/git-core
	$(INSTALL_DIR) $(IDIR_GIT)/usr/share/git-core/templates
	$(CP) $(WRKINST)/usr/share/git-core/templates/* \
		$(IDIR_GIT)/usr/share/git-core/templates
	$(CP) $(WRKINST)/usr/bin/git $(IDIR_GIT)/usr/bin
	$(CP) $(WRKINST)/usr/bin/git-shell $(IDIR_GIT)/usr/bin
	$(CP) $(WRKINST)/usr/bin/git-receive-pack $(IDIR_GIT)/usr/bin
	$(CP) $(WRKINST)/usr/bin/git-upload-pack $(IDIR_GIT)/usr/bin
	$(CP) $(WRKINST)/usr/bin/git-upload-archive $(IDIR_GIT)/usr/bin
	${CP} $(WRKINST)/usr/libexec/git-core/* $(IDIR_GIT)/usr/libexec/git-core

include ${TOPDIR}/mk/pkg-bottom.mk
