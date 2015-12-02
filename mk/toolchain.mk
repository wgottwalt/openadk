prepare: ${WRKDIST}/.prepared
configure: ${WRKBUILD}/.configured
compile: $(WRKBUILD)/.compiled
install: $(WRKBUILD)/.installed
final: $(WRKBUILD)/.final
clean:
	rm -rf $(WRKDIR)
