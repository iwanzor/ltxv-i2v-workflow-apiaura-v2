# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install comfyui-ltxvideo --mode remote
RUN comfy node install comfyui-videohelpersuite --mode remote


# download models into comfyui
RUN comfy model download --url https://huggingface.co/Lightricks/LTX-Video/resolve/main/ltx-video-2b-v0.9.5.safetensors --relative-path models/checkpoints --filename ltx-video-2b-v0.9.5.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
