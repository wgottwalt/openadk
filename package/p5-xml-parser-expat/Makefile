# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-xml-parser-expat
PKG_VERSION:=		2.41
PKG_RELEASE:=		1
PKG_HASH:=		b48197cd2265a26c5f016489f11a7b450d8833cb8b3d6a46ee15975740894de9
PKG_DESCR:=		lowlevel access to expat xml parser
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl libexpat
PKG_BUILDDEP:=		perl-host perl expat
PKG_SITES:=		http://cpan.metacpan.org/authors/id/T/TO/TODDR/

DISTFILES:=             XML-Parser-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/XML-Parser-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,P5_XML_PARSER_EXPAT,p5-xml-parser-expat,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include $(ADK_TOPDIR)/mk/perl.mk

PERL_ENV+=		EXPATLIBPATH=${STAGING_TARGET_DIR}/usr/lib \
			EXPATINCPATH=${STAGING_TARGET_DIR}/usr/include
CONFIG_STYLE:=		perl
XAKE_FLAGS+=		$(PERL_ENV)

p5-xml-parser-expat-install:
	$(INSTALL_DIR) $(IDIR_P5_XML_PARSER_EXPAT)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_XML_PARSER_EXPAT)$(PERL_SITEDIR)

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
