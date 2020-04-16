# NAME

docker

# DESCRIPTION

## Remove all stopped Docker containers

View all Docker containers, both stopped and running, with

    $ docker ps -a

To remove all stopped containers, use

    $ docker ps -a | awk '/Exited/ {print $(NR)}' | xargs docker rm

