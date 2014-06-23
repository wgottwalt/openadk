# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-types-serialiser
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		76460a2bfbc644672499af89192e03fe
PKG_DESCR:=		simple data types for common serialisation formats
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl
PKG_BUILDDEP:=		perl
PKG_SITES:=		http://cpan.metacpan.org/authors/id/M/ML/MLEHMANN/

DISTFILES:=             Types-Serialiser-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/Types-Serialiser-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,P5_TYPES_SERIALISER,p5-types-serialiser,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include $(ADK_TOPDIR)/mk/perl.mk

CONFIG_STYLE:=		perl
XAKE_FLAGS+=		$(PERL_ENV)

p5-types-serialiser-install:
	$(INSTALL_DIR) $(IDIR_P5_TYPES_SERIALISER)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_TYPES_SERIALISER)$(PERL_SITEDIR)

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
