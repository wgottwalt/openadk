# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-ev
PKG_VERSION:=		4.21
PKG_RELEASE:=		1
PKG_HASH:=		48ddccedbd0b8b44894df04db92f0d1148e4bcf8a219847125e70263552a2185
PKG_DESCR:=		interface to libev, a high performance full-featured event loop
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl libev
PKG_BUILDDEP:=		perl libev
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
