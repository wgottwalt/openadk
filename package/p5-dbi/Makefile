# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-dbi
PKG_VERSION:=		1.633
PKG_RELEASE:=		1
PKG_HASH:=		e2c1badcc9f672bf31630b36ecd230f7eb04dbf055e6daf7edeed0e9ebcf5ee7
PKG_DESCR:=		database independent interface
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl
PKG_BUILDDEP:=		perl-host perl
PKG_SITES:=		http://cpan.metacpan.org/authors/id/T/TI/TIMB/

DISTFILES:=             DBI-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/DBI-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,P5_DBI,p5-dbi,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,P5_DBI,p5-dbi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS+=		-fPIC

include $(ADK_TOPDIR)/mk/perl.mk

HOST_STYLE:=		perl
CONFIG_STYLE:=		perl
XAKE_FLAGS+=		$(PERL_ENV)

hostpost-install:
	(cd $(WRKBUILD) && PATH='$(HOST_PATH)' $(HOST_PERL_ENV) make install) 

p5-dbi-install:
	$(INSTALL_DIR) $(IDIR_P5_DBI)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_DBI)$(PERL_SITEDIR)

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
