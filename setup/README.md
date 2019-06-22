# Vim Setting

Configuration files for vim setings. Each file has the extension .vcfg

This directory contains for directories:

* files

    This directory holds files that will be loaded and the content is
    executed at vim start.

    If it is required to avaiod loading a file at vim start it has to
    be moved to **files.disabled**

* files.disabled

    This directory holds files that will NOT be loaded at vim start.
    If it is required to load a file form this directory it has to be
    moved to **files**

* plugins

    Files is this directory responsible to load one or more vim 
    plugins.
    This directory holds files that will be loaded and the content is
    executed at vim start.
    If it is required to avaiod loading a file at vim start it has to
    be moved to **plugins.disabled** . If a file was added to this 
    directory execute the vim command :PlugInstall . If a file was 
    removed from this directory execute the vim command :PlugClean

* plugins.disabled

    This directory holds files that will NOT be loaded at vim start.
    If it is required to load a file form this directory it has to be
    moved to **plugins**

