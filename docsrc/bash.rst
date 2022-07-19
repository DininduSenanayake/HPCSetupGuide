Setting up your BASH environment
================================

Configuration
-------------

A minimal ".bashrc" file profile is provided in dotfiles/bashrc:

    .. include:: ../dotfiles/bashrc
    
.. note::

    It is essential to understand that cluster jobs submitted by CGAT pipelines inherit the bash environment of the main pipeline process. In this scenario, we want bash to initialise without manipulating the environment. To avoid execution of user configuration in this sitatuation, we therefore examine the "PS1" variable in our .bashrc file to determine if the shell is interactive or not. When you login via ssh, you obtain an interactive shell, the "PS1" variable will be set and configuration code within the if statement will be executed. Pipeline jobs run in non-interactive shells, where "PS1" is not set so the configuration code within the if statement is not executed.
    

Software modules
----------------

In order for different programs to be able to function together in the same bash environment, generally speaking, they need be compiled with a common toolchain and linked against common libraries.

The Kennedy is currently using the "gompi/foss-2020a" and "GCC/GCCcore-9.3.0" toolchains which are compatible with each other (the GCC tool chain is effectively a subset of the full toolchain). All the software that you use (both in the shell and elsewere, e.g. Rstudio) should be built with these toolchains or it is very likely that you will encounter errors. 

The group is maintaining a core sets of modules for automatic loading in ".bashrc" files (see above) in our "shared/modules" folder. They are version controlled in this repository in the "shared/modules" folder. Please submit pull requests to this repo for any changes/updates needed.  



