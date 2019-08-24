#!/bin/sh

. ./conf/CONF.sh

exit_err() {
	echo "$@"
	exit 1
}

set_zfs_mod() {
	ZFSMOD=$(ls /srv/aptly-publish/truenas/unstable/pool/main/z/zfs-dkms-bin/ | grep zfs-modules | head -n 1 | cut -d '_' -f 1)
	if [ -z "$ZFSMOD" ] ; then
		echo "ERROR locating zfs-modules package"
		exit 1
	fi
	sed -i'' "s|%%ZFSMOD%%|${ZFSMOD}|g" ../tasks/truenas-truenas-essential
	sed -i'' "s|%%ZFSMOD%%|${ZFSMOD}|g" ../truenas/conf/preseed.cfg
}

case $1 in
	clean)
		make -C ../ distclean
		;;
	iso)
		set_zfs_mod
		make -C ../ packagelists
		make -C ../ image-trees
		make -C ../ images
		make -C ../ imagesums
		;;
	*)
		exit_err "Invalid option selected"
		;;
esac
