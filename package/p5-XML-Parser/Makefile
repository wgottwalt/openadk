# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		p5-XML-Parser
PKG_VERSION:=		2.40
PKG_RELEASE:=		2
PKG_MD5SUM:=		c66e9adba003d0667cc40115ccd837a5
PKG_DESCR:=		xml parser
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl libexpat
PKG_BUILDDEP:=		perl-host expat
PKG_SITES:=		http://search.cpan.org/CPAN/authors/id/C/CH/CHORNY/

PKG_CFLINE_P5_XML_PARSER:=	depends on ADK_BROKEN

DISTFILES:=             XML-Parser-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/XML-Parser-${PKG_VERSION}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,P5_XML_PARSER,p5-xml-parser,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		CC="$(TARGET_CC)" CCFLAGS="$(TARGET_CFLAGS)"

include $(TOPDIR)/mk/perl.mk

pre-build:
	(cd ${WRKSRC} && PATH='${HOST_PATH}' \
		perl-host Makefile.PL \
		EXPATLIBPATH=${STAGING_TARGET_DIR}/usr/lib \
		EXPATINCPATH=${STAGING_TARGET_DIR}/usr/include)

p5-xml-parser-install:
	$(INSTALL_DIR) $(IDIR_P5_XML_PARSER)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_XML_PARSER)$(PERL_SITEDIR)

include ${TOPDIR}/mk/pkg-bottom.mk
