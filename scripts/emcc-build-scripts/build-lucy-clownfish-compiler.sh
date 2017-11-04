
if [ ! -d 'lucy_dist' ] 
then 
    sh scripts/build-lucy-c.sh
fi

rm -rf lucy_dist_js
cp -r lucy_dist lucy_dist_js

CURRENT_DIR=`pwd`


cp -rf $CURRENT_DIR/scripts/makefiles/lucy-clownfish-compiler-makefile $CURRENT_DIR/lucy_dist_js/lucy-clownfish/compiler/c/Makefile

cd $CURRENT_DIR/lucy_dist_js/lucy-clownfish/compiler/c/
make clean
make
