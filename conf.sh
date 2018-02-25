#!/bin/bash

APP_NAME="${PWD##*/}"
GREEN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m'

printf "# This script will guide you through creating simple boilerplate for react-redux-babel app"
printf "\n\n# Press ^c at any time to quit..."

printf "\n\nEnter the name of the app ( $APP_NAME ):"

read app_name

APP_NAME=$app_name


echo $APP_NAME

printf "\n\n${RED}# Writing to package.json..."
cat <<EOF >package.json
{
  "name": "$APP_NAME",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
  	"start": "webpack watch -d",
    "test": "printf \"Error: no test specified\" && exit 1"
  },
  "repository": {
    "type": "git",
    "url": ""
  },
  "author": "",
  "license": "ISC",
  "bugs": {
    "url": ""
  },
  "homepage": ""
}
EOF
printf "done${NC}"
#################
# Webpack stuff #
#################
printf ${GREEN}
printf "\n\n######################################"
printf "\n# Installing webpack with dev-server #"
printf "\n######################################\n"
printf ${NC}
npm i --save-dev webpack webpack-cli webpack-dev-server

###############
# Babel stuff #
###############
printf "${GREEN}"
printf "\n\n#########################################"
printf "\n# Installing babel, presets and loaders #"
printf "\n############################################\n"
printf "${NC}"
npm i --save-dev babel babel-core babel-preset-react babel-cli babel-loader babel-preset-env

###############
# React stuff #
###############
printf "${GREEN}"
printf "\n\n################################"
printf "\n# Installing react with router #"
printf "\n################################\n"
printf "${NC}"
npm i --save react react-dom react-router react-router-dom

###############
# Redux stuff #
###############
printf "${GREEN}"
printf "\n\n########################################"
printf "\n# Installing redux with redux-devtools #"
printf "\n########################################\n"
printf "${NC}"
npm i --save redux react-redux
npm i --save-dev redux-devtools

###################
# Webpack loaders #
###################
printf "${GREEN}"
printf "\n\n##########################################################"
printf "\n# Installing file-loader, style-loader and css-loader... #"
printf "\n##########################################################\n"
printf "${NC}"
npm i --save-dev eslint-loader file-loader style-loader css-loader

###################
# webpack plugins #
###################
printf "${GREEN}"
printf "\n\n#######################################"
printf "\n# Installing basic webpack plugins... #"
printf "\n#######################################\n"
printf "${NC}"
npm i --save-dev html-webpack-plugin@latest

printf "${GREEN}"
printf "\n\n#####################################################"
printf "\n# Creating folder structure and assigning perms... #"
printf "\n#####################################################\n"
printf "${NC}"

mkdir dist && chmod a+w dist
mkdir src && chmod a+w src

printf "${RED}"
printf "\n\n# Writing to index.html..."
cat <<EOF >dist/index.html
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
		<title><%= htmlWebpackPlugin.options.title %></title>
	</head>
	<body>
		<div id="app" />
	</body>
	</html>
EOF
printf "done"
printf "${NC}"

printf "${RED}"
printf "\n\n# Writing to webpack.config.js..."
cat <<EOF >webpack.config.js
const path = require("path");
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
	entry: __dirname + 'src/index.js',
  output: {
    path: __dirname + '/dist',
    filename: 'bundle.js'
  },
  devServer: { hot: true },
  module: {
    rules: [
      {
        enforce: 'pre',
        test: /\.jsx?$/,
        exclude: /node_modules/,
        loader: 'eslint-loader',
      },

      { test: /\.jsx?$/, exclude: /node_modules/, loader: ['babel-loader'] },

      { test: /\.css/, use: ['style-loader', 'css-loader'] },

      {
        test: /\.(gif|png|jpg|svg|eot|woff|woff2|ttf|mp4|cur)$/,
        loader: 'file-loader',
        options: {
          name: '[name]-[sha512:hash:base64:7].[ext]'
        }
      },
      {
        test: /\.svg(\?v=\d+\.\d+\.\d+)?$/,
        exclude: /(node_modules)/,
        loader: 'url-loader?limit=10000&mimetype=image/svg+xml',
      },

      {
        test: /\.gif/,
        exclude: /(node_modules)/,
        loader: 'url-loader?limit=10000&mimetype=image/gif',
      },

      {
        test: /\.jpg/,
        exclude: /(node_modules)/,
        loader: 'url-loader?limit=10000&mimetype=image/jpg',
      },

      {
        test: /\.png/,
        exclude: /(node_modules)/,
        loader: 'url-loader?limit=10000&mimetype=image/png',
      },
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({
      title: "${APP_NAME}",
      template: __dirname + 'dist/index.html'
    })
  ]
};
EOF
printf "done"
printf "${NC}"

printf "${RED}"
printf "\n\n# Writing to index.jsx..."
touch src/index.jsx
printf "done"
printf "${NC}"
