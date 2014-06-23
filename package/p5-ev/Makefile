# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-ev
PKG_VERSION:=		4.17
PKG_RELEASE:=		1
PKG_MD5SUM:=		ffc39299fab4589bb850b5a46ccd2395
PKG_DESCR:=		interface to libev, a high performance full-featured event loop
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl libevent
PKG_BUILDDEP:=		perl libevent
PKG_SITES:=		http://cpan.metacpan.org/authors/id/M/ML/MLEHMANN/

DISTFILES:=             EV-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/EV-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,P5_EV,p5-ev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include $(ADK_TOPDIR)/mk/perl.mk

CONFIG_STYLE:=		perl
XAKE_FLAGS+=		$(PERL_ENV)

p5-ev-install:
	$(INSTALL_DIR) $(IDIR_P5_EV)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_EV)$(PERL_SITEDIR)

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
