# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		perl
PKG_VERSION:=		5.18.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		304cb5bd18e48c44edd6053337d3386d
PKG_DESCR:=		Perl interpreter
PKG_SECTION:=		lang
PKG_BUILDDEP:=		perl-host
PKG_URL:=		http://www.perl.org/
PKG_SITES:=		http://www.cpan.org/src/

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,PERL,perl,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,PERL,perl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_STYLE:=		manual
CONFIG_STYLE:=          manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

# ld memory exhausted problem
TARGET_CFLAGS:=		$(subst g3,g,$(TARGET_CFLAGS))

host-configure:
	(cd ${WRKBUILD}; ./Configure -der -Uusedl)

host-build:
	cd ${WRKBUILD} && env CC_FOR_BUILD="gcc" ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} ${HOST_ALL_TARGET} $(MAKE_TRACE)

perl-hostinstall:
	$(CP) ${WRKBUILD}/miniperl $(STAGING_HOST_DIR)/usr/bin
	$(CP) ${WRKBUILD}/perl $(STAGING_HOST_DIR)/usr/bin

do-configure:
	sed \
		-e 's!%%CC%%!$(TARGET_CC)!g' \
		-e 's!%%CFLAGS%%!$(TARGET_CFLAGS) -DUSE_CROSS_COMPILE $(TARGET_CPPFLAGS)!g' \
		-e 's!%%CPP%%!$(TARGET_CROSS)gcc -E!g' \
		-e 's!%%AR%%!$(TARGET_CROSS)ar!g' \
		-e 's!%%LD%%!$(TARGET_CROSS)gcc!g' \
		-e 's!%%LDFLAGS%%!-rdynamic $(TARGET_LDFLAGS)!g' \
		-e 's!%%CPPFLAGS%%!$(TARGET_CPPFLAGS)!g' \
		-e 's!%%LIBDIRS%%!$(STAGING_TARGET_DIR)/lib $(STAGING_TARGET_DIR)/usr/lib!g' \
		-e 's!%%INCDIRS%%!$(STAGING_TARGET_DIR)/include $(STAGING_TARGET_DIR)/usr/include!g' \
		./files/config.sh.$(CPU_ARCH).$(ADK_TARGET_LIBC) > ${WRKBUILD}/config.sh
	(cd ${WRKBUILD}; ./Configure -S)

do-build:
	(cd ${WRKBUILD}; $(CP) config.h xconfig.h; $(MAKE) miniperl)
	(cd ${WRKBUILD}; $(CP) miniperl miniperl.target)
	$(CP) $(STAGING_HOST_DIR)/usr/bin/miniperl ${WRKBUILD}/
	touch ${WRKBUILD}/miniperl
	(cd ${WRKBUILD}; $(MAKE))

do-install:
	(cd ${WRKBUILD}; $(CP) miniperl.target miniperl)
	(cd ${WRKBUILD}; $(STAGING_HOST_DIR)/usr/bin/perl installperl --destdir=${WRKINST})

perl-install:
	${INSTALL_DIR} ${IDIR_PERL}/usr/bin
	${INSTALL_DIR} ${IDIR_PERL}/usr/lib/perl5/${PKG_VERSION}
	${CP} ${WRKINST}/usr/lib/perl5/${PKG_VERSION}/* \
		${IDIR_PERL}/usr/lib/perl5/${PKG_VERSION}
	${INSTALL_BIN} ${WRKINST}/usr/bin/perl ${IDIR_PERL}/usr/bin/

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
