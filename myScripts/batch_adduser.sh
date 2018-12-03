#!/bin/bash

if [ -f $1 ]
then
for i in $(cat $1)
do
if [ -f /usr/bin/pwgen ]
then
PASSWORD=$(pwgen -1 -s 16)
else
PASSWORD=$(cat /dev/urandom | tr -dc "passwordNSR!@#$%0-9" | fold -w 9 | head -1)
fi
adduser --quiet --disabled-password  --gecos "" $i
echo -e "$PASSWORD\n$PASSWORD\n" | passwd --quiet $i
sudo usermod -a -G docker $i
echo "$i --------- $PASSWORD" >>./userlist-created
done
else
echo "File userlist not found"
fi