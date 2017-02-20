# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		go
PKG_VERSION:=		1.8
PKG_RELEASE:=		1
PKG_HASH:=		406865f587b44be7092f206d73fc1de252600b79b3cacc587b74b5ef5c623596
PKG_DESCR:=		go compiler and tools
PKG_SECTION:=		dev/lang
HOST_BUILDDEP:=		go-bootstrap-host
PKG_URL:=		http://www.golang.org
PKG_SITES:=		https://storage.googleapis.com/golang/

PKG_ARCH_DEPENDS:=	aarch64 arm mips mips64 ppc64 x86 x86_64

PKG_CFLINE_GO:=		depends on ADK_HOST_ONLY

DISTFILES:=             $(PKG_NAME)$(PKG_VERSION).src.tar.gz
WRKDIST=		${WRKDIR}/go/src

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,GO,go,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		manual

include $(ADK_TOPDIR)/mk/go.mk

ADK_GO_BOOTSTRAP:=	$(STAGING_HOST_DIR)/usr/lib/go-bootstrap
ADK_GO_TEMP:=		$(WRKBUILD)/go-temp
ADK_GO_HOST_ENV:=	GOROOT_BOOTSTRAP="$(ADK_GO_BOOTSTRAP)" \
			GOROOT_FINAL="$(ADK_GO_ROOT)" \
			GOROOT="$(WRKBUILD)" \
			GOBIN="$(WRKBUILD)/bin" \
			GOARCH=$(ADK_GO_ARCH) \
			GOOS=linux

host-build:
	(cd $(WRKBUILD) && \
		CGO_ENABLED=0 \
		CC_FOR_TARGET=$(HOST_CC) \
		CXX_FOR_TARGET=$(HOST_CXX) \
		$(ADK_GO_HOST_ENV) ./make.bash)
	mkdir -p $(ADK_GO_TEMP)
	mv $(WRKBUILD)/../pkg/tool $(ADK_GO_TEMP)
	mv $(WRKBUILD)/../bin $(ADK_GO_TEMP)
	(cd $(WRKBUILD) && \
		CGO_ENABLED=1 \
		CC_FOR_TARGET=$(TARGET_CC) \
		CXX_FOR_TARGET=$(TARGET_CXX) \
		$(ADK_GO_HOST_ENV) ./make.bash)

go-hostinstall:
	$(INSTALL_DIR) $(ADK_GO_ROOT)/bin
	$(INSTALL_BIN) $(ADK_GO_TEMP)/bin/{go,gofmt} $(ADK_GO_ROOT)/bin
	ln -sf ../lib/go/bin/go $(STAGING_HOST_DIR)/usr/bin/
	ln -sf ../lib/go/bin/gofmt $(STAGING_HOST_DIR)/usr/bin/
	$(CP) $(WRKBUILD)/../lib $(ADK_GO_ROOT)
	$(INSTALL_DIR) $(ADK_GO_ROOT)/pkg
	$(CP) $(WRKBUILD)/../pkg/include $(ADK_GO_ROOT)/pkg
	$(CP) $(WRKBUILD)/../pkg/linux_* $(ADK_GO_ROOT)/pkg
	$(CP) $(ADK_GO_TEMP)/tool $(ADK_GO_ROOT)/pkg
	$(CP) $(WRKBUILD)/../src $(ADK_GO_ROOT)
	
include ${ADK_TOPDIR}/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
