Setting up your BASH environment
================================

Configuration
-------------

A minimal ".bashrc" file profile is provided in dotfiles/bashrc:

.. literalinclude:: ../dotfiles/bashrc
    :language: Bash
    
.. note::

    It is essential to understand that cluster jobs submitted by CGAT pipelines inherit the bash environment of the main pipeline process. In this scenario, we want bash to initialise without manipulating the environment. To avoid execution of user configuration in this situation, we therefore test whether the "PS1" variable is set in our .bashrc file to determine if the shell is interactive or not. The "PS1" variable is set in interactive shells, but not in non-interactive shells. When you login via ssh, you obtain an interactive shell, the "PS1" variable will be set and configuration code within the if statement will be executed. Pipeline jobs run on execution nodes in non-interactive shells, where "PS1" is not set so the configuration code within the if statement is not executed.
    

Software modules
----------------

In order for different programs to be able to function together in the same bash environment, generally speaking, they need be compiled with a common toolchain and linked against common libraries.

The Kennedy is currently using the **"gompi/foss-2020a"** and **"GCC/GCCcore-9.3.0"** toolchains which are compatible with each other (the GCC tool chain is effectively a subset of the full toolchain). All the software that you use (both in the shell and elsewere, e.g. Rstudio) should be built with these toolchains or it is very likely that you will encounter errors. 

In the group, we load the modules we need via our ".bashrc" in interactive shells as shown above. This is done by sourcing scripts that load sets of related modules. The scripts defining our curated sets of modules are located on the cluster in our "~/shared/modules" folder and are version controlled in this repository. Please submit pull requests to this repo for any changes/updates needed.  

.. note::
    It is important that the ~/shared/module/core.sh file is sourced first when loading module sets. It begins by purging the module space to make sure there will be no conflicts and enables use of Kennedy modules built with the current toolchain.

Using tmux
----------

`tmux <https://github.com/tmux/tmux/wiki>`_ is an advanced terminal multiplexer. You can use it to keep bash shells open even when you are not logged in. This is very useful for protecting against interruptions to your connection to the cluster. It is recommended to always execute longer running tasks, such as pipelines, from within a tmux session.

An configuration file for tmux that enables mouse support is in dotfiles/tmux:

.. literalinclude:: ../dotfiles/tmux
    :language: Bash

