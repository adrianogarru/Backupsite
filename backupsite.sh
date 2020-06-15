#!/bin/bash

#This Script will help to archive: Website Files, Database and Server Configuration Files.

#Configuration value to change in variables

PATH_TO_STORE="/home/pippo/"         #Main path where backup archive will be stored

DB_USER="pippo"                      #Database username (User per root privileges).
DB_PASSWORD="yourpassword"           #Database password.
NAME_BACK_UP_DB="all_DB_"            #Name of the backup database file.

PATH_TO_WEBSITE="/var/www"           #Path where folder of the files are stored.
NAME_FOLDER_WEBFILE="html/"          #Folder name where files are stored.
NAME_BACK_UP_WEBFILE="htmlfolder_"   #Name of the backup of website folder.

PATH_TO_CONFIGFIlE="/etc/httpd/"     #Path where are located the folder of the conf files of the server.
NAME_FOLDER_CONF="conf.d/"           #Folder name where conf files are stored.
NAME_BACK_UP_CONF="config"           #Name of the backup of the configuration files.

#End Configuration part

#Below here the operational instructions

#Backup Website Files

cd $PATH_TO_WEBSITE
tar -cvf $NAME_BACK_UP_WEBFILE$(date +%Y_%m_%d).tar $NAME_FOLDER_WEBFILE
mv $NAME_BACK_UP_WEBFILE$(date +%Y_%m_%d).tar $PATH_TO_STORE

#Backup All Database

mysqldump -h localhost -u $DB_USER -p$DB_PASSWORD --all-databases > all_DB_$(date +%Y_%m_%d).sql
mv $NAME_BACK_UP_DB$(date +%Y_%m_%d).sql $PATH_TO_STORE

#Backup Server Config File

cd $PATH_TO_CONFIGFIlE
tar -cvf $NAME_BACK_UP_CONF$(date +%Y_%m_%d).tar $NAME_FOLDER_CONF
mv $NAME_BACK_UP_CONF$(date +%Y_%m_%d).tar $PATH_TO_STORE



