# Use NGINX as base image
FROM nginx:alpine

# Set environment variables (if needed for your app)
ENV APP_PORT=3000

# Copy your static files (from the GitHub repository root) to NGINX's HTML folder
COPY . /usr/share/nginx/html

# Create a custom nginx.conf that handles both static content and proxying
RUN echo ' \
server { \
    listen 80; \
    root /usr/share/nginx/html; \
    index index.html; \
    location / { \
        try_files $uri $uri/ =404; \
    } \
    location /app/ { \
        proxy_pass http://localhost:3000; \
        proxy_http_version 1.1; \
        proxy_set_header Upgrade $http_upgrade; \
        proxy_set_header Connection "upgrade"; \
        proxy_set_header Host $host; \
        proxy_cache_bypass $http_upgrade; \
    } \
    location /health { \
        proxy_pass http://localhost:3000/health; \
    } \
} \
' > /etc/nginx/nginx.conf

# Expose the HTTP and app ports
EXPOSE 80
EXPOSE 3000

# Health check (assumes backend app has a /health endpoint)
HEALTHCHECK CMD curl --fail http://localhost:3000/health || exit 1

# Set the default command to run NGINX
CMD ["nginx", "-g", "daemon off;"]
