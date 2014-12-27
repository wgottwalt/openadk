# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-sub-name
PKG_VERSION:=		0.05
PKG_RELEASE:=		1
PKG_HASH:=		c9d1b805ea1f8e35fdde319468d6378dc1f1123cd8f2b22788238ba842713af1
PKG_DESCR:=		rename a sub
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl
PKG_BUILDDEP:=		perl
PKG_SITES:=		http://cpan.metacpan.org/authors/id/F/FL/FLORA/

DISTFILES:=             Sub-Name-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/Sub-Name-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,P5_SUB_NAME,p5-sub-name,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include $(ADK_TOPDIR)/mk/perl.mk

CONFIG_STYLE:=		perl
XAKE_FLAGS+=		$(PERL_ENV)

p5-sub-name-install:
	$(INSTALL_DIR) $(IDIR_P5_SUB_NAME)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_SUB_NAME)$(PERL_SITEDIR)

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
