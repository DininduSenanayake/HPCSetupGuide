Client ssh configuration
------------------------

An example of a client-side .ssh/config is provided in the client-side/ssh/ directory:

    .. literalinclude:: ../client-side/ssh/config
        :language: Bash

In the example, the "ControlMaster", "ControlPath", and "ControlPersist" directives mean that you should only have to authenticate once a day, with all connections being automatially multiplexed through a single master connection.