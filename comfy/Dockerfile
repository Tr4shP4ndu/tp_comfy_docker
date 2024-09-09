################################################################################
# Running Ubuntu 24.04 with Cuda/CUDNN 12.6.1, Python 3.12, and GCC 13.
# The container will be running as root (easy for rootless deploy).
################################################################################

FROM nvidia/cuda:12.6.1-cudnn-devel-ubuntu24.04

# Set environment variables, noninteractive suppress prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# Install essential packages including Python 3.12 and pip from apt
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      cmake \
      git \
      wget \
      curl \
      ca-certificates \
      libjpeg-dev \
      libpng-dev \
      python3.12 \
      python3.12-dev \
      python3-pip \
      python3-opencv \
      pipx \
      libglib2.0-0 \
      ffmpeg \
      libopencv-dev \
      x264 \
      x265 \
      libgthread-2.0 \
      ninja-build \
      make \
      gcc-13 \
      g++-13 \
      && rm -rf /var/lib/apt/lists/*

# Set Python 3.12 as the default Python version
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 100

# RUN python3 -m pip install -r requirements.txt

# # Install PyTorch, torchvision, and torchaudio globally
# RUN apt-get install -y python3 -m pip \
#     torch==2.4.1+cu126 \
#     torchvision==0.15.2+cu126 \
#     torchaudio==2.4.1+cu126 \
#     --index-url https://download.pytorch.org/whl/cu126 \
#     --extra-index-url https://pypi.org/simple

# # Install the rest of the Python packages globally
# RUN apt-get install -y python3 -m pip \
#     numpy \
#     scipy \
#     pillow \
#     matplotlib \
#     opencv-python \
#     aiohttp \
#     joblib \
#     scikit-learn \
#     scikit-image \
#     numba \
#     onnx \
#     qrcode \
#     rich \
#     tqdm \
#     xformers \
#     onnxruntime-gpu

# Ensure the container can find CUDA libraries
ENV PATH=/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}

# Set the default command
CMD ["python3"]
