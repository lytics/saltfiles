#! /bin/sh

cd /tmp

wget https://dist.apache.org/repos/dist/release/thrift/0.9.0/thrift-0.9.0.tar.gz -O thrift.tar.gz
tar xzf thrift.tar.gz
cd thrift-0.9.0

export THRIFT=$(pwd)

cd ~/Dropbox/go/root/src/github.com/pomack 
export THRIFT4GO=$(pwd)/thrift4go

bash ./thrift4go/scripts/merge_and_build.sh -b


cd $THRIFT
#cp /home/ubuntu/src/t_go_generator.cc /tmp/thrift-0.8.0/compiler/cpp/src/generate/
#sh ./bootstrap.sh
./configure --with-go CXXFLAGS='-g -O2'  


make

make install

cd /tmp
rm -rf thrift-0.9.0
rm -f thrift.tar.gz

#/tmp/thrift-0.8.0/compiler/cpp/src/generate# cp /tmp/thrift/compiler/cpp/src/generate/t_go_generator.cc .
