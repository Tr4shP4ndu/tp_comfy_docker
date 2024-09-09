# Docker

## Docker Version and Information
```bash
docker --version                # Show Docker version
docker info                     # Display system-wide information about Docker
```

## Working with Containers
```bash
docker ps                       # List running containers
docker ps -a                    # List all containers (running and stopped)
docker run <image>              # Run a container from an image
docker run -d <image>           # Run a container in detached mode (in the background)
docker run --name <name> <image> # Run a container with a custom name
docker stop <container>         # Stop a running container
docker start <container>        # Start a stopped container
docker restart <container>      # Restart a container
docker rm <container>           # Remove a stopped container
docker exec -it <container> /bin/bash  # Access a running container's shell
```

## Managing Images
```bash
docker images                   # List all Docker images
docker pull <image>             # Pull an image from Docker Hub
docker build -t <name>:<tag> <path>   # Build an image from a Dockerfile
docker rmi <image>              # Remove a Docker image
docker tag <image> <new_name>:<tag>   # Tag an image with a new name and/or tag
docker push <name>:<tag>        # Push an image to a Docker registry
```

## Docker Networks
```bash
docker network ls               # List all Docker networks
docker network create <name>    # Create a new Docker network
docker network inspect <network>    # Display details about a Docker network
docker network connect <network> <container>  # Connect a container to a network
docker network disconnect <network> <container> # Disconnect a container from a network
docker network rm <network>     # Remove a Docker network
```

## Docker Volumes
```bash
docker volume ls                # List all Docker volumes
docker volume create <name>     # Create a new Docker volume
docker volume inspect <volume>  # Display details about a Docker volume
docker run -v <volume>:/path <image>  # Attach a volume to a container
docker volume rm <volume>       # Remove a Docker volume
```

## Viewing Container Logs
```bash
docker logs <container>         # View logs of a container
docker logs -f <container>      # Follow logs of a container (real-time output)
```

## Inspecting Containers and Images
```bash
docker inspect <container/image>  # Display detailed information about a container or image
docker stats                     # Display resource usage statistics for containers
```

## Container Export and Import
```bash
docker export <container> > <file.tar>  # Export a container's filesystem as a tar archive
docker import <file.tar> <image_name>   # Import a tar archive as a Docker image
```

## Docker Compose (If Installed)
```bash
docker-compose up               # Start all services defined in docker-compose.yml
docker-compose down             # Stop and remove containers, networks, images, and volumes
docker-compose logs             # View logs of all services defined in docker-compose.yml
docker-compose ps               # List containers managed by Docker Compose
```

## Cleaning Up Docker
```bash
docker system prune             # Remove unused data (containers, images, networks, and volumes)
docker container prune          # Remove all stopped containers
docker image prune              # Remove unused Docker images
docker volume prune             # Remove unused Docker volumes
docker network prune            # Remove unused Docker networks
```
