# The following shell script demonstrate how to build apache lucy https://lucy.apache.org/
# compile one of its sample and run it in a linux system. It will install everything locally
# in FOLDER and PREFIX - it doesnt need to be run as root. Notice it needs to set LD_PRELOAD 
# to indicate the libraries before it runs the sample exec

# IMPORTANT: change variables FOLDER and PREFIX according to your system

FOLDER=test_output

PREFIX=$FOLDER/prefix # where includes and libs will be installed in your system

rm -rf $FOLDER
mkdir -p $FOLDER
mkdir -p $PREFIX

cd $FOLDER

git clone https://git-wip-us.apache.org/repos/asf/lucy-clownfish.git
cd $FOLDER/lucy-clownfish/runtime/c
./configure --prefix=$PREFIX
make clean
echo "\n\n\n"
make
make install  

cd $FOLDER/lucy-clownfish/compiler/c
./configure --prefix=$PREFIX
make clean
make 
make install  

cd $FOLDER
git clone https://git-wip-us.apache.org/repos/asf/lucy.git
cd $FOLDER/lucy/c
./configure --prefix=$PREFIX
make clean
make
make install

cp -rf $FOLDER/lucy/c/autogen/include/* $PREFIX/include



# now compile a lucy example and run it:
cd $FOLDER/lucy/c/sample

gcc getting_started.c -L $PREFIX/lib -I $FOLDER/lucy/c/autogen/include -I $FOLDER/lucy/c -l clownfish -l lucy -o getting_started.out
LD_PRELOAD="$PREFIX/lib/libclownfish.so.0.6 $PREFIX/lib/liblucy.so.0.6" 
./getting_started.out

# rm -rf $FOLDER $PREFIX