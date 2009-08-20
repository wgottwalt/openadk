prepare: ${WRKDIST}/.prepared $(WRKBUILD)/.headers
configure: ${WRKBUILD}/.configured
compile: $(WRKBUILD)/.compiled
install: $(WRKBUILD)/.installed
clean:
	rm -rf $(WRKDIR)
