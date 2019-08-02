#!/usr/bin/make -f

update-debian:
	sh build.sh debmirror

update-truenas:
	sh build.sh truenasmirror

update-mirrors: update-debian update-truenas

# Cleanup everything
clean: 
	sh build.sh clean

# Sync and build all
all:
