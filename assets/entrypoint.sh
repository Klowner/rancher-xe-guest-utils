#!/bin/sh


# copy udev rules to host
for rule in /etc/udev/rules.d/*; do
	cp ${rule} /host/etc/udev/rules.d/${rule}
done

# ensure that xenfs is mounted to /proc/xen
if [[ ! -e /proc/xen/xenbus ]]; then
	modprobe xenfs
	mount -t xenfs none /proc/xen
fi

# start the daemon
exec /usr/sbin/xe-daemon
