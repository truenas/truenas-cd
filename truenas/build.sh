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
	iso)
		scripts/merge-repos
		make -C ../ packagelists
		make -C ../ image-trees
		make -C ../ images CD=1
		make -C ../ imagesums
		;;
	*)
		exit_err "Invalid option selected"
		;;
esac
