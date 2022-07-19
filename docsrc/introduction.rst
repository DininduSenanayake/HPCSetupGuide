Introduction
============

Node CPU architecture
---------------------

For an overview of the nodes see: https://www.medsci.ox.ac.uk/divisional-services/support-services-1/bmrc/cluster-usage#cluster-queues-and-nodes

Currently, the BMRC cluster is mainly comprised of nodes with "skylake" CPU architecture, but there are also nodes with the older "ivybridge" architecture". It is important to understand that code compiled on "skylake" will not execute on "ivybridge" CPUs due to additions to the instruction set. Code compiled on "ivybridge" will run on "skylake".

In the group, we perform our work on skylake login and execution nodes by default. The two main login nodes, "cluster1.bmrc.ox.ac.uk" and "cluster2.bmrc.ox.ac.uk" both have skylake CPUs. The excution nodes in groups A,E,F also have skylake CPUs. 

If, for some reason you need to work from ivybridge, rescomp3 is a hidden headnode which can be accessed from the two main login nodes.


Who is who?
-----------

To map the random user names assigned by the BMRC team to real people the following command can be used: ::

    ls /well/sansom/users/ | xargs getent passwd | cut -f1,5 -d: | sed 's/:/ -> /g'

