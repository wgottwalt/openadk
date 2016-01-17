# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-template-toolkit
PKG_VERSION:=		2.26
PKG_RELEASE:=		1
PKG_HASH:=		e7e1cf36026f1ef96d8233e18a3fb39e1eafe9109edc639ecf25b20651cd76be
PKG_DESCR:=		comprehensive template processing system
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl
PKG_BUILDDEP:=		perl-host perl
PKG_SITES:=		http://cpan.metacpan.org/authors/id/A/AB/ABW/

DISTFILES:=             Template-Toolkit-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/Template-Toolkit-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,P5_TEMPLATE_TOOLKIT,p5-template-toolkit,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include $(ADK_TOPDIR)/mk/perl.mk

CONFIG_STYLE:=		perl
XAKE_FLAGS+=		$(PERL_ENV)

p5-template-toolkit-install:
	$(INSTALL_DIR) $(IDIR_P5_TEMPLATE_TOOLKIT)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_TEMPLATE_TOOLKIT)$(PERL_SITEDIR)

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
