# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

host-extract: ${_HOST_PATCH_COOKIE}

host-configure:
${_HOST_CONFIGURE_COOKIE}: ${_HOST_PATCH_COOKIE}
		#@sed -e '/^#/d' ${REORDER_DEPENDENCIES} | \
		#tsort | while read f; do \
		#	cd ${WRKSRC}; \
		#	case $$f in \
		#	/*) \
		#		find . -name "$${f#/}" -print | while read i; do \
		#			touch "$$i"; \
		#		done;; \
		#	*) \
		#		if test -e "$$f" ; then \
		#			touch "$$f"; \
		#		fi;; \
		#	esac; \
		#done
		@mkdir -p ${WRKBUILD}
		@$(CMD_TRACE) "configuring... "
		@cd ${WRKBUILD}; \
		    for i in $$(find . -name config.sub);do \
			if [ -f $$i ]; then \
				${CP} $$i $$i.bak; \
				${CP} ${SCRIPT_DIR}/config.sub $$i; \
			fi; \
		    done; \
		    for i in $$(find . -name config.guess);do \
			if [ -f $$i ]; then \
			${CP} $$i $$i.bak; \
			${CP} ${SCRIPT_DIR}/config.guess $$i; \
		fi; \
	    done;
	cd ${WRKBUILD}; rm -f config.{cache,status}; \
	    env ${HOST_CONFIGURE_ENV} \
	    ${BASH} ${WRKSRC}/${CONFIGURE_PROG} \
	    --program-prefix= \
	    --program-suffix= \
	    --prefix=/usr \
	    --bindir=/usr/bin \
	    --datadir=/usr/share \
	    --mandir=/usr/share/man \
	    --libexecdir=/usr/libexec \
	    --localstatedir=/var \
	    --sysconfdir=/etc \
	    --disable-dependency-tracking \
	    --disable-libtool-lock \
	    --disable-nls \
	    ${HOST_CONFIGURE_ARGS} $(MAKE_TRACE)
	touch $@

host-build:
${_HOST_BUILD_COOKIE}: ${_HOST_CONFIGURE_COOKIE}
	@$(CMD_TRACE) "compiling... "
	cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
	    ${HOST_MAKE_FLAGS} ${HOST_ALL_TARGET} $(MAKE_TRACE)
	touch $@

hpkg-install: ${ALL_HOSTINST}
host-install:
${_HOST_FAKE_COOKIE}: ${_HOST_BUILD_COOKIE}
	cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
	    DESTDIR='${HOST_WRKINST}' ${HOST_FAKE_FLAGS} ${HOST_INSTALL_TARGET} $(MAKE_TRACE)
	env ${HOST_MAKE_ENV} ${MAKE} hpkg-install $(MAKE_TRACE)
	rm -rf ${WRKBUILD} ${WRKDIST} ${WRKSRC}
	exec ${MAKE} host-extract $(MAKE_TRACE)
	touch $@

${_HOST_COOKIE}:
	exec ${MAKE} hostpackage

hostpackage: ${ALL_HOSTDIRS}
	touch ${_HOST_COOKIE}

