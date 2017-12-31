all:  srmbootraw.de.8 aboot.de.8 aboot.conf.de.5 abootconf.de.8 isomarkboot.de.1 sdisklabel.de.8 srmbootfat.de.1 e2writeboot.de.8 swriteboot.de.8 netabootwrap.de.1

aboot.de.8: aboot.sgml
	nsgmls aboot.sgml | sgmlspl docbook2man-de-spec.pl
	mv aboot.8 aboot.de.8

aboot.conf.de.5: aboot.conf.sgml
	nsgmls aboot.conf.sgml | sgmlspl docbook2man-de-spec.pl
	mv aboot.conf.5 aboot.conf.de.5

abootconf.de.8: abootconf.sgml
	nsgmls abootconf.sgml | sgmlspl docbook2man-de-spec.pl
	mv abootconf.8 abootconf.de.8

netabootwrap.de.1: netabootwrap.sgml
	nsgmls netabootwrap.sgml | sgmlspl docbook2man-de-spec.pl
	mv netabootwrap.1 netabootwrap.de.1

isomarkboot.de.1: isomarkboot.sgml
	nsgmls isomarkboot.sgml | sgmlspl docbook2man-de-spec.pl
	mv isomarkboot.1 isomarkboot.de.1

sdisklabel.de.8: sdisklabel.sgml
	nsgmls sdisklabel.sgml | sgmlspl docbook2man-de-spec.pl
	mv sdisklabel.8 sdisklabel.de.8

srmbootfat.de.1: srmbootfat.sgml
	nsgmls srmbootfat.sgml | sgmlspl docbook2man-de-spec.pl
	mv srmbootfat.1 srmbootfat.de.1

srmbootraw.de.8: srmbootraw.sgml
	nsgmls srmbootraw.sgml | sgmlspl docbook2man-de-spec.pl
	mv srmbootraw.8 srmbootraw.de.8

e2writeboot.de.8: e2writeboot.8
	ln -s e2writeboot.8 e2writeboot.de.8

swriteboot.de.8: swriteboot.8
	ln -s  swriteboot.8 swriteboot.de.8

clean :
	rm -f *.html *.de.? srmbootraw.8 srmbootfat.1 sdisklabel.8 isomarkboot.8 abootconf.8 aboot.conf.5 aboot.8 netabootwrap.1 manpage.links manpage.log manpage.refs
	rm -rf SRM-HOWTO 


#.PHONY clean
