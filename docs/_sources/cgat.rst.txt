Running CGAT pipelines
======================

Configuration
-------------

The configuration of `cgat-core <https://github.com/cgat-developers/cgat-core>`_ pipelines can be customised via a ".cgat.yml" file in your home directory.

The recommended settings for the BMRC are provided in dotfile/cgat.yml:

    .. literalinclude:: ../dotfiles/cgat.yml
        :language: yaml
    
With the queue specified here, jobs will be submitted to all the "skylake" nodes by default (i.e. without needing to set the --cluster-queue argument).


Installing pipelines
--------------------

Before installing the CGAT code, you first need to set up and activate a Python 3 virtual environment, see: :doc:`python`.

It is then recommended to then install CGAT Core, Apps and Flow into the same (activated) virtual environment using the steps below. 


Installing CGAT Core
^^^^^^^^^^^^^^^^^^^^

CGAT core provides a powerful and flexible framework for writing best practise bioinformatics pipelines using Python3 and Ruffus (https://github.com/cgat-developers/ruffus). For more details please read the publication: https://doi.org/10.12688/f1000research.18674.2.

The code is maintained on GitHub here: https://github.com/cgat-developers/cgat-core

Before cloning and setting up the code it is recommended to install the dependencies. These are listed in the repo here: https://github.com/cgat-developers/cgat-core/blob/master/conda/environments/cgat-core.yml . If you skip this step you will need to install any missing packages as you go along.

To clone and setup the repository: ::

    # cd to an appropriate location, such as your development folder
    cd ~/devel/

    # clone the cgat-core repo
    git clone git@github.com:cgat-developers/cgat-core.git

    # run setup
    cd cgat-core/
    python setup.py develop


Installing CGAT Apps
^^^^^^^^^^^^^^^^^^^^

The CGAT Apps repository provides a collection of scripts for the analysis of high-throughput sequencing data.

As before it is recommended to first install any missing dependencies. These are listed in the repo here: https://github.com/cgat-developers/cgat-apps/blob/master/conda/environments/cgat-apps.yml

To clone and set up the repo: ::

    # cd to an appropriate location, such as your development folder
    cd ~/devel/

    # clone the repo
    git clone git@github.com:cgat-developers/cgat-apps.git

    # run setup
    cd cgat-apps/
    python setup.py develop


Installing CGAT Flow
^^^^^^^^^^^^^^^^^^^^

CGAT Flow provides a collection of pipelines (written using cgat-core and cgat-apps) for the analysis of next-generation sequencing data such as ChIP-seq, ATAC-seq and RNA-seq data.

Again, it is recommended to first check for and install any missing dependencies. These are listed in the repo here: https://github.com/cgat-developers/cgat-flow/blob/master/conda/environments/cgat-flow-pipelines.yml

To clone and set up the repo: ::

    # cd to an appropriate location, such as your development folder
    cd ~/devel/

    # clone the repo
    git clone git@github.com:cgat-developers/cgat-flow.git

    # run setup
    cd cgat-flow/
    python setup.py develop


Known Issues
------------

Internet access
^^^^^^^^^^^^^^^

There is currently no internet access on cluster execution nodes. If a job needs internet access, it can be run on a login node by passing the "--no-cluster" argument to the pipeline, e.g. ::

    cellhub annotation make full -v5 --no-cluster


Excessive waiting for completed jobs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The pipelines wait a specified amount of time before checking whether jobs have completed. Unfortunately, this is controlled by a hardcoded `GEVENT setting <https://github.com/cgat-developers/cgat-core/blob/86f2639488f4769b4124583697d20db763d80170/cgatcore/pipeline/execution.py#L50>`_. This setting was changed from 1 to 30 during the COMBAT project when there were undiagnosed issues with a BMRC-specific DRMAA bug that has subsequently been fixed. To improve pipeline performance it is recommended to edit this setting in your local copy of cgatcore/pipeline/execution.py to e.g.:

.. code-block:: python

     GEVENT_TIMEOUT_WAIT = 5