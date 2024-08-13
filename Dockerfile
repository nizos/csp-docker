FROM nginx:alpine

# Copy custom nginx.conf
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Copy HTML and CSS files to the appropriate location
COPY site/index.html /usr/share/nginx/html/index.html
COPY site/style.css /usr/share/nginx/html/style.css

CMD ["nginx", "-g", "daemon off;"]
