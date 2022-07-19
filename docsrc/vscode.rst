Working with Visual Studio Code
===============================

`Visual Studio Code <https://code.visualstudio.com>`_ is a free and powerful IDE that can facilite first-class code editing, shell access, document viewing and more on the cluster. It has very broad adoption in the community and many excellent `extenstions <https://marketplace.visualstudio.com/VSCode>`_ It is the recommended way to work on the cluster day-to-day.

Installation
=============

To get going download and install Visual Studio Code on your client machine at the link above. You will then need to install the following extensions:

* `Remote SSH <https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh>`_

* `Python <https://marketplace.visualstudio.com/items?itemName=ms-python.python>`_ for python code sytax highlight and more.

* `R <https://marketplace.visualstudio.com/items?itemName=REditorSupport.r>`_ for R code syntax highlighting and more.

* `vscode-pdf <https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf>`_ for viewing PDFs

* `image preview <https://marketplace.visualstudio.com/items?itemName=kisstkondoros.vscode-gutter-preview>`_ for viewing images

* `Jupyter <https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter>`_ for jupyter notebooks

* `Awesome Emacs Keymap <https://marketplace.visualstudio.com/items?itemName=tuttieee.emacs-mcx>`_ if you are used to emacs keybindings.


Running R scripts
=================

To evaluate code in rscripts interactively, you will need to have the following in your settings.json file ::

    // Use active terminal for all commands, rather than creating a new R terminal
    "r.alwaysUseActiveTerminal": true,

    // Use bracketed paste mode
    "r.bracketedPaste": true,

    // Enable R session watcher
    "r.sessionWatcher": true,
    
    // This requires the R httpgd package to be installed
    "r.plot.useHttpgd": true,

    // Optionally disablye R conding linting:
    "r.lintr.enabled": false,

And the following lines in your .Rprofile: ::

    # Enable vscode hooks
    if (interactive() && Sys.getenv("RSTUDIO") == "") {
    source(file.path(Sys.getenv(if (.Platform$OS.type == "windows") "USERPROFILE" else "HOME"), ".vscode-R", "init.R"))
    }


Syncing settings between machines
=================================

Syncing of vscode settings and extensions between machines can be performed easily by linking vscode to your github account as described  `here <https://code.visualstudio.com/docs/editor/settings-sync>`_.



