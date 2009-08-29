#
# Regular cron jobs for the reconnoiter package
#
0 4	* * *	root	[ -x /usr/bin/reconnoiter_maintenance ] && /usr/bin/reconnoiter_maintenance
