#!/bin/bash
cat setup_mysql_dev.sql | mysql -uroot -hlocalhost -p
wait
cat setup_mysql_test.sql | mysql -uroot -hlocalhost -p
wait
cat 10-dump.sql | mysql -uroot -hlocalhost -p

