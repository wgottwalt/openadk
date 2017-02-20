# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		go-bootstrap
PKG_VERSION:=		1.4.3
PKG_RELEASE:=		1
PKG_HASH:=		9947fc705b0b841b5938c48b22dc33e9647ec0752bae66e50278df4f23f64959
PKG_DESCR:=		go bootstrap compiler
PKG_SECTION:=		dev/tools
PKG_URL:=		http://www.golang.org/
PKG_SITES:=		https://storage.googleapis.com/golang/

PKG_CFLINE_GO_BOOTSTRAP:=	depends on ADK_HOST_ONLY

DISTFILES:=		go$(PKG_VERSION).src.tar.gz
WRKDIST=		${WRKDIR}/go/src

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,GO_BOOTSTRAP,go-bootstrap,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		manual
HOST_MAKE_ENV+=		GOOS=linux \
			GOROOT="$(WRKBUILD)" \
			GOBIN="$(WRKBUILD)/bin" \
			GOROOT_FINAL="$(STAGING_HOST_DIR)/usr/lib/go-bootstrap" \
			CGO_ENABLED=0

host-build:
	(cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ./make.bash)

go-bootstrap-hostinstall:
	$(INSTALL_DIR) $(STAGING_HOST_DIR)/usr/lib/go-bootstrap/bin
	$(CP) $(WRKBUILD)/../lib $(STAGING_HOST_DIR)/usr/lib/go-bootstrap
	$(CP) $(WRKBUILD)/../pkg $(STAGING_HOST_DIR)/usr/lib/go-bootstrap
	$(CP) $(WRKBUILD)/../src $(STAGING_HOST_DIR)/usr/lib/go-bootstrap
	$(INSTALL_BIN) $(WRKBUILD)/bin/go $(STAGING_HOST_DIR)/usr/lib/go-bootstrap/bin
	$(INSTALL_BIN) $(WRKBUILD)/bin/gofmt $(STAGING_HOST_DIR)/usr/lib/go-bootstrap/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
