FROM nginx:alpine

# Copy static content to NGINX's default HTML directory
COPY . /usr/share/nginx/html

# Copy custom nginx.conf (explained below)
COPY nginx.conf /etc/nginx/nginx.conf

# Expose the HTTP port
EXPOSE 80
EXPOSE 3000
