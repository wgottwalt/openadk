# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		git
PKG_VERSION:=		1.6.3.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		a634d76881f3bd6b92cb1892ea5f88fe
PKG_DESCR:=		fast version control system
PKG_SECTION:=		misc
PKG_DEPENDS:=		openssl curl
PKG_URL:=		http://git-scm.com
PKG_SITES:=		http://kernel.org/pub/software/scm/git/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GIT,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TCFLAGS+=		-DNO_NSEC -DNO_TCLTK -DNO_PERL
CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		ac_cv_c_c99_format=yes \
			ac_cv_fread_reads_directories=no \
			ac_cv_snprintf_returns_bogus=no
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	$(INSTALL_DIR) $(IDIR_GIT)/usr/bin $(IDIR_GIT)/usr/sbin/git-core
	$(CP) $(WRKINST)/usr/bin/git $(IDIR_GIT)/usr/bin
	$(CP) $(WRKINST)/usr/bin/git-shell $(IDIR_GIT)/usr/bin
	$(CP) $(WRKINST)/usr/bin/git-receive-pack $(IDIR_GIT)/usr/bin
	$(CP) $(WRKINST)/usr/bin/git-upload-pack $(IDIR_GIT)/usr/bin
	$(CP) $(WRKINST)/usr/bin/git-upload-archive $(IDIR_GIT)/usr/bin
	${CP} $(WRKINST)/usr/sbin/git-core/* $(IDIR_GIT)/usr/sbin/git-core

include ${TOPDIR}/mk/pkg-bottom.mk
