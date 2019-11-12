ssh-proxy(1) "" "ual"

# NAME

ssh-proxy - create a SOCKSv5 proxy using SSH

# DESCRIPTION

To proxy traffic to server _proxy.myserver.com_ over local port _8080_, use the
following command:

```
ssh -N -D 8080 proxy.myserver.com
```

The _-D_ flag creates a "dynamic port forward" on port 8080 of the host machine
that forwards all traffic to _proxy.myserver.com_. The _-N_ flag tells ssh that
we don't need _stdin_ (we are not running any commands, we just want to keep the
connection open).

You can also add the _-C_ flag to compress data, the _-q_ flag to "quiet" the
output, and _-f_ to send the command into the background:

```
ssh -f -N -C -q -D 8080 proxy.myserver.com
```

On the host side, configure your web browser's proxy to connect to _localhost_
on port _8080_ as a SOCKSv5 proxy.
