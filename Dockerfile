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

ARG WS_REPO=https://github.com/Jicmou/bookmarks-ws.git
ARG GUI_REPO=https://github.com/Jicmou/bookmarks-gui.git

ARG WS_BRANCH=master
ARG GUI_BRANCH=master

RUN git clone -b $WS_BRANCH $WS_REPO bookmarks-ws
RUN git clone -b $GUI_BRANCH $GUI_REPO bookmarks-gui

# Import nginx config
COPY ./bookmarks.conf /etc/nginx/conf.d/

# Import init script
COPY ./init.sh /scripts/

# install ws dependencies
WORKDIR /bookmarks-ws
RUN php composer.phar install

# Build gui deliverables from source
WORKDIR /bookmarks-gui
RUN npm install
RUN npm run build

# Expose GUI and API ports
EXPOSE 8000
EXPOSE 80

ENTRYPOINT [ "/scripts/init.sh" ]


