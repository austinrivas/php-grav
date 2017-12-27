# PHP-Grav

### At a glance

This aproach for a lightweight Content Management System stack includes four main parts:

+ **PHP-FPM** as the FastCGI engine.
+ **Pushion** as the minimal linux container for this stack.
 
### Components

**Pushion** base Docker container is a minimal Ubuntu base image modified and minified to be a lightweight Docker compatible container. 
The container is enhanced with key features like the ability to handle SSH access to the container and the ability to add additional daemons that run at the startup time of the container.
 
### Container philosophy

In theory, the use of Docker and containers encourage the one process per container approach but, from the point of view of software as a service, this new container is focused in the one service per container philosophy.

### Dockerfile

The definition for this new **PHP-Grav** container perfirm several tasks at build time:

+ Define the base image as **phusion/baseimage:0.9.19**, an excelent minified Ubuntu 16.04 LTS Docker container.
+ Install and update the core components for this new container.
+ Setup PHP-FPM service.
+ Expose Volumes and ports.

This Docker container is ready and preconfigured. Just download and use it.

### Useful shortcuts and functions

```bash
function docker_remove_all_images() {
	docker rmi $(docker images -q)
}
```

```bash
function docker_remove_all_containers() {
	docker rm $(docker ps -q)
}
```

```bash
function docker_push_image() {
	docker login && docker build -t $1 $2 && docker push $1
}
```

docker login && docker build -t <user>/<image-name>:<version> . && docker push <user>/<image-name>:<version>

### Known Issues