# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

host-extract: ${_HOST_PATCH_COOKIE}

hostpre-configure:
host-configure:
${_HOST_CONFIGURE_COOKIE}: ${_HOST_PATCH_COOKIE}
	mkdir -p ${WRKBUILD}
	@$(CMD_TRACE) "configuring.. "
ifneq (,$(filter autogen,${AUTOTOOL_STYLE}))
	@$(CMD_TRACE) "autotool configuring.. "
	@cd ${WRKSRC}; env ${AUTOTOOL_ENV} $(BASH) autogen.sh $(MAKE_TRACE)
endif
ifneq (,$(filter autoreconf,${AUTOTOOL_STYLE}))
	cd ${WRKSRC}; env ${AUTOTOOL_ENV} autoreconf -if $(MAKE_TRACE)
	@rm -rf ${WRKSRC}/autom4te.cache
	@touch ${WRKDIR}/.autoreconf_done
endif
	@${MAKE} hostpre-configure $(MAKE_TRACE)
ifeq (${HOST_STYLE},)
	cd ${WRKBUILD}; \
	    env ${HOST_CONFIGURE_ENV} \
	    ${BASH} ${WRKSRC}/${CONFIGURE_PROG} \
	    --program-prefix= \
	    --program-suffix= \
	    --prefix=${STAGING_HOST_DIR}/usr \
	    --bindir=${STAGING_HOST_DIR}/usr/bin \
	    --datadir=${STAGING_HOST_DIR}/usr/share \
	    --mandir=${STAGING_HOST_DIR}/usr/share/man \
	    --libdir=${STAGING_HOST_DIR}/usr/lib \
	    --libexecdir=${STAGING_HOST_DIR}/usr/libexec \
	    --sysconfdir=${STAGING_HOST_DIR}/etc \
	    --disable-dependency-tracking \
	    --disable-libtool-lock \
	    --disable-nls \
	    ${HOST_CONFIGURE_ARGS} $(MAKE_TRACE)
endif
ifeq (${HOST_STYLE},auto)
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
endif
ifeq (${HOST_STYLE},manual)
	${MAKE} host-configure $(MAKE_TRACE)
endif
ifeq (${HOST_STYLE},perl)
	@$(CMD_TRACE) "configuring perl module.. "
	cd ${WRKBUILD}; \
		PATH='${HOST_PATH}' \
		PERL_MM_USE_DEFAULT=1 \
		PERL_AUTOINSTALL=--skipdeps \
		$(HOST_PERL_ENV) \
		perl-host Makefile.PL ${HOST_CONFIGURE_ARGS}
endif
	touch $@

host-build:
${_HOST_BUILD_COOKIE}: ${_HOST_CONFIGURE_COOKIE}
ifneq (${HOST_STYLE},manual)
	@$(CMD_TRACE) "compiling.. "
	cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
	    ${HOST_MAKE_FLAGS} ${HOST_ALL_TARGET} $(MAKE_TRACE)
endif
	${MAKE} host-build $(MAKE_TRACE)
	touch $@

hostpost-install:
host-install: ${ALL_HOSTINST}
${_HOST_FAKE_COOKIE}: ${_HOST_BUILD_COOKIE}
	@$(CMD_TRACE) "installing.. "
	@mkdir -p ${HOST_WRKINST}
ifeq (${HOST_STYLE},)
	cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
	    DESTDIR='' ${HOST_FAKE_FLAGS} ${HOST_INSTALL_TARGET} $(MAKE_TRACE)
endif
ifeq (${HOST_STYLE},auto)
	cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
	    DESTDIR='${STAGING_HOST_DIR}' ${HOST_FAKE_FLAGS} ${HOST_INSTALL_TARGET} $(MAKE_TRACE)
endif
ifeq (${HOST_STYLE},manual)
	env ${HOST_MAKE_ENV} ${MAKE} host-install $(MAKE_TRACE)
endif
	env ${HOST_MAKE_ENV} ${MAKE} hostpost-install $(MAKE_TRACE)
	@find $(STAGING_HOST_DIR) -name \*.la -exec rm {} \;
	@for a in $(STAGING_HOST_DIR)/usr/bin/*-config; do \
		[[ -e $$a ]] || continue; \
		$(SED) "s,^prefix=.*,prefix=$(STAGING_HOST_DIR)/usr," $$a; \
		chmod u+x $(STAGING_HOST_DIR)/usr/bin/$$(basename $$a); \
	done
	touch $@

${_HOST_COOKIE}:
	printf wbxdebug
	exec ${MAKE} hostpackage

ifeq ($(HOST_LINUX_ONLY),)
hostpackage: ${ALL_HOSTDIRS}
	touch ${_HOST_COOKIE}
endif

hostclean:
	@$(CMD_TRACE) "cleaning.. "
	rm -r ${STAGING_PKG_DIR}/stamps/${PKG_NAME}*-host
	rm -rf ${WRKDIR} 
