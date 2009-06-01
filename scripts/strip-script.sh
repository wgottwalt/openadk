# Copyright (c) 2007
#	Thorsten Glaser <tg@mirbsd.de>
#
# Provided that these terms and disclaimer and all copyright notices
# are retained or reproduced in an accompanying document, permission
# is granted to deal in this work without restriction, including un-
# limited rights to use, publicly perform, distribute, sell, modify,
# merge, give away, or sublicence.
#
# Advertising materials mentioning features or use of this work must
# display the following acknowledgement:
#	This product includes material provided by Thorsten Glaser.
# This acknowledgement does not need to be reprinted if this work is
# linked into a bigger work whose licence does not allow such clause
# and the author of this work is given due credit in the bigger work
# or its accompanying documents, where such information is generally
# kept, provided that said credits are retained.
#
# This work is provided "AS IS" and WITHOUT WARRANTY of any kind, to
# the utmost extent permitted by applicable law, neither express nor
# implied; without malicious intent or gross negligence. In no event
# may a licensor, author or contributor be held liable for indirect,
# direct, other damage, loss, or other issues arising in any way out
# of dealing in the work, even if advised of the possibility of such
# damage or existence of a defect, except proven that it results out
# of said person's immediate fault when using the work as intended.
# Shell script to strip down a shell script (filter).

shopt -s extglob
cat "$@" | while read -r _line; do
	set -o noglob
	[[ $_line = \#* && $_line != @(#!)* ]] && continue
	[[ -n $_line ]] && builtin printf '%s\n' "$_line"
done
exit 0
