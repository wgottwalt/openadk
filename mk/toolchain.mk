prepare: ${WRKDIST}/.prepared $(WRKBUILD)/.headers
configure: ${WRKBUILD}/.configure_done
compile: $(WRKBUILD)/.compiled
install: $(WRKBUILD)/.installed
clean:
	rm -rf $(WRKDIR)
