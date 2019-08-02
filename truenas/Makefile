#!/usr/bin/make -f

update-debian:
	sh build.sh debmirror

update-truenas:
	sh build.sh truenasmirror

update-mirrors: update-debian update-truenas

# Cleanup everything
clean: 
	sh build.sh clean

iso:
	sh build.sh iso

# Sync and build all
all: update-debian update-truenas iso
