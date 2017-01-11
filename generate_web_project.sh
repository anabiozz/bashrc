#!/bin/bash

wget https://github.com/anabiozz/web_template/archive/master.zip

if [ -f $PWD/master.zip ]; then
    unzip $PWD/master.zip
else
    printf "archive not found. starting redownload"
    wget https://github.com/anabiozz/web_template/archive/master.zip
    unzip $PWD/master.zip
fi

rm -rf $PWD/master.zip

printf "\nname your project, followed by [ENTER]:"

read project_name

if [ ${#project_name} -lt 1 ]; then
        printf "project name should be more"
    else
        mv $PWD/web_template-master $PWD/$project_name
fi

cd $project_name

#detour proxy for bower
sed -i '/"directory": "bower_components"/a ,"proxy": "http://10.13.11.50:8080", "https-proxy": "http://10.13.11.50:8080"' .bowerrc

bower cache clean
npm cache clear
bower install & npm install

printf "\nstart project[Y/n]:"

read decision

if [ "$decision" == "" ]; then
    gulp serve
elif [ "$decision" == "Y" ]; then
    gulp serve
elif [ "$decision" == "y" ]; then
    gulp serve
fi

printf "\nproject created"