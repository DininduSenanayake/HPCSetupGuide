Connecting to the Cluster
=========================

Connecting from within the Kennedy
----------------------------------

The BRMC login nodes ("cluster1.bmrc.ox.ac.uk" and "cluster2.bmrc.ox.ac.uk") are directly accessible from the Kennedy network.

Connecting from outside the Kennedy
-----------------------------------

Connections from outside the Kennedy should be made via the university VPN. If connecting using an apple mac computer, the CISCO anyconnect client is needed for a stable connection. It can be obtained from `the Univerity's IT service <https://help.it.ox.ac.uk/vpn>`_.

Client ssh configuration
------------------------

An example of a client-side .ssh/config is provided in client-side/ssh/config:

    .. literalinclude:: ../../client-side/ssh/config
        :language: Bash

.. note:: Replace "xxxxxx" with your BMRC user name.

.. note:: You will need to create the ".ssh/sockets" directory if it does not exist:

.. code-block:: Bash

		mkdir ~/.ssh/sockets
		   
In the example, the "ControlMaster", "ControlPath", and "ControlPersist" directives mean that you should only have to authenticate once a day, with all connections being automatially multiplexed through a single master connection.
