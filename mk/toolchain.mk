prepare: ${WRKDIST}/.prepared $(WRKBUILD)/.headers
configure: ${WRKBUILD}/.configured
compile: $(WRKBUILD)/.compiled
install: $(WRKBUILD)/.installed
fixup: $(WRKBUILD)/.fixup
clean:
	rm -rf $(WRKDIR)
