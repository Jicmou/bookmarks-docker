# Bookmarks-docker

## Installation

note: this installation file is also visible [here](https://github.com/Jicmou/bookmarks-docker)

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

as the installation steps highly depends on your environment.

### Build steps

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


```bash
docker run -d --rm \
  --name <YOUR_CONTAINER_NAME> \
  -p <YOUR_GUI_PORT>:80 \
  -p <YOUR_API_PORT>:8000 \
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

## API Documentation

The API documentation is accessible with the following url: `http://<YOUR_IP_ADRESS>:<YOUR_API_DOCUMENTATION_PORT>`

e.g: `http://localhost:8080`

## API Endpoint

You can freely use the REST API wth a tool like [postman](https://www.getpostman.com/) with the following endpoint:
`http://<YOUR_IP_ADRESS>:<YOUR_API_PORT>`

e.g: `http://localhost:8000`

