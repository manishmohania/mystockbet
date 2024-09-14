# mystockbet
stock charting and analysis tool

This web application uses below javascript api/libraries which are covered under their respective licenses. Please note some of them are not free for commercial use.

https://github.com/manishmohania/mystockbet/tree/main/webapp/scripts

bootstrap
https://github.com/manishmohania/mystockbet/tree/main/webapp/scripts/bootstrap-5.3.2-dist

canvasjs
https://github.com/manishmohania/mystockbet/tree/main/webapp/scripts/canvasjs

popper
https://github.com/manishmohania/mystockbet/tree/main/webapp/scripts/core-2.11.8/package

jquery
https://github.com/manishmohania/mystockbet/blob/main/webapp/scripts/jquery-3.7.1.js

twitter typeahead
https://github.com/manishmohania/mystockbet/blob/main/webapp/scripts/typeahead.bundle.js


Installation
Install LAMP
L - Linux
A - Apache webserver
M - Maria DB
P - PHP
Steps to install LAMP may depend on your operating system.

Below are the steps for Ubuntu Linux:
To install Apache, open terminal and run below command:
sudo apt-get install apache2
check the apache2 status:
sudo service apache2 status

Create directory named 'mystockbet' inside apache webserver document root folder '/var/www/html/'
sudo mkdir /var/www/html/mystockbet

Copy all files from mystockbet/webapp to directory /var/www/html/mystockbet
sudo cp -r mystockbet/webapp/* /var/www/html/mystockbet/

Install PHP
sudo apt-get install php

Install mariadb/mysql driver
sudo apt-get install php-mysql


To install Maria DB, open terminal and run below command:
sudo apt-get install mariadb-server

sudo mysql
You will be dropped to mysql prompt. on mysql prompt run below sql statements to create database named 'nse' and to create user 'manish' with password 'mohania':
CREATE USER 'manish'@'localhost' IDENTIFIED BY 'mohania';
create database nse;
GRANT ALL PRIVILEGES ON nse.* TO 'manish'@'localhost';
exit;

check if you have access to nse database.
mysql -umanish -pmohania
on mysql prompt:
show databases;
use nse;
exit;


create tables.
mysql -umanish -pmohania nse < mystockbet/dbscripts/nse_backup.sql

check if tables have been created
mysql -umanish -pmohania -e 'use nse; show tables'


Set up Cron Jobs.

mkdir $HOME/nse-automation-scripts
cp mystockbet/cronjobs/*.* $HOME/nse-automation-scripts/
mkdir $HOME/nsemysqluploads
mkdir $HOME/nseprocessedfiles

check if $HOME/Downloads directory exists. If it doesn't exist then create this directory.
mkdir $HOME/Downloads

Update path to point to your home directory in file mystockbet/cronjobs/crontab-schedule-list.txt and file mystockbet/cronjobs/start_sec_full_data_load.sh
Setup cron job schedules as mentioned in file: mystockbet/cronjobs/crontab-schedule-list.txt
These cron jobs are python script which connect to nse and download end of day reports from nse and store and process them in MariaDB. We need to install mariadb connector driver to connect from python.

Install pip :
sudo apt-get install python3-pip
sudo apt-get install libmariadb-dev

Create Virtural Environment:
sudo apt-get install python3-venv
cd
mkdir ~/.venvs
python3 -m venv ~/.venvs/mystockbetvenv
~/.venvs/mystockbetvenv/bin/python -m pip install mariadb

Install curl:
sudo apt-get install curl
