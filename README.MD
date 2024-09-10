# ComfyUI Docker

A recent project to help anyone be able to quickly start their ComfyUI journey with everything set for anyone to start.

This project is running through several iteractions until we can find a most viable solution in getting the best experience while running ComfyUI in docker.

The current available Docker Images are:
- OpenSuse docker.io/opensuse/tumbleweed:latest - Depricated
- Download bash:alpine3.20
- PyTorch pytorch/pytorch:2.4.1-cuda11.8-cudnn9-runtime

Quick start
```docker
docker compose --profile download up --build // to download all the models and custom nodes
[This will take an enormous amount of time due to the fact it''s download all the necessary models plus custom nodes]

docker compose --profile comfy up --build // Clones ComfyUI, install all the dependecies and start's it
```

