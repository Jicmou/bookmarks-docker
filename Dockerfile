FROM fedora:28

# Install environment
RUN dnf update -y
RUN dnf install -y \
  nginx \
  nodejs \
  php \
  php-json \
  php-posix \
  php-xml

# Import sources
COPY ./bookmarks-ws /bookmarks-ws/
COPY ./bookmarks-gui /bookmarks-gui/

# Import nginx config
COPY ./bookmarks.conf /etc/nginx/conf.d/

# Import init script
COPY ./init.sh /scripts/

# Build gui deliverables from source
WORKDIR /bookmarks-gui
RUN npm install
RUN npm run build

# Expose GUI and API ports
EXPOSE 8000
EXPOSE 80

ENTRYPOINT [ "/scripts/init.sh" ]


