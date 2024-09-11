#!/usr/bin/env bash

set -Eeuo pipefail

# Create necessary directories
mkdir -vp /data/{config,workspaces,input,custom_nodes,output,models/{checkpoints,clip,clip_vision,configs,diffusers,diffusion_models,embeddings,gligen,hypernetworks,loras,photomaker,style_models,unet,upscale_models,vae,vae_approx}}

function clone_or_pull () {
    local repo_url="$1"
    local custom_name="$2"

    echo "Cloning or pulling $repo_url into $custom_name..."

    if [[ -d "$custom_name" ]]; then
        echo "$custom_name already exists. Pulling latest changes..."
        git -C "$custom_name" pull --ff-only
    else
        git clone --depth=1 --no-tags --recurse-submodules --shallow-submodules "$repo_url" "$custom_name"
    fi
}

cd /data/custom_nodes

echo "########################################"
echo "[INFO] Downloading Custom Nodes..."
echo "########################################"

# Workspace
clone_or_pull https://github.com/ltdrdata/ComfyUI-Manager.git ComfyUI-Manager
clone_or_pull https://github.com/11cafe/comfyui-workspace-manager.git ComfyUI-Workspace-Manager
clone_or_pull https://github.com/AIGODLIKE/AIGODLIKE-ComfyUI-Translation.git ComfyUI-AIGodLike-Translation
clone_or_pull https://github.com/crystian/ComfyUI-Crystools.git ComfyUI-Crystools
clone_or_pull https://github.com/crystian/ComfyUI-Crystools-save.git ComfyUI-Crystools-save
clone_or_pull https://github.com/giriss/comfy-image-saver.git ComfyUI-Image-Saver

# General
clone_or_pull https://github.com/bash-j/mikey_nodes.git ComfyUI-Mikey-Nodes
clone_or_pull https://github.com/chrisgoringe/cg-use-everywhere.git ComfyUI-CG-Use-Everywhere
clone_or_pull https://github.com/cubiq/ComfyUI_essentials.git ComfyUI-Essentials
clone_or_pull https://github.com/jags111/efficiency-nodes-comfyui.git ComfyUI-Efficiency-Nodes
clone_or_pull https://github.com/kijai/ComfyUI-KJNodes.git ComfyUI-KJNodes
clone_or_pull https://github.com/pythongosssss/ComfyUI-Custom-Scripts.git ComfyUI-Custom-Scripts
clone_or_pull https://github.com/rgthree/rgthree-comfy.git ComfyUI-RGThree-Nodes
clone_or_pull https://github.com/shiimizu/ComfyUI_smZNodes.git ComfyUI-SMZ-Nodes
clone_or_pull https://github.com/GTSuya-Studio/ComfyUI-Gtsuya-Nodes.git ComfyUI-Gtsuya-Nodes
clone_or_pull https://github.com/daxcay/ComfyUI-JDCN.git ComfyUI-JDCN
clone_or_pull https://github.com/filliptm/ComfyUI_Fill-Nodes.git ComfyUI-Fill-Nodes
clone_or_pull https://github.com/aria1th/ComfyUI-LogicUtils.git ComfyUI-LogicUtils
clone_or_pull https://github.com/kijai/ComfyUI-depth-fm.git ComfyUI-Depth-FM
clone_or_pull https://github.com/kijai/ComfyUI-Geowizard.git ComfyUI-GeoWizard
clone_or_pull https://github.com/kijai/ComfyUI-Marigold.git ComfyUI-Marigold
clone_or_pull https://github.com/picturesonpictures/comfy_PoP.git ComfyUI-PoP
clone_or_pull https://github.com/Derfuu/Derfuu_ComfyUI_ModdedNodes.git ComfyUI-Derfuu-ModdedNodes

# Control
clone_or_pull https://github.com/cubiq/ComfyUI_InstantID.git ComfyUI-Instant-ID
clone_or_pull https://github.com/cubiq/ComfyUI_IPAdapter_plus.git ComfyUI-IPAdapter-Plus
clone_or_pull https://github.com/Fannovel16/comfyui_controlnet_aux.git ComfyUI-ControlNet-Aux
clone_or_pull https://github.com/florestefano1975/comfyui-portrait-master.git ComfyUI-Portrait-master
clone_or_pull https://github.com/Gourieff/comfyui-reactor-node.git ComfyUI-Reactor-Node
clone_or_pull https://github.com/huchenlei/ComfyUI-layerdiffuse.git ComfyUI-Layer-Diffuse
clone_or_pull https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet.git ComfyUI-Advanced-ControlNet
clone_or_pull https://github.com/ltdrdata/ComfyUI-Impact-Pack.git ComfyUI-Impact-Pack
clone_or_pull https://github.com/ltdrdata/ComfyUI-Inspire-Pack.git ComfyUI-Inspire-Pack
clone_or_pull https://github.com/mcmonkeyprojects/sd-dynamic-thresholding.git ComfyUI-SD-Dynamic-Thresholding
clone_or_pull https://github.com/storyicon/comfyui_segment_anything.git ComfyUI-Segment-Anything
clone_or_pull https://github.com/twri/sdxl_prompt_styler.git ComfyUI-Prompt-Styler
clone_or_pull https://github.com/KoreTeknology/ComfyUI-Universal-Styler.git ComfyUI-Universal-Styler

# Video
clone_or_pull https://github.com/Fannovel16/ComfyUI-Frame-Interpolation.git ComfyUI-Frame-Interpolation
clone_or_pull https://github.com/FizzleDorf/ComfyUI_FizzNodes.git ComfyUI-Fizz-Nodes
clone_or_pull https://github.com/Kosinkadink/ComfyUI-AnimateDiff-Evolved.git ComfyUI-AnimateDiff-Evolved
clone_or_pull https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git ComfyUI-VideoHelperSuite
clone_or_pull https://github.com/melMass/comfy_mtb.git ComfyUI-MTB
clone_or_pull https://github.com/MrForExample/ComfyUI-AnimateAnyone-Evolved.git ComfyUI-AnimateAnyone-Evolved

# More
clone_or_pull https://github.com/cubiq/ComfyUI_FaceAnalysis.git ComfyUI-FaceAnalysis
clone_or_pull https://github.com/pythongosssss/ComfyUI-WD14-Tagger.git ComfyUI-WD14-Tagger
clone_or_pull https://github.com/SLAPaper/ComfyUI-Image-Selector.git ComfyUI-Image-Selector

# WAS NS' deps were not fully installed, but it can still run, and have most features enabled
clone_or_pull https://github.com/WASasquatch/was-node-suite-comfyui.git

# Download files for /data/models
[[ -f /docker/models.txt ]] && aria2c -x 10 --disable-ipv6 --input-file /docker/models.txt --dir /data/models --continue

echo "All download processes completed."
