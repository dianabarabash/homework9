FROM centos:centos7

RUN yum install -y epel-release && \
    yum install -y nginx && \
    rm -rf /usr/share/nginx/html/*

COPY ./index.html /usr/share/nginx/html/index.html

# Expose the port for access
EXPOSE 80

# Run the Nginx server
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
