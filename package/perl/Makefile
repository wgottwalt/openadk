# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		perl
PKG_VERSION:=		5.18.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		304cb5bd18e48c44edd6053337d3386d
PKG_DESCR:=		Perl interpreter
PKG_SECTION:=		lang
PKG_BUILDDEP:=		perl-host
PKG_URL:=		http://www.perl.org/
PKG_SITES:=		http://www.cpan.org/src/
PKG_NOPARALLEL:=	1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

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
	$(SED) "s#@@STAGING_HOST_DIR@@/perl-host#./perl#" ${WRKBUILD}/Makefile.SH 
	$(SED) "s#@@LIB@@#-Ilib#" ${WRKBUILD}/Makefile.SH 
	# darwin workaround
	$(SED) "s#^usedl.*##" ${WRKBUILD}/hints/darwin.sh
	(cd ${WRKBUILD}; ${BASH} ./Configure -des -Duseperlio -Uusedl -Uusethreads -Uuseshrplib -Dprefix=${STAGING_HOST_DIR}/usr)

host-build:
	cd ${WRKBUILD} && env CC_FOR_BUILD="gcc" ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} ${HOST_ALL_TARGET} $(MAKE_TRACE)

perl-hostinstall:
	cd ${WRKBUILD} && env CC_FOR_BUILD="gcc" ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} ${HOST_INSTALL_TARGET} $(MAKE_TRACE)
	mv ${STAGING_HOST_DIR}/usr/bin/perl ${STAGING_HOST_DIR}/usr/bin/perl-host
	cp ${WRKBUILD}/miniperl ${STAGING_HOST_DIR}/usr/bin

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
	$(SED) "s#@@STAGING_HOST_DIR@@#${STAGING_HOST_DIR}/usr/bin#" ${WRKBUILD}/Makefile.SH 
	$(SED) "s#@@LIB@@##" ${WRKBUILD}/Makefile.SH 
	(cd ${WRKBUILD}; ./Configure -S)

do-build:
	(cd ${WRKBUILD}; $(CP) config.h xconfig.h; $(MAKE) miniperl)
	(cd ${WRKBUILD}; $(CP) miniperl miniperl.target)
	$(CP) $(STAGING_HOST_DIR)/usr/bin/miniperl ${WRKBUILD}/
	touch ${WRKBUILD}/miniperl
	(cd ${WRKBUILD}; $(MAKE))

do-install:
	(cd ${WRKBUILD}; $(STAGING_HOST_DIR)/usr/bin/perl-host installperl --destdir=${WRKINST})

perl-install:
	${INSTALL_DIR} ${IDIR_PERL}/usr/bin
	${INSTALL_DIR} ${IDIR_PERL}/usr/lib/perl5/${PKG_VERSION}
	${CP} ${WRKINST}/usr/lib/perl5/${PKG_VERSION}/* \
		${IDIR_PERL}/usr/lib/perl5/${PKG_VERSION}
	${INSTALL_BIN} ${WRKINST}/usr/bin/perl ${IDIR_PERL}/usr/bin/

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
