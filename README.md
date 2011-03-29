Redcar Coffeescript Plug9in
============

A little plugin to let you hack on coffeescript

###What does it do?

 - Adds in the tmbundle, scans for coffeescript classes and declarations ands them to tags so Go To Tag works

###How do I install it?

<code>
    cd ~/.redcar/plugins
    git clone git@github.com:superchris/redcar-coffeesscript.git coffeescript
    git submodule init
    git submodule update
    rm ~/.redcar/cache/textmate_bundles.cache
    Restart redcar (to force reload of tm bundle)
</code>
