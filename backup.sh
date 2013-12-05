#!/bin/bash
#
# Backup Script for Magento 
#
# pbirnie@marketingadept.com
# November 13, 2013
# 


#Get Current Date -- Split into Year, Month Day
YYYY=$(date +%Y)
MM=$(date +%m)
DD=$(date +%d)
SITENAME="sitename"
DB_USER="db_user"
DB_PASSWORD="db_password"
DB_DATABASE="database"

# Get MySQL Dump
mysqldump -u ${DB_USER} -p${DB_USER} ${DATABASE} > ./backups/prod.sql

printf "Database Exported\n"

tar -cvf ./backups/bosca_$YYYY$MM$DD.tar ./backups/prod.sql

printf "$SITENAME_$YYYY$MM$DD.tar Creation Complete!\n"

#GZIP file. 
gzip ./backups/bosca_$YYYY$MM$DD.tar

printf "Gzip Complete!\n"

# Remove tmp file.
rm ./backups/prod.sql

# Remove Files that are > 10 Days Old 

find ./backups -mtime +10 -exec rm -f {} \;

printf "Deletion of Old File Complete!\n"

exit 0