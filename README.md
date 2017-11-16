# docker-node-fun

<img src='https://i1.wp.com/blog.docker.com/wp-content/uploads/2013/06/Docker-logo-011.png?ssl=1' align='right' width='20%'>

[![Build Status](https://travis-ci.org/mslinn/docker-java-fun.svg?branch=master)](https://travis-ci.org/mslinn/docker-java-fun)
[![GitHub version](https://badge.fury.io/gh/mslinn%2Fdocker-java-fun.svg)](https://badge.fury.io/gh/mslinn%2Fdocker-java-fun)

Fooling around with Docker and Node.js.

## Building and Running
The [bin/run](https://github.com/mslinn/docker-node-fun/blob/master/bin/run) script builds and runs the program.

    $ bin/run

The following explains what the `bin/run` script does at a high level.
The actual script is more complex.

### Building
The `-t` flag tags the image so it is easier to find using the `docker images` command.
See [The misunderstood Docker tag: latest](https://medium.com/@mccode/the-misunderstood-docker-tag-latest-af3babfd6375).

    $ docker build -t $USER/docker_node_fun .
    $ # Manually provide a monotonically increasing tag number (from 1)
    $ docker tag $USER/docker_node_fun $USER/docker_node_fun:1

The new image should now be visible:

    $ docker images | grep docker_node_fun
    mslinn/docker_node_fun           1                     015ab51e9d36        About a minute ago   676MB
    mslinn/docker_node_fun           latest                015ab51e9d36        About a minute ago   676MB

### Running
Run the app:

    $ docker run -d $USER/docker_node_fun

Get the container ID:

    $ CONTAINER_ID=$(docker ps -l | tail -n 1 | cut -d ' '  -f1)
    
View app output:

    $ docker logs $CONTAINER_ID
    Hello, world
