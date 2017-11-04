API for [emscripted](https://github.com/kripken/emscripten) [apache lucy](https://lucy.apache.org/) to run it in the browser. 

Experiment !!!

# End goal

 * have an https://lucy.apache.org/ compiled to javascript - just like sass.js is compiled from libsass
 * use emscripten (emcc)
 * have a process to generate the javascript automatically from lucy sources

(see my email : https://lists.apache.org/list.html?dev@lucy.apache.org)

# short term goals
 
 * (DONE) learn how to compile lucy, required libraries from c sources and be able to compile and run one of the c/samples 
 * Follow reommendations in email: 

    "
    Start by having an Indexer commit a Snapshot. Then add a DocWriter
    which does variable length records of key-value pairs. Next, create an
    IndexReader module which delegates to a DocReader module to fetch
    documents from the store.

    You can leave the inverted indexing modules and locking code for
    later, because the fundamental data structures and decomposition
    strategies of Lucy are sound.
    "

# compile lucy latest and run one of the c/samples: 

    $ sh test-scripts/build-lucy-c.sh


how to build: 

    sh test-scripts/lucy_locally.sh
    cp -rf lucy_dist lucy_dist_js
    
how to build lucy-clownfish/compiler (just after executing luci_locally.sh)

    cp -rf lucy_dist lucy_dist_js
    cd lucy_dist_js/lucy-clownfish/compiler/c/
    make clean
    cp test-scripts/lucy-clownfish-compiler-makefile lucy_dist_js/lucy-clownfish/compiler/c/Makefile
    make clean
    make
    #  it will throw an error at the end building the exec just ignore : WARNING:root:cfc.o is not valid LLVM bitcode

how to build lucy-clownfish/runtime

    #build lucy-clownfish/compiler first
    cd lucy_dist_js/lucy-clownfish/runtime/c
    make clean
    cp test-scripts/lucy-clownfish-runtime-makefile lucy_dist_js/lucy-clownfish/compiler/c/Makefile
    make clean
    make