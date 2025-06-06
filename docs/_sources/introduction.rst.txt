Introduction
============

This guide documents the group's use of the University of Oxford's BMRC cluster.

Researchers in other groups using the Kennedy's Data Science Platform can also follow this guide if they wish to run e.g. the `cellhub <https://cellhub.readthedocs.io/>`_ or txseq pipelines.

Please note that this guide is not a replacement for the `official BMRC documentation <https://www.medsci.ox.ac.uk/for-staff/res\ources/bmrc/r-and-rstudio-on-the-bmrc-cluster>`_.



A preliminary note on CPU architecture
--------------------------------------

Currently, the BMRC cluster is mainly comprised of nodes with "skylake" CPU architecture, but there are also nodes with the older "ivybridge" architecture". It is important to understand that code compiled on "skylake" will not execute on "ivybridge" CPUs due to additions to the instruction set. Code compiled on "ivybridge" will run on "skylake".

In the group, we perform our work on skylake login and execution nodes. The  main login nodes, "cluster1-4.bmrc.ox.ac.uk" have skylake CPUs. The excution nodes in groups A,E,F also have skylake CPUs. 

If, for some reason you need to work from ivybridge, rescomp3 is a hidden ivybridge headnode which can be accessed from the two main login nodes.

For an overview of the nodes see: https://www.medsci.ox.ac.uk/divisional-services/support-services-1/bmrc/cluster-usage#cluster-queues-and-nodes


Who is who?
-----------

To map user names to real people, the following command can be used: ::

    ls /well/sansom/users/ | xargs getent passwd | cut -f1,5 -d: | sed 's/:/ -> /g'
