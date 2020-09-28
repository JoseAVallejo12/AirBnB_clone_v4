source=""
# config source for Start web server
if [ "$1" == "webserver" ] 
then
  source="web_dynamic.$2-hbnb"
# config source for Start api server
elif [ "$1" == "api" ]
then
  source="api.v1.app"
# Start console
elif [ "$1" == "console" ]
then
  HBNB_MYSQL_USER=hbnb_dev HBNB_MYSQL_PWD=hbnb_dev_pwd HBNB_MYSQL_HOST=localhost HBNB_MYSQL_DB=hbnb_dev_db HBNB_TYPE_STORAGE=db python3 ./console.py
else
  echo "****************************************************************"
  echo "Use: ./start.sh <service: webserver or api> <number file: 1, 2..>"
  echo "****************************************************************"
fi
# Start app
if [[ $source != "" ]]
then
  HBNB_MYSQL_USER=hbnb_dev HBNB_MYSQL_PWD=hbnb_dev_pwd HBNB_MYSQL_HOST=localhost HBNB_MYSQL_DB=hbnb_dev_db HBNB_TYPE_STORAGE=db python3 -m $source
fi