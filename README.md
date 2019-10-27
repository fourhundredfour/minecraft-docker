# minecraft-docker
Dockerfile to containerize a minecraft server

## Requirements
* Docker

## Installation
1. Clone this repository
2. Build the Dockerfile with `docker build . -t [image name]:[image version]`
3. Run the image with `docker run -P -it [image name]:[image version]`

To persist the world or to change the plugins, please use a volume.