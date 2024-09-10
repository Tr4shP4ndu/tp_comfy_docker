#!/usr/bin/env bash

set -Eeuo pipefail

# Create necessary directories
mkdir -vp /data/{config,workspaces,input,custom_nodes,output,models/{checkpoints,clip,clip_vision,configs,diffusers,diffusion_models,embeddings,gligen,hypernetworks,loras,photomaker,style_models,unet,upscale_models,vae,vae_approx}}

# Download files for /data/models
[[ -f /docker/models.txt ]] && aria2c -x 10 --disable-ipv6 --input-file /docker/models.txt --dir /data/models --continue

# Clone or pull repositories for /data/custom_nodes
if [[ -f /docker/custom_nodes.txt ]]; then
  echo "Processing custom nodes repositories..."
  while IFS= read -r line; do
    [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue
    repo_url=$(echo "$line" | awk '{print $1}')
    custom_dir=$(echo "$line" | awk -F 'out=' '{print $2}')
    target_dir="/data/custom_nodes/${custom_dir:-$(basename -s .git "$repo_url")}"
    [[ -d "$target_dir" ]] && git -C "$target_dir" pull || git clone "$repo_url" "$target_dir"
  done < /docker/custom_nodes.txt
fi

echo "All download processes completed."
