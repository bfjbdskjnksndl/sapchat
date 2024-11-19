# Use NGINX to serve static files
FROM nginx:alpine

# Copy HTML files to NGINX's default directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Command to run NGINX
CMD ["nginx", "-g", "daemon off;"]
