#!/bin/bash

# Start Symfony server
php /bookmarks-ws/bin/console server:start 0.0.0.0:8000

# Start nginx.
# daemon mode is off, so the container stays up.
nginx -g "daemon off;"