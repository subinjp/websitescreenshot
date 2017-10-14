FROM ubuntu
MAINTAINER Subin Joseph (subin.joseph7@gmail.com)


# Make executable
#RUN chmod +x /bin/run.sh

RUN mkdir -p /var/output/

COPY run.sh .
COPY index.js .  
#running the setup.sh
ENTRYPOINT [ "./run.sh" ]