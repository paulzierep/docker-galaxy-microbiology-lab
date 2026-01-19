[![DOI](https://zenodo.org/badge/46994376.svg)](https://zenodo.org/badge/latestdoi/46994376)
[![Gitter](https://badges.gitter.im/bgruening/docker-galaxy-stable.svg)](https://gitter.im/bgruening/docker-galaxy-stable?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

Microbiology Lab Docker Image
=============================

Galaxy Docker repository for the Microbiology Lab

# Adaptations

* lab page rendering in 127.0.0.1
* custom welcome page
* tools from the lab [todo]

# Installed tools

# Requirements

 - [Docker](https://docs.docker.com/installation/) for Linux / Windows / OSX

# Usage

To build:

```
docker build -t galaxy:microbiology .
```

To launch:

```
docker run --rm -i -t --privileged -p 8080:80 quay.io/bgruening/galaxy-ngs-preprocessing
```

For persistent data storage:

```
docker run --rm -i -t --privileged -p 8080:80 -v /home/<username>/export.microbiology/:/export quay.io/bgruening/galaxy-ngs-preprocessing
```

With IT enabled:

```
docker run -d -p 8080:80 -p 8021:21 -p 8800:8800 --privileged -v /home/user/galaxy_storage/:/export/ 
```

The Galaxy Admin User has the username ``admin`` and the password ``password``.

# Support

For more details about this command line or specific usage, please consult the
[`README`](https://github.com/bgruening/docker-galaxy/blob/master/README.md) of the main Galaxy Docker image, on which the current image is based.

# Contributers

 - Bjoern Gruening
 - Bérénice Batut
 - Paul Zierep

# Bug Reports

You can file an [github issue](https://github.com/bgruening/docker-galaxy-ngs-preprocessing/issues) or ask us on the [Galaxy development list](http://lists.bx.psu.edu/listinfo/galaxy-dev).
