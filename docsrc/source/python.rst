Working with Python
===================

Python version and module
-------------------------

We are currently using **Python/3.10.8-GCCcore-12.2.0** as our default module.


Setting up a virtual environment
---------------------------------

A Python 3 virtual environment can be set up and activated as follows:

.. code-block:: python

    #check the version of python3 and the toolchain that you are using
    python3 --version
    
    # in this example we are using Python 3.10.8 built with GCCcore-12.2.0

    #check the CPU architecture
    cat /sys/devices/cpu/caps/pmu_name
    
    # in this example we are using skylake

    # make the virtual environment
    # it is a good idea to keep track of the python version, tool chain and CPU
    # architecture in the name of the folder used for the environment.
    # the "--prompt" argument specifies the name that will be displayed
    # when the environmet is active.
    python3 -m venv --prompt=py3108_sky_venv ~/devel/venvs/python-3.10.8-GCCcore-12.2.0-skylake
 
    # activate the virtual environment
    source ~/devel/venvs/python-3.10.8-GCCcore-12.2.0-skylake/bin/activate

    # update pip 
    pip install --upgrade pip
    
    # deactivate the environment
    deactivate
    

