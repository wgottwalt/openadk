# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-dbi
PKG_VERSION:=		1.631
PKG_RELEASE:=		1
PKG_MD5SUM:=		444d3c305e86597e11092b517794a840
PKG_DESCR:=		database independent interface
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl
PKG_BUILDDEP:=		perl
PKG_SITES:=		http://cpan.metacpan.org/authors/id/T/TI/TIMB/

DISTFILES:=             DBI-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/DBI-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,P5_DBI,p5-dbi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include $(ADK_TOPDIR)/mk/perl.mk

CONFIG_STYLE:=		perl
XAKE_FLAGS+=		$(PERL_ENV)

p5-dbi-install:
	$(INSTALL_DIR) $(IDIR_P5_DBI)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_DBI)$(PERL_SITEDIR)

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
