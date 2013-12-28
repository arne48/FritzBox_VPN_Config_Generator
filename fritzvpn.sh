#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir $DIR/tmp
_temp="$DIR/tmp/answer.$$"


cp $DIR/template/template.cfg ./
cp $DIR/template/template.pcf ./

dialog --backtitle "FritzVPN Config Generator"\
       --inputbox "Enter the name of the profile" 8 52 2>$_temp
profilename=`cat $_temp`

dialog --backtitle "FritzVPN Config Generator"\
       --inputbox "Enter ip or dyndns adress of your FritzBox" 8 52 2>$_temp
host=`cat $_temp`

dialog --backtitle "FritzVPN Config Generator"\
       --inputbox "Enter the networkadress of your FritzBox network (192.168.0.0)" 8 52 2>$_temp
networkip=`cat $_temp`

dialog --backtitle "FritzVPN Config Generator"\
       --inputbox "Enter the subnetmask of your FritzBox network (255.255.255.0)" 8 52 2>$_temp
subnet=`cat $_temp`

dialog --backtitle "FritzVPN Config Generator"\
       --inputbox "Enter the ip you want to have while connected to vpn (192.168.0.121)" 8 52 2>$_temp
desiredip=`cat $_temp`

dialog --backtitle "FritzVPN Config Generator"\
       --inputbox "Enter a groupname" 8 52 2>$_temp
groupname=`cat $_temp`

dialog --backtitle "FritzVPN Config Generator"\
       --inputbox "Enter a grouppassword(a-zA-Z0-9)" 8 52 2>$_temp
grouppassword=`cat $_temp`

dialog --backtitle "FritzVPN Config Generator"\
       --inputbox "Enter your desired username" 8 52 2>$_temp
username=`cat $_temp`

dialog --backtitle "FritzVPN Config Generator"\
       --inputbox "Enter the password of your desired user(a-zA-Z0-9)" 8 52 2>$_temp
userpassword=`cat $_temp`


sed -i 's/PROFILENAME/'$profilename'/g' $DIR/template.cfg
sed -i 's/DESIREDIP/'$desiredip'/g' $DIR/template.cfg
sed -i 's/SUBNET/'$subnet'/g' $DIR/template.cfg
sed -i 's/NETWORKIP/'$networkip'/g' $DIR/template.cfg
sed -i 's/GROUPNAME/'$groupname'/g' $DIR/template.cfg
sed -i 's/GROUPKEY/'$grouppassword'/g' $DIR/template.cfg
sed -i 's/USERNAME/'$username/'g' $DIR/template.cfg
sed -i 's/USERPASSWORD/'$userpassword'/g' $DIR/template.cfg

sed -i 's/PROFILENAME/'$profilename'/g' $DIR/template.pcf
sed -i 's/DYNIP/'$host'/g' $DIR/template.pcf
sed -i 's/GROUPNAME/'$groupname'/g' $DIR/template.pcf
sed -i 's/GROUPKEY/'$grouppassword'/g' $DIR/template.pcf
sed -i 's/USERNAME/'$username/'g' $DIR/template.pcf
sed -i 's/USERPASSWORD/'$userpassword'/g' $DIR/template.pcf


mv $DIR/template.pcf $DIR/$profilename.pcf
mv $DIR/template.cfg $DIR/$profilename.cfg

rm -R $DIR/tmp

clear

