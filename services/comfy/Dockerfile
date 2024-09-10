FROM pytorch/pytorch:2.4.1-cuda11.8-cudnn9-runtime

ENV DEBIAN_FRONTEND=noninteractive PIP_PREFER_BINARY=1

# Install system dependencies
RUN apt-get update && \
    apt-get install -y \
    git \
    build-essential \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV ROOT=/comfy

# Clone the repository and install Python dependencies
RUN --mount=type=cache,target=/root/.cache/pip \
    git clone https://github.com/comfyanonymous/ComfyUI.git ${ROOT} && \
    cd ${ROOT} && \
    git checkout master && \
    git reset --hard 276f8fce9f5a80b500947fb5745a4dde9e84622d && \
    pip install -r requirements.txt && \
    pip install \
      gitpython \
      deepdiff \
      piexif \
      matplotlib \
      numexpr \
      omegaconf \
      dlib \
      insightface \
      numba

# Set working directory /stable-diffusion
WORKDIR ${ROOT}
# Copy other required files
COPY . /docker/

# Copy the python_packages.txt file into the container
COPY python_packages.txt ${ROOT}/

# Clone the repository and install Python dependencies from Custom Nodes
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install -r ${ROOT}/python_packages.txt

RUN chmod u+x /docker/entrypoint.sh && cp /docker/extra_model_paths.yaml ${ROOT}

# Set environment variables for the application
ENV NVIDIA_VISIBLE_DEVICES=all PYTHONPATH="${PYTHONPATH}:${PWD}" CLI_ARGS=""

# Expose port for the application
EXPOSE 7860

# Define entrypoint and default command
ENTRYPOINT ["/docker/entrypoint.sh"]
CMD python -u main.py --listen --port 7860 ${CLI_ARGS}
