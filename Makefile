.SILENT:

sinclude mk/rules.mk
include mk/objective.mk

SUBDIRS = Plugins libaudacious intl $(SUBDIR_GUESS) audacious audtool po icons skin

install-posthook:
	@if test `whoami` = 'root' && test -z "$(DESTDIR)"; then \
		echo "[running ldconfig to update system library cache]"; \
		/sbin/ldconfig; \
		echo "[system library cache updated]"; \
	fi

OBJECTIVE_DATA =							\
	audacious.pc:$(LIBDIR)/pkgconfig				\
	audacious.1:$(mandir)/man1					\
	audacious/audacious.desktop:$(datadir)/applications
