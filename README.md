# lmsupporttools_image

The `Dockerfile` in this repo will deploy a container named `lmsuporttools` which will host the `LM Support Tools` portal and will be packaged with DNS resolution for the `lmsupporttools.com` domain.

To build this image to save locally, run the following command ---

`docker build -t lmsupporttools .`

Then, run the container from the locally built container image using command ---

`docker run -d --name lmsupporttools -p 53:53/tcp -p 53:53/udp -p 80:80 lmsupporttools`

You can skip having to build the image locally by pulling the `doubledockertaco/lmsupporttools:latest` from the Docker Hub repo ---

`docker pull doubledockertaco/lmsupporttools:latest`

Then deploy the container using command ---

`docker run -d --name lmsupporttools -p 53:53/tcp -p 53:53/udp -p 80:80 doubledockertaco/lmsupporttools:latest`

Docker Hub:
`https://hub.docker.com/repository/docker/doubledockertaco/lmsupporttools/general`
