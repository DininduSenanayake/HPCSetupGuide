Client ssh configuration
------------------------

An example of a client-side .ssh/config is provided in the client-side/ssh/ directory:

    .. include:: ../client-side/ssh/config

In the example, the "ControlMaster", "ControlPath", and "ControlPersist" directives means that you should only have to authenticate once a day, with all connections being automatially multiplexed through a single master connection.