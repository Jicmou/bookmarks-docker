FROM fedora:28

# Install environment
RUN dnf update -y
RUN dnf install -y \
  git \
  nginx \
  nodejs \
  php \
  php-json \
  php-posix \
  php-xml

# Import sources

ARG GUI_REPO=https://github.com/Jicmou/bookmarks-gui.git
ARG OPENAPI_REPO=https://github.com/Jicmou/bookmarks-openapi.git
ARG WS_REPO=https://github.com/Jicmou/bookmarks-ws.git

ARG GUI_BRANCH=master
ARG OPENAPI_BRANCH=master
ARG WS_BRANCH=master

RUN git clone -b $GUI_BRANCH $GUI_REPO bookmarks-gui
RUN git clone -b $OPENAPI_BRANCH $OPENAPI_REPO bookmarks-openapi
RUN git clone -b $WS_BRANCH $WS_REPO bookmarks-ws

# Import nginx config
COPY ./bookmarks-gui.conf /etc/nginx/conf.d/
COPY ./bookmarks-openapi.conf /etc/nginx/conf.d/

# Import init script
COPY ./init.sh /scripts/

# Build documentation
WORKDIR /bookmarks-openapi
RUN npm install
RUN npm run swagger-ui:yaml2json

# install ws dependencies
WORKDIR /bookmarks-ws
RUN php composer.phar install

# Build gui deliverables from source
WORKDIR /bookmarks-gui
RUN npm install
RUN npm run build

# Expose GUI and API ports
EXPOSE 80
EXPOSE 8000
EXPOSE 8081

ENTRYPOINT [ "/scripts/init.sh" ]


