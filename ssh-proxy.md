# NAME

ssh-proxy - create a SOCKSv5 proxy using SSH

# DESCRIPTION

To proxy traffic to server `proxy.myserver.com` over local port `8080`, use the
following command:

    ssh -N -D 8080 proxy.myserver.com

The `-D` flag creates a "dynamic port forward" on port 8080 of the host machine
that forwards all traffic to `proxy.myserver.com`. The `-N` flag tells ssh that
we don't need `stdin` (we are not running any commands, we just want to keep the
connection open).

You can also add the `-C` flag to compress data, the `-q` flag to "quiet" the
output, and `-f` to send the command into the background:

    ssh -f -N -C -q -D 8080 proxy.myserver.com

On the host side, configure your web browser's proxy to connect to `localhost`
on port `8080` as a SOCKSv5 proxy.
