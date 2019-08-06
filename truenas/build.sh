#!/bin/sh

. ./conf/CONF.sh

exit_err() {
	echo "$@"
	exit 1
}

case $1 in
	clean)
		make -C ../ distclean
		;;
	iso)
		make -C ../ packagelists
		make -C ../ image-trees
		make -C ../ images
		make -C ../ imagesums
		;;
	*)
		exit_err "Invalid option selected"
		;;
esac
