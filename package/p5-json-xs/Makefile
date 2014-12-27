# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-json-xs
PKG_VERSION:=		3.01
PKG_RELEASE:=		1
PKG_HASH:=		4e8df3256a5aa9ed304ce1bbcd9140737deef31ba847bff9f4c15480c88c71ab
PKG_DESCR:=		json serialising/deserialising, done correctly and fast
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl
PKG_BUILDDEP:=		perl
PKG_SITES:=		http://cpan.metacpan.org/authors/id/M/ML/MLEHMANN/

DISTFILES:=             JSON-XS-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/JSON-XS-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,P5_JSON_XS,p5-json-xs,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include $(ADK_TOPDIR)/mk/perl.mk

CONFIG_STYLE:=		perl
XAKE_FLAGS+=		$(PERL_ENV)

p5-json-xs-install:
	$(INSTALL_DIR) $(IDIR_P5_JSON_XS)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_JSON_XS)$(PERL_SITEDIR)

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
