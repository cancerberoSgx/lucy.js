# The following shell script demonstrate how to build apache lucy https://lucy.apache.org/
# compile one of its sample and run it in a linux system. 

# IMPORTANT: change variables FOLDER and PREFIX according to your system

FOLDER=/home/sg/test2

PREFIX=$FOLDER/prefix # where includes and libs will be installed in your system

# rm -rf $FOLDER
# mkdir -p $FOLDER
# mkdir -p $PREFIX

# cd $FOLDER

# git clone https://git-wip-us.apache.org/repos/asf/lucy-clownfish.git
# cd $FOLDER/lucy-clownfish/runtime/c
# ./configure --prefix=$PREFIX
# make clean
# echo "\n\n\n"
# make
# make install  

# cd $FOLDER/lucy-clownfish/compiler/c
# ./configure --prefix=$PREFIX
# make clean
# make 
# make install  

# cd $FOLDER
# git clone https://git-wip-us.apache.org/repos/asf/lucy.git
# cd $FOLDER/lucy/c
# ./configure --prefix=$PREFIX
# make clean
# make
# make install

# cp -rf $FOLDER/lucy/c/autogen/include/* $PREFIX/include



# now compile a lucy example and run it:
cd $FOLDER/lucy/c/sample

gcc getting_started.c -L $PREFIX/lib -I $FOLDER/lucy/c/autogen/include -I $FOLDER/lucy/c -l clownfish -l lucy -o getting_started.out
# LD_PRELOAD=$PREFIX/lib/libclownfish.so.0.6 ./getting_started.out

# gcc getting_started.c /usr/lib/liblucy.so.0.6.0 /usr/lib/libclownfish.so.0.6.0 -static -I $FOLDER/lucy/c/autogen/include -I $FOLDER/lucy/c  -o getting_startedS.out
# ./getting_startedS.out