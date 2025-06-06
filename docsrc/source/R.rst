Working with R
==============

R module and version
--------------------

We are currently using the **R/4.3.1-foss-2022b-bare-noSciPy** module as our default.

This module provides R 4.3.1 built with the foss-2022b toolchain with only the base package set. This avoids conflict/confusion between centrally installed libraries and user-installed libraries.

R configuration
---------------

A minimal .Rprofile file is provided in dotfiles/Rprofile:

    .. literalinclude:: ../../dotfiles/Rprofile
        :language: rconsole

.. note::

    If necessary, create the directory specified in the Rprofile .libPaths() function before atttempting to install packages.

.. note:: 
    This setup assumes that you will use R only on the skylake nodes. It is different from the set up recommended by the BMRC which performs automatic CPU architecture detection and uses multiple package libraries for different architectures. In the group we prefer to be explicit about the location of the R libraries so that (i) we know which code we are using to perform analysis (important for reproducibility) and (ii) we only install packages once.
    
.. warning::
    R libraries compiled on skylake will not run on ivybridge nodes. If you need to use ivybridge nodes, you can maintain a seperate pacakage library and switch .libPaths() statements as needed. TODO: investigate use of renv.
