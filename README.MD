# ComfyUI Docker

A recent project to help anyone be able to quickly start their ComfyUI journey with everything set for anyone to start.

This project is running through several iteractions until we can find a most viable solution in getting the best experience while running ComfyUI in docker.

The current available Docker Images are:
- OpenSuse docker.io/opensuse/tumbleweed:latest
- Ubuntu nvidia/cuda:12.6.1-cudnn-devel-ubuntu24.04

Unfortunatly, OpenSuse is no longer working and at the moment trying to shift things to use Ubuntu with Nvidia Cuda and CuDnn

Quick start
```docker
docker compose --profile comfy_suse up --build // Depricated

docker compose --profile comfy_ubuntu up --build //Testing
```

