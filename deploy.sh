#!/usr/bin/env bash

USER_DIR=number-sensei-rails-4

echo
echo '#######################################################'
echo '## load RVM'
echo '#######################################################'
source "$HOME/.rvm/scripts/rvm"

echo
echo '#######################################################'
echo '## change directory'
echo '#######################################################'
ORIG=`pwd`
DIR=/home/ubuntu/$USER_DIR
cd $DIR
echo "Current dir is $DIR"

echo
echo '#######################################################'
echo '## kill the current server'
echo '#######################################################'
PID=''
PID=`cat $DIR/tmp/pids/server.pid`
if [ -n "$PID" ]; then
 echo "Stopping currently running server pid=$PID.."
 sudo kill $PID
fi

echo
echo '#######################################################'
echo '## update repository'
echo '#######################################################'
git pull origin master
if [ $? -ne 0 ];then
 echo 'Exiting..'
 exit 1
fi

echo
echo '#######################################################'
echo '## update gems for production'
echo '#######################################################'
bundle install --without development test
if [ $? -ne 0 ];then
 echo 'Exiting..'
 exit 1
fi

echo
echo '#######################################################'
echo '## migrate database'
echo '#######################################################'
RAILS_ENV=production rake db:migrate
if [ $? -ne 0 ];then
 echo 'Exiting..'
 exit 1
fi

echo
echo '#######################################################'
echo '## precompile assets '
echo '#######################################################'
rake assets:precompile RAILS_ENV=production #--trace
if [ $? -ne 0 ];then
 echo 'Exiting..'
 exit 1
fi

echo
echo '#######################################################'
echo '## start Thin server'
echo '#######################################################'
export rvmsudo_secure_path=1 #this line prevents a warning
rvmsudo rails server thin -p 80 -e production -d

echo
echo '#######################################################'
echo '## cd back to $ORIG'
echo '#######################################################'
cd $ORIG
