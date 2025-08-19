# Use an official OpenJDK image as the base image
FROM openjdk:11-jre-slim

# Set environment variables for Tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Download and extract Tomcat
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.80/bin/apache-tomcat-9.0.80.tar.gz && \
    tar -xzf apache-tomcat-9.0.80.tar.gz -C /usr/local && \
    mv /usr/local/apache-tomcat-9.0.80 $CATALINA_HOME && \
    rm apache-tomcat-9.0.80.tar.gz

# Expose the default Tomcat port
EXPOSE 8080

# Copy your web application (WAR file) into the webapps directory
# Replace 'your-webapp.war' with the actual name of your WAR file
# COPY your-webapp.war $CATALINA_HOME/webapps/

# Command to start Tomcat when the container launches
CMD ["catalina.sh", "run"]