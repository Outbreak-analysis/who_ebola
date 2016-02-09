# who_ebola

### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: Makefile

##################################################################


# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
# include $(ms)/perl.def

##################################################################

## Content

Sources += $(wildcard *.R)

source.Rout:	source.R
		$(run-R)

ebola_dl.Rout:	source.Rout ebola_dl.R
		$(run-R)

ebola_dl_sample.Rout:	source.Rout sample.R ebola_dl.R
			$(run-R)

ebola_summary_dl.Rout:	source.Rout ebola_summary_dl.R
			$(run-R)

ebola_summary_dl_sample.Rout:	source.Rout sample.R ebola_summary_dl.R
				$(run-R)


######################################################################

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
-include $(ms)/oldlatex.mk
