# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-tie-refhash
PKG_VERSION:=		1.39
PKG_RELEASE:=		1
PKG_MD5SUM:=		179d4d02924bd9716e2ffe585cbd36c8
PKG_DESCR:=		use references as hash keys
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl
PKG_BUILDDEP:=		perl
PKG_SITES:=		http://cpan.metacpan.org/authors/id/F/FL/FLORA/

DISTFILES:=             Tie-RefHash-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/Tie-RefHash-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,P5_TIE_REFHASH,p5-tie-refhash,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include $(ADK_TOPDIR)/mk/perl.mk

CONFIG_STYLE:=		perl
XAKE_FLAGS+=		$(PERL_ENV)

p5-tie-refhash-install:
	$(INSTALL_DIR) $(IDIR_P5_TIE_REFHASH)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_TIE_REFHASH)$(PERL_SITEDIR)

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
