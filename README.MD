# ComfyUI Docker Setup

This project provides a quick and easy setup for running [ComfyUI](https://github.com/comfyanonymous/ComfyUI) in a Docker environment. It uses two Docker images:

- **bash:alpine3.20** – for downloading models and custom nodes.
- **pytorch/pytorch:2.4.1-cuda11.8-cudnn9-runtime** – for setting up and running ComfyUI with all necessary dependencies.

## Getting Started

### Prerequisites

- Ensure you have Docker and Docker Compose installed on your machine.

### Starting the Docker Containers

1. **Download models and custom nodes:**

    ```bash
    docker compose --profile download up --build
    ```

    This command creates the necessary folders and downloads models and custom nodes.

2. **Set up and start ComfyUI:**

    ```bash
    docker compose --profile comfy up --build
    ```

    This step clones the ComfyUI repository, installs the dependencies, and starts ComfyUI.

3. **Subsequent runs (after initial build):**

    ```bash
    docker compose --profile comfy up
    ```

    This command starts the already built ComfyUI environment.

## Accessing the Application

Once the containers are up and running, you can access ComfyUI in your browser at:

[http://localhost:7860](http://localhost:7860)

---

## Provided Models

This Docker setup comes with several pre-configured models, with more potentially added in the future based on needs.

### Checkpoints

- **Playground v2.5 1024px Aesthetic**
- **SDXL Turbo 1.0**
- **V1.5 Pruned EMA-only**
- **DreamShaper 8**

### VAE

- **VAE ft MSE 840000 EMA Pruned**
- **FLUX.1 Schnell Diffusion**
- **FLUX.1 Schnell AE**
- **TaeSD Decoder**
- **TaeSDXL Decoder**

### Upscale

- **RealESRGAN x4plus**
- **RealESRGAN x4plus Anime 6B**
- **4x AnimeSharp**
- **4x UltraSharp**
- **4x NMKD Siax 200k**
- **4x Foolhardy Remacri**
- **8x NMKD Superscale 150000 G**
- **SUPIR-v0F**
- **SUPIR-v0Q**
- **1x DeJPG OmniSR (Two versions)**

### Embeddings

- **EasyNegative**
- **DeepNegative V1 75T**

### CLIP

- **CLIP-L**
- **T5XXL fp16**
- **T5XXL fp8 e4m3fn**
- **CLIP Vision**
- **CLIP ViT Large Patch14**
- **Control-LoRA CLIP Vision G**

### unCLIP

- **Stable Diffusion 2.1 UnCLIP Small**
- **ControlNet v1.1**
- **ControlNet v11f1p SD15 Depth**
- **ControlNet v11p SD15 Canny**
- **ControlNet v11p SD15 OpenPose**
- **ControlNet v11e SD15 IP2P**
- **ControlNet v11e SD15 Shuffle**
- **ControlNet v11f1e SD15 Tile**
- **ControlNet v11p SD15 Inpaint**
- **ControlNet v11p SD15 LineArt**
- **ControlNet v11p SD15 MLSd**
- **ControlNet v11p SD15 NormalBae**
- **ControlNet v11p SD15 Scribble**
- **ControlNet v11p SD15 Seg**
- **ControlNet v11p SD15 SoftEdge**
- **ControlNet v11p SD15S2 LineArt Anime**
- **Control-LoRA**
- **Control-LoRA Canny Rank256**
- **Control-LoRA Depth Rank256**
- **Control-LoRA Recolor Rank256**
- **Control-LoRA Sketch Rank256**

### Animated Diff Evolved

- **mm SD v14**
- **mm SD v15**
- **mm SD v15 v2**
- **mm SD15 Animatediff Models v3**
- **mm-Stabilized Mid**
- **mm-Stabilized High**
- **TemporalDiff v1 Animatediff**
- **TemporalDiff v1 CKPT**
- **mm SDXL HS**
- **mm SDXL v10 Beta**
- **mm SD15 v2**
- **mm SD15 v3**

### UNET

- **FLUX1 Schnell FP8**
- **FLUX1 Dev**

---

## Custom Nodes

This setup also includes several custom nodes, some of which may have workarounds to ensure proper functioning.

### ComfyUI Manager

- **ComfyUI-Manager**
- **comfyui-workspace-manager**
- **AIGODLIKE-ComfyUI-Translation**
- **ComfyUI-Crystools**
- **ComfyUI-Crystools-save**
- **comfy-image-saver**

### General Nodes

- **mikey_nodes**
- **cg-use-everywhere**
- **ComfyUI_essentials**
- **efficiency-nodes-comfyui**
- **ComfyUI-KJNodes**
- **ComfyUI-Custom-Scripts**
- **rgthree-comfy** *(Currently not working/disabled)*
- **ComfyUI_smZNodes** *(Currently not working/disabled)*
- **ComfyUI-Gtsuya-Nodes**
- **ComfyUI-JDCN**
- **ComfyUI_Fill-Nodes**
- **ComfyUI-LogicUtils**
- **ComfyUI-depth-fm**
- **ComfyUI-Geowizard**
- **ComfyUI-Marigold**
- **comfy_PoP**
- **Derfuu_ComfyUI_ModdedNodes**

### Control Nodes

- **ComfyUI_InstantID**
- **ComfyUI_IPAdapter_plus**
- **comfyui_controlnet_aux**
- **comfyui-portrait-master**
- **comfyui-reactor-node**
- **ComfyUI-layerdiffuse**
- **ComfyUI-Advanced-ControlNet**
- **ComfyUI-Impact-Pack**
- **ComfyUI-Inspire-Pack**
- **sd-dynamic-thresholding**
- **comfyui_segment_anything**
- **sdxl_prompt_styler**
- **ComfyUI-Universal-Styler**

### Video Nodes

- **ComfyUI-Frame-Interpolation**
- **ComfyUI_FizzNodes**
- **ComfyUI-AnimateDiff-Evolved**
- **ComfyUI-VideoHelperSuite**
- **comfy_mtb**
- **ComfyUI-AnimateAnyone-Evolved**

### Additional Nodes

- **ComfyUI_FaceAnalysis**
- **ComfyUI-WD14-Tagger**
- **ComfyUI-Image-Selector**

### WAS Node Suite

- **was-node-suite-comfyui**

---

Feel free to contribute by submitting issues or pull requests to improve the setup or add new features.
