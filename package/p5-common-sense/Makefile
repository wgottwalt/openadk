# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-common-sense
PKG_VERSION:=		3.73
PKG_RELEASE:=		1
PKG_HASH:=		8110c5e472641e0c218f8e023cecc1612ef66f9a1b313261fe219862efe3fd10
PKG_DESCR:=		save a tree and a kitten
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl
PKG_BUILDDEP:=		perl
PKG_SITES:=		http://cpan.metacpan.org/authors/id/M/ML/MLEHMANN/

DISTFILES:=             common-sense-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/common-sense-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,P5_COMMON_SENSE,p5-common-sense,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include $(ADK_TOPDIR)/mk/perl.mk

CONFIG_STYLE:=		perl
XAKE_FLAGS+=		$(PERL_ENV)

p5-common-sense-install:
	$(INSTALL_DIR) $(IDIR_P5_COMMON_SENSE)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_COMMON_SENSE)$(PERL_SITEDIR)

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
