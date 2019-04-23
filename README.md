# Building a Raspberry Pi Cluster with Docker
From configuring the cluster to the 3D rack printing.

The Raspberry Pi is a great piece of hardware and thanks to its price (just 35$ for the Model 3 B+ and 10$ for the Model Zero W) enables everyone and everything to the world of computing.
However, the price is not the only advantage.
Indeed, size and technical specifications matter.
The Raspberry Pi is a perfect IoT and/or micro-server enabler.

In this article, we will be looking at micro-servers and the exercise will consist of building a Web Server cluster with 3 Raspberry Pi Zero W.
For the Web Server deployment we'll leverage the power of Docker.
For those who don't know about it, Docker is a platform that allows running software into "containers".
Containers are a method to package software and they do not contain just the code, but also libraries, services, and even a file system.
The beautiful thing is that you can run those containers on multiple machines as well, which is exactly what we are looking for.
This mode is called Docker Swarm. By definition, a Docker Swarm is a group of machines that are running Docker and are joined into a cluster.

Last, but not least, we need to put the 3 Raspberry Pi somewhere, hence, we'll be printing some 3D stackable racks for them.
