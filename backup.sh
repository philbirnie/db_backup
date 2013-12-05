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
SITENAME="site"
DB_USER="user"
DB_PASSWORD="password"
DB_DATABASE="database"

# Get MySQL Dump
mysqldump -u ${DB_USER} -p${DB_PASSWORD} ${DB_DATABASE} > ./backups/prod.sql

printf "Database Exported\n"

tar -cvf ./backups/${SITENAME}_$YYYY$MM$DD.tar ./backups/prod.sql

printf "${SITENAME}_$YYYY$MM$DD.tar Creation Complete!\n"

#GZIP file. 
gzip -f ./backups/${SITENAME}_$YYYY$MM$DD.tar

printf "Gzip Complete!\n"

# Remove tmp file.
rm ./backups/prod.sql

# Remove Files that are > 10 Days Old 

find ./backups -mtime +10 -exec rm -f {} \;

printf "Deletion of Old File Complete!\n"

exit 0
