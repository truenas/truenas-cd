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
		if [ $? -ne 0 ] ; then
			exit 1
		fi
		make -C ../ packagelists
		make -C ../ image-trees
		make -C ../ images
		make -C ../ imagesums
		;;
	*)
		exit_err "Invalid option selected"
		;;
esac
