FROM stoo/baseimage:0.9.12

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y curl

# Install additional packages
RUN apt-get install -y less
RUN apt-get install -y man
RUN apt-get install -y unixodbc
RUN apt-get install -y libssl1.0.0
#RUN apt-get install -y libwxgtk2.8-0

RUN apt-get install -y make
RUN apt-get install -y --reinstall openssh-server
RUN ssh-keygen -q -t rsa -f /root/.ssh/id_rsa -N ""
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys
RUN echo "root:root" | chpasswd
RUN apt-get install -y host
RUN apt-get install -y git

# Install package and add to PATH
ADD erlang-17.1.tar.gz /
RUN ln -s erlang-17.1 /opt/erlang
RUN ln -s /opt/erlang/bin/* /usr/local/bin/

#ENV PATH /opt/erlang/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
## Run a shell by default
#CMD ["/bin/bash"]

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
