# Use official Apache HTTPD image
FROM httpd:2.4

# Copy custom index.html to Apache's web root
COPY ./index.html /usr/local/apache2/htdocs/

# Expose port 8080
EXPOSE 8000

# Change default port from 80 -> 8080
RUN sed -i 's/Listen 80/Listen 8000/' /usr/local/apache2/conf/httpd.conf
