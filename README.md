# Podman AI containers Pods

This repository contains configuration and setup for running an AI web application using Podman, with specific focus on integrating NVIDIA GPUs for accelerated computing through CUDA support. The setup includes Docker images tailored for different AI tasks, including stable diffusion model execution and text generation via Ollama. Below is a brief overview of the components and how they interact within this environment.

## Components Overview

### 1. SD.Next Container (sdnext)
This container is built using NVIDIA's CUDA runtime base image (`nvidia/cuda:12.5.0-runtime-ubuntu22.04`). It includes specific configurations and scripts to start a stable diffusion web interface, listening on port `7860`, with options for documentation and debugging. The setup script is located at `/sdnext/start.sh`.

#### Key Files:
- **Containerfile (`sdnext/Containerfile`)**: Defines the build of this container, including dependencies like Python 3, Git, CUDA runtime, and user management.
- **`start.sh` (sdnext/start.sh)**: The script responsible for launching SD.Next with specified configurations.

### 2. Ollama Container
This container runs a text generation server using the Ollama image (`docker.io/ollama/ollama:latest`). It listens on port `11434`.

#### Key Files:
- **Containerfile (Omitted for brevity)**: Similar to SD.Next, it includes basic setup and environment configuration.
- **Entrypoint Script**: The Ollama container uses a similar entry script that activates the Python virtual environment and starts the server based on provided arguments (`serve`).

### 3. Kubernetes Pod Configuration (aiweb.kube.yaml)
This YAML file defines a Podman Pod as a Kubernetes Pod

#### Key Elements:
- **Containers**: Two containers (`sdnext` and `ollama`) are specified with appropriate ports and security contexts tailored for GPU usage.
- **Volume Mounts**: Persistent volume mounts for shared data (models) and configuration settings.

## Usage

```bash

podman kube play aiweb.kube.yaml

```