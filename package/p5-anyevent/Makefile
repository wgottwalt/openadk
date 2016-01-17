# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-anyevent
PKG_VERSION:=		7.11
PKG_RELEASE:=		1
PKG_HASH:=		8bf1b59860d04daeec4f6f56e3b86b581dfabacbc3ba0442e493e267b4b9f522
PKG_DESCR:=		anyevent
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl 
PKG_BUILDDEP:=		perl-host perl
PKG_SITES:=		http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/

DISTFILES:=             AnyEvent-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/AnyEvent-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,P5_ANYEVENT,p5-anyevent,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include $(ADK_TOPDIR)/mk/perl.mk

CONFIG_STYLE:=		perl
XAKE_FLAGS+=		$(PERL_ENV)

post-extract:
	@touch $(STAGING_TARGET_DIR)/$(PERL_INCDIR)/patchlevel-debian.h

p5-anyevent-install:
	$(INSTALL_DIR) $(IDIR_P5_ANYEVENT)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_ANYEVENT)$(PERL_SITEDIR)

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
