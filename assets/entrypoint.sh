#!/bin/sh
XE_LINUX_DISTRIBUTION=/usr/sbin/xe-linux-distribution
XE_LINUX_DISTRIBUTION_CACHE=/var/cache/xe-linux-distribution
XE_DAEMON=/usr/sbin/xe-daemon

# copy udev rules to host (doesn't seem to work currently)
for rule in /etc/udev/rules.d/*; do
	cp ${rule} /host/etc/udev/rules.d/${rule}
done

# detect OS type
${XE_LINUX_DISTRIBUTION} ${XE_LINUX_DISTRIBUTION_CACHE}

# ensure that xenfs is mounted to /proc/xen
if [[ ! -e /proc/xen/xenbus ]]; then
	modprobe xenfs
	mount -t xenfs none /proc/xen
fi

# start the daemon
exec ${XE_DAEMON}
