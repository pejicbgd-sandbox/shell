#!/bin/bash

#APP_NAME="${PWD##*/}"


echo '######################################################'
echo '# This script will guide you through creating simple #'
echo '# boilerplate for react + redux + babel app          #'
echo '######################################################'

#echo "Enter the name of the app ( $APP_NAME ):"

#read app_name

#APP_NAME=$app_name


#echo $APP_NAME

npm init

#################
# Webpack stuff #
#################

npm i --save-dev webpack webpack-dev-server

###############
# Babel stuff #
###############

npm i --save-dev babel babel-core babel-preset-react babel-cli babel-loader babel-preset-2015

###############
# React stuff #
###############

npm i --save react react-dom react-router react-router-dom

###############
# Redux stuff #
###############

npm i --save redux react-redux
npm i --save-dev redux-devtools

###################
# Webpack loaders #
###################

npm i --save-dev file-loader style-loader css-loader

###################
# webpack plugins #
###################
npm i --save-dev html-webpack-plugin
npm i --save react-hot-loader@next

mkdir dist && chmod a+w dist
mkdir src && chmod a+w src


cat <<EOF >dist/index.html
!DOCTYPE html>
<html>
	<head>
		<title>React boilerplate</title>
	</head>
	<body>
		<div id="app" />
	</body>
	</html>
EOF

cat <<EOF >webpack.config.js
var path = require('path');

module.exports = {
	entry: '',
	output: {
		path: '',
		publicPath: '',
		name: ''
	},
	loaders: [

	],
	plugins: [

	]
};
EOF

#touch src/index.jsx

