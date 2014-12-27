# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-dbd-sqlite
PKG_VERSION:=		1.42
PKG_RELEASE:=		1
PKG_HASH:=		ab3b653c1ab4dd316f06be40b49ccc612e9670c40b34654353e837c4b464a993
PKG_DESCR:=		self-contained rdbms in a dbi driver
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl p5-dbi
PKG_BUILDDEP:=		perl p5-dbi-host
PKG_SITES:=		http://cpan.metacpan.org/authors/id/I/IS/ISHIGAKI/

DISTFILES:=             DBD-SQLite-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/DBD-SQLite-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,P5_DBD_SQLITE,p5-dbd-sqlite,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include $(ADK_TOPDIR)/mk/perl.mk

CONFIG_STYLE:=		perl
XAKE_FLAGS+=		$(PERL_ENV)

p5-dbd-sqlite-install:
	$(INSTALL_DIR) $(IDIR_P5_DBD_SQLITE)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_DBD_SQLITE)$(PERL_SITEDIR)

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
