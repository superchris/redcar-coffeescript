Redcar Coffeescript Plug9in
============

A little plugin to let you hack on coffeescript

###What does it do?

 - Adds in the tmbundle, scans for coffeescript classes and declarations ands them to tags so Go To Tag works

###How do I install it?


    mkdir -p ~/.redcar/plugins
    cd ~/.redcar/plugins
    git clone git://github.com/superchris/redcar-coffeescript.git coffeescript
    cd coffeescript
    git submodule init
    git submodule update
    rm ~/.redcar/cache/textmate_bundles.cache


Then restart redcar (to force reload of tm bundle)
