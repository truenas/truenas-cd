#!/bin/sh

. ./conf/CONF.sh

exit_err() {
	echo "$@"
	exit 1
}

case $1 in
	truenasmirror)
		scripts/update-mirror truenas
		;;
	debmirror)
		scripts/update-mirror debian
		;;
	clean)
		make -C ../ distclean
		;;
	*)
		exit_err "Invalid option selected"
		;;
esac
