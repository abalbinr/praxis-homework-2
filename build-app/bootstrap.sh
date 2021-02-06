#!/usr/bin/env bash

#Git
sudo yum install -y git
git version

#Go
sudo yum install -y golang
go version

#Node and npm
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum install -y nodejs
node --version
npm --version

#Vue cli
sudo npm install -g -y @vue/cli
vue --version

#Clonar repositorio de github de la app
git clone https://github.com/jdmendozaa/vuego-demoapp.git

#Build the backend
cd vuego-demoapp/server
go build -o /shared/greeter

#Build the frontend
#Ip del backend 10.0.0.8
cd ../spa
echo "VUE_APP_API_ENDPOINT=\"http://10.0.0.8:4001/api\"" > .env.production
sudo npm install
sudo npm run build
tar czf dist.tgz dist/*
mv dist.tgz /shared

