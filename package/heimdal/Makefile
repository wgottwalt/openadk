# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		heimdal
PKG_VERSION:=		1.5.3
PKG_RELEASE:=		3
PKG_HASH:=		aac27bedb33c341b6aed202af07ccc816146a893148721f8123abbbf93bbfea5
PKG_DESCR:=		kerberos server
PKG_SECTION:=		app/crypto
PKG_URL:=		http://www.h5l.org/
PKG_SITES:=		http://www.h5l.org/dist/src/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_CFLINE_HEIMDAL:=	depends on ADK_HOST_ONLY

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,HEIMDAL,heimdal,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		manual

ifeq ($(OS_FOR_BUILD),Darwin)
HOST_CFLAGS+=		-DHAVE_STRLCPY -DHAVE_STRLCAT
endif

HOST_CONFIGURE_ARGS+=	--disable-pk-init \
			--without-openldap \
			--without-x \
			--disable-kcm \
			--disable-kx509 \
			--disable-ndbm-db \
			--without-berkeley-db \
			--disable-sqlite-cache \
			--disable-heimdal-documentation \
			--disable-otp

host-configure:
	cd ${WRKBUILD}; \
	    env ${HOST_CONFIGURE_ENV} \
	    ${BASH} ${WRKSRC}/${CONFIGURE_PROG} \
	    --program-prefix= \
	    --program-suffix= \
	    --prefix=/usr \
	    --bindir=/usr/bin \
	    --datadir=/usr/share \
	    --mandir=/usr/share/man \
	    --libdir=/usr/lib \
	    --libexecdir=/usr/libexec \
	    --localstatedir=/var \
	    --sysconfdir=/etc \
	    --disable-dependency-tracking \
	    --disable-libtool-lock \
	    --disable-nls \
	    ${HOST_CONFIGURE_ARGS} $(MAKE_TRACE)

host-build:
	${MAKE} -C ${WRKBUILD}/include
	${MAKE} -C ${WRKBUILD}/lib/roken
	${MAKE} -C ${WRKBUILD}/lib/vers
	${MAKE} -C ${WRKBUILD}/lib/libedit
	#${MAKE} -C ${WRKBUILD}/lib/com_err compile_et$(EXEEXT) LDFLAGS="-all-static"
	${MAKE} -C ${WRKBUILD}/lib/asn1 asn1_compile$(EXEEXT) LDFLAGS="-all-static"

host-install:

heimdal-hostinstall:
	$(CP) $(WRKBUILD)/lib/asn1/asn1_compile \
		$(STAGING_HOST_DIR)/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
