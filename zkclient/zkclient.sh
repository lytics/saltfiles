#! /bin/sh

cd /tmp

apt-get install libcppunit-dev 

VER="3.4.6"
# remove the folder 
rm -rf zookeeper-$VER 
if [ ! -f zookeeper-$VER.tar.gz ]; then
	echo "file not found"
	wget http://apache.cs.utah.edu/zookeeper/zookeeper-$VER/zookeeper-$VER.tar.gz
else
    echo "File found!"
fi

tar xf zookeeper-$VER.tar.gz

# copy header files 
mkdir -p /usr/local/include 
cp zookeeper-$VER/src/c/include/*.h /usr/local/include 
cp zookeeper-$VER/src/c/generated/*.h /usr/local/include 


# install

cd zookeeper-$VER/src/c 

#autoreconf -if
ACLOCAL="aclocal -I /usr/local/share/aclocal" autoreconf -if


./configure 

make install 
