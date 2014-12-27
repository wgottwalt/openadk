# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-html-parser
PKG_VERSION:=		3.71
PKG_RELEASE:=		1
PKG_HASH:=		be918b3749d3ff93627f72ee4b825683332ecb4c81c67a3a8d72b0435ffbd802
PKG_DESCR:=		html parser class
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl
PKG_BUILDDEP:=		perl
PKG_SITES:=		http://cpan.metacpan.org/authors/id/G/GA/GAAS/

DISTFILES:=             HTML-Parser-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/HTML-Parser-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,P5_HTML_PARSER,p5-html-parser,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include $(ADK_TOPDIR)/mk/perl.mk

CONFIG_STYLE:=		perl
XAKE_FLAGS+=		$(PERL_ENV)

p5-html-parser-install:
	$(INSTALL_DIR) $(IDIR_P5_HTML_PARSER)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_HTML_PARSER)$(PERL_SITEDIR)

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
