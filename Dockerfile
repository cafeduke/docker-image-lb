# Use the alpine version of nginx to create a loadbalancer (LB)
FROM nginx:alpine

# By default, the origin server for all requests shall be "duke.in"
# This can be overridden by passing environment variable (-e ORIGIN_SERVER=<my.host.com>) while running the container
ENV ORIGIN_SERVER="duke.in"

# Ensure we have the templates dir in nginx
RUN mkdir -p /etc/nginx/templates/

# Copy the default.conf.template to nginx templates home
# ORIGIN_SERVER is used as a variable in the template file
# /etc/nginx/conf.d/default.conf is dynamically generated from /etc/nginx/templates/default.conf.template during container start
# During the generation of default.conf the variables shall be replaced with values (fetched from environment).
COPY ./default.conf.template /etc/nginx/templates/
