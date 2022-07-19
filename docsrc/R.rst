Working with R
==============

It is recommended to configure you .Rprofile as follows:

    .. include:: ../dotfiles/Rprofile
    
Making sure to substitute your own user name.

.. note:: 
    This setup assumes that you will use R only on the skylake nodes. It is different from the set up recommended by the BMRC which performs automatic CPU architecture detection and multiple package libraries for different architectures. In the group we prefer to be explicit about the location of the R libraries so that (i) we know which code we are using to perform analysis (important for reproducibility) and (ii) we only install packages once.
    
.. warning::
    R libraries compiled on skylake will not run on ivybridge nodes. If you need to use ivybridge nodes, you can maintain a seperate pacakage library and switch .libPaths() statements as needed. TODO: investigate use of renv.