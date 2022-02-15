# Download base image ubuntu
FROM ubuntu
RUN apt-get update
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get -y install apache2
RUN apt-get -y install apache2-utils
RUN apt-get clean
COPY index.html /var/www/html/
EXPOSE 80
#CMD [“apache2ctl”, “-D”, “FOREGROUND”]
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]

