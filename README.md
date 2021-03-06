# Bookmarks-docker

## Installation

note: this installation file is also visible [here](https://github.com/Jicmou/bookmarks-docker)

### From ZIP File

Extract ZIP file in the directory of your choice

```bash
unzip bookmark-docker.zip -d <YOUR_DIRECTORY>
```
e.g:
```bash
unzip bookmark-docker.zip -d bookmarks
```

### From Github

```bash
git clone https://github.com/Jicmou/bookmarks-docker.git <YOUR_DIRECTORY>
```
e.g:
```bash
git clone https://github.com/Jicmou/bookmarks-docker.git bookmarks
```

## Build the container image

### Prerequisites

You must have docker installed and up and running on your system.

It is the only environment dependency you need to run the app.

Please refer to the [docker website](https://docs.docker.com/install/)

as the installation steps highly depend on your environment.

### Build steps

Enter the directory and `build` the docker image. Make sure the `Dockerfile` is present in the directory:

```bash
cd <YOUR_DIRECTORY>
docker build -t <YOUR_IMAGE_NAME> .
```
e.g:
```bash
cd bookmarks
docker build -t bookmarks .
```

## Run the container

Run the container with the `run` command. Make sure to bind the docker exposed ports to *free* local ports of your choice.

The container exposes three ports:

* GUI Port: 80
* REST API Port: 8000
* API Documentation: 8081

As the GUI doesn't have a proper way to configure tha api url, we must bind the REST API port with your local port 8000.

```bash
docker run -d --rm \
  --name <YOUR_CONTAINER_NAME> \
  -p <YOUR_GUI_PORT>:80 \
  -p 8000:8000 \
  -p <YOUR_API_DOCUMENTATION_PORT>:8081 \
  <YOUR_IMAGE_NAME>
```
e.g:
```bash
docker run -d --rm \
  --name bookmarks \
  -p 8080:80 \
  -p 8000:8000 \
  -p 8081:8081 \
  bookmarks
```

## Enjoy the app

You can enter the gui with your favourite browser by typing the following url: `http://<YOUR_IP_ADRESS>:<YOUR_GUI_PORT>`

e.g: `http://localhost:8080`

## API Endpoint

You can freely use the REST API with a tool like [postman](https://www.getpostman.com/) with the following endpoint:
`http://<YOUR_IP_ADRESS>:8000`

e.g: `http://localhost:8000`

## API Documentation

The API documentation is accessible with the following url: `http://<YOUR_IP_ADRESS>:<YOUR_API_DOCUMENTATION_PORT>`

e.g: `http://localhost:8081`

## Additional informations

You can see the code source of the whole project on [github](https://github.com/Jicmou?tab=repositories)

* The GUI built with [react](https://reactjs.org/): [https://github.com/Jicmou/bookmarks-gui](https://github.com/Jicmou/bookmarks-gui)
* The Backend Server built with [Symfony](https://symfony.com/): [https://github.com/Jicmou/bookmarks-ws](https://github.com/Jicmou/bookmarks-ws)
* The API Documentation built with [Swagger](https://swagger.io/specification/): [https://github.com/Jicmou/bookmarks-openapi](https://github.com/Jicmou/bookmarks-openapi)
* The [Docker](https://www.docker.com/) image: [https://github.com/Jicmou/bookmarks-docker](https://github.com/Jicmou/bookmarks-docker)