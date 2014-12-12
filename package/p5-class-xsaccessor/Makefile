# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-class-xsaccessor
PKG_VERSION:=		1.19
PKG_RELEASE:=		1
PKG_MD5SUM:=		5c5dea74f00ad37c5119dd22b28a5563
PKG_DESCR:=		generate fast xs accessors without runtime compilation
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl
PKG_BUILDDEP:=		perl
PKG_SITES:=		http://cpan.metacpan.org/authors/id/S/SM/SMUELLER/

DISTFILES:=             Class-XSAccessor-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/Class-XSAccessor-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,P5_CLASS_XSACCESSOR,p5-class-xsaccessor,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include $(ADK_TOPDIR)/mk/perl.mk

CONFIG_STYLE:=		perl
XAKE_FLAGS+=		$(PERL_ENV)

p5-class-xsaccessor-install:
	$(INSTALL_DIR) $(IDIR_P5_CLASS_XSACCESSOR)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_CLASS_XSACCESSOR)$(PERL_SITEDIR)

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
