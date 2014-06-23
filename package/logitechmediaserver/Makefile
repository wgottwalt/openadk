# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		logitechmediaserver
PKG_VERSION:=		7.8.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		8e1934d2fc16bc98ce77d3b6828be1dd
PKG_DESCR:=		popular media server
PKG_SECTION:=		mm/audio
PKG_DEPENDS:=		perl p5-xml-parser p5-dbi p5-ev p5-html-parser
PKG_DEPENDS+=		p5-json-xs p5-digest-sha1 p5-yaml-xs p5-sub-name
PKG_DEPENDS+=		p5-xml-parser-expat p5-time-hires p5-common-sense
PKG_DEPENDS+=		p5-types-serialiser
PKG_BUILDDEP:=		perl
PKG_URL:=		http://wiki.slimdevices.com/index.php/Logitech_Media_Server
PKG_SITES:=		http://downloads.slimdevices.com/LogitechMediaServer_v7.8.0/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}-noCPAN.tgz
WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}-noCPAN

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LOGITECHMEDIASERVER,logitechmediaserver,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

logitechmediaserver-install:
	$(INSTALL_DIR) $(IDIR_LOGITECHMEDIASERVER)/opt/lms
	$(CP) $(WRKSRC)/* $(IDIR_LOGITECHMEDIASERVER)/opt/lms

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
