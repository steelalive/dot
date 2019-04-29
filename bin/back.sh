#!/bin/bash
#-*- coding: utf-8 -*-
#2#::.. Last edit: - Mon Jun  5 03:54:22 EDT 2017 - by: -  - ..::## #_# - VERSION=0.0.0.2 - #_# #@#050617#@# #2#
#3#::..#####################_MAIN_#######################..::#3#
mount_point='/mnt/misc'
mount -v LABEL=MISC-HP ${mount_point}
echo "#####"
echo ""
# Check whether target volume is mounted, and mount it if not.
if ! mountpoint -q ${mount_point}/; then
	echo "Mounting the external USB drive."
	echo "Mountpoint is ${mount_point}"
	if ! mount ${mount_point}; then
		echo "An error code was returned by mount command!"
		exit 5
	else
		echo "Mounted successfully."
	fi
else
	echo "${mount_point} is already mounted."
fi
# Target volume **must** be mounted by this point. If not, die screaming.
if ! mountpoint -q ${mount_point}/; then
	echo "Mounting failed! Cannot run backup without backup volume!"
	exit 1
fi

echo "Preparing to transfer differences using rsync."
# Use the year to create a new backup directory each year.
current_year=$(date +%Y%m)
# Now construct the backup path, specifying the mount point followed by the path
# to our backup directory, finishing with the current year.
# (DO NOT end backup_path with a forward-slash.)
backup_path=${mount_point}'/BACK/'${current_year}

echo "Backup storage directory path is ${backup_path}"

echo "Starting backup of /home/bob . . . "
# Create the target directory path if it does not already exist.
mkdir --parents ${backup_path}
# Use rsync to do the backup, and pipe output to tee command (so it gets saved
# to file AND output to screen).
# Note that the 2>&1 part simply instructs errors to be sent to standard output
# so that we see them in our output file.
rsync --archive --verbose --human-readable --recursive --itemize-changes --progress \
	--delete --delete-excluded --hard-links --update \
	--exclude=.gvfs --exclude=Examples --exclude=.local/share/Trash/ \
	--exclude=.thumbnails --exclude=transient-items --exclude=aur \
	--exclude=.cache --exclude=.ccache --exclude=aur --exclude=trash \
	/mnt/root /etc /root ${backup_path} 2>&1 | tee /root/rsyncbackup.txt

# Ask user whether target volume should be unmounted.
echo -n "Do you want to unmount ${mount_point} (no)"
#read -p ": " unmount_ansun
unmount_answer=y
unmount_answer=${unmount_answer,,} # make lowercase
if [ "$unmount_answer" == "y" ] || [ "$unmount_answer" == "yes" ]; then
	if ! umount ${mount_point}; then
		echo "An error code was returned by umount command!"
		exit 5
	else
		echo "Dismounted successfully."
	fi
else
	echo "Volume remains mounted."
fi

echo ""
echo "####"
