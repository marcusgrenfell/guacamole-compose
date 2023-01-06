FROM debian:11-slim
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install xfce4 xrdp chromium-common chromium xfce4-goodies xorg dbus-x11 x11-xserver-utils sudo net-tools firefox-esr
RUN adduser xrdp ssl-cert
RUN useradd -m -G 27 -p "$(openssl passwd -1 marcusgrenfell123)" guacauser
RUN echo "guacauser ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
CMD service xrdp start; tail -f /var/log/xrdp.log
