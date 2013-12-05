Generic Database Backup Script
------------------------------

## Purpose

This is a generic database backup script that will automatically
save gzipped database dumps for 10 days.

## Installation

Place this repository in a directory above the web root.

Set database variables (host, login, password, database) within the `backup.sh`
script.  You will also need to add a reference to this script to your
cron. Example that will run this script each day at 4:01 AM.

`1 4 * * * /path/to/backup.sh > /path/to/backup/cron.log 2>&1`