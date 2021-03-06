#!/bin/sh
##############################################################
#  Install node.js from source (binaries)
#
##############################################################
{% set user = salt['env.user']() %}

# force an update

VER="0.10.31"
# Download & Unpack Node.js 
echo 'Download Node.js - v. $VER'
rm -rf /tmp/node-install 
mkdir /tmp/node-install
cd /tmp/node-install
NODEFILE=node-v$VER-linux-x64
# http://nodejs.org/dist/v0.10.2/node-v0.10.2-linux-x64.tar.gz
wget http://nodejs.org/dist/v$VER/$NODEFILE.tar.gz
tar -zxf $NODEFILE.tar.gz
echo 'Node.js download & unpack completed'
cd $NODEFILE
# cp -f bin/* /usr/local/bin/
# lets get rid of existing node modules as we are upgrading
rm -rf /usr/local/lib/node_modules
cp -rf * /usr/local/
echo 'Node.js install completed'

