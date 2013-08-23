#!/usr/bin/env bash

$USER_DIR=number-sensei

echo '#######################################################'
echo '## load RVM ruby'
echo '#######################################################'
source "$HOME/.rvm/scripts/rvm"

echo '#######################################################'
echo '## change directory'
echo '#######################################################'
ORIG=`pwd`
DIR=/home/ubuntu/$USER_DIR
cd $DIR
echo "Current dir is $DIR"

echo '#######################################################'
echo '## find the pid of current server'
echo '#######################################################'
PID=''
PID=`cat $DIR/tmp/pids/server.pid`
if [ -n "$PID" ]; then
 echo "Stopping currently running server pid=$PID.."
 sudo kill $PID
fi

echo '#######################################################'
echo '## update repository'
echo '#######################################################'
git pull origin master
if [ $? -ne 0 ];then
 echo 'Exiting..'
 exit 1
fi

echo '#######################################################'
echo '## update gems for production'
echo '#######################################################'
bundle install --without development test
if [ $? -ne 0 ];then
 echo 'Exiting..'
 exit 1
fi

echo '#######################################################'
echo '## update databases'
echo '#######################################################'
RAILS_ENV=production rake db:migrate
if [ $? -ne 0 ];then
 echo 'Exiting..'
 exit 1
fi


echo '#######################################################'
echo '## compile assets required for production deploy'
echo '#######################################################'
RAILS_ENV=production rake assets:precompile
if [ $? -ne 0 ];then
 echo 'Exiting..'
 exit 1
fi

echo '#######################################################'
echo '## Starting Thin server'
echo '#######################################################'
export rvmsudo_secure_path=1 #this line prevents a warning
rvmsudo rails server thin -p 80 -e production -d

echo '#######################################################'
echo '## Going back to $ORIG'
echo '#######################################################'
cd $ORIG

