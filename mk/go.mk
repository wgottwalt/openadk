ifeq ($(ADK_TARGET_ARCH_ARM),y)
ADK_GO_ARCH:=		aarch64
endif
ifeq ($(ADK_TARGET_ARCH_ARM),y)
ADK_GO_ARCH:=		arm
endif
ifeq ($(ADK_TARGET_ARCH_MIPS),y)
ADK_GO_ARCH:=		mips
endif
ifeq ($(ADK_TARGET_ARCH_MIPS64),y)
ADK_GO_ARCH:=		mips64
endif
ifeq ($(ADK_TARGET_ARCH_PPC64),y)
ADK_GO_ARCH:=		ppc64
endif
ifeq ($(ADK_TARGET_ARCH_X86),y)
ADK_GO_ARCH:=		i386
endif
ifeq ($(ADK_TARGET_ARCH_X86_64),y)
ADK_GO_ARCH:=		amd64
endif
ADK_GO_ROOT:=		$(STAGING_HOST_DIR)/usr/lib/go
ADK_GO_PATH:=		$(STAGING_HOST_DIR)/usr/lib/gopath
ADK_GO_BINPATH:=	$(ADK_GO_PATH)/bin/linux_$(ADK_GO_ARCH)
ADK_GO_TOOLDIR:=	$(ADK_GO_ROOT)/pkg/tool/linux_$(ADK_GO_ARCH)
ADK_GO:=		$(ADK_GO_ROOT)/bin/go
ADK_GO_TARGET_ENV:=	CGO_ENABLED=1 \
		        GOARCH=$(ADK_GO_ARCH) \
		        GOROOT="$(ADK_GO_ROOT)" \
			GOPATH="$(ADK_GO_PATH)" \
		        CC="$(TARGET_CC)" \
		        CXX="$(TARGET_CXX)" \
		        GOTOOLDIR="$(ADK_GO_TOOLDIR)"

