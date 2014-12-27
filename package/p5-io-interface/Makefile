# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		p5-io-interface
PKG_VERSION:=		1.08
PKG_RELEASE:=		1
PKG_HASH:=		67c6658e66737af09777ae06f90d11d969a31de92b2cdf705126dd79ea961df0
PKG_DESCR:=		extension for access to network card configuration information
PKG_SECTION:=		dev/perl
PKG_DEPENDS:=		perl
PKG_BUILDDEP:=		perl
PKG_SITES:=		http://cpan.metacpan.org/authors/id/L/LD/LDS/

DISTFILES:=             IO-Interface-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/IO-Interface-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,P5_IO_INTERFACE,p5-io-interface,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include $(ADK_TOPDIR)/mk/perl.mk

CONFIG_STYLE:=		perl
XAKE_FLAGS+=		$(PERL_ENV)

p5-io-interface-install:
	$(INSTALL_DIR) $(IDIR_P5_IO_INTERFACE)$(PERL_SITEDIR)
	$(CP) $(WRKINST)$(PERL_SITEDIR)/* \
		$(IDIR_P5_IO_INTERFACE)$(PERL_SITEDIR)

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
