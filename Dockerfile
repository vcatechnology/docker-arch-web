FROM vcatechnology/arch-ci:latest
MAINTAINER VCA Technology <developers@vcatechnology.com>

RUN sudo pacman --noconfirm --needed -S \
  npm \
  #chromium \
  firefox \
  xorg-server-xvfb \
  x11vnc \
  nodejs \
  jre8-openjdk \
  wget \
  gcc \
  openssh

ENV LAUNCHPAD_CHROME /usr/local/bin/chromium-no-sandbox

ENV CHROME_BIN /usr/local/bin/chromium-no-sandbox

ENV CHROMIUM_BIN /usr/local/bin/chromium-no-sandbox

RUN sudo su -c " \
  echo '#! /bin/sh' > /usr/local/bin/chromium-no-sandbox && \
  echo 'chromium \$@ --no-sandbox' >> /usr/local/bin/chromium-no-sandbox && \
  chmod +x /usr/local/bin/chromium-no-sandbox && \
  exit"

### downgrade chromium due to errors https://github.com/Polymer/web-component-tester/issues/366
RUN wget https://archive.archlinux.org/packages/c/chromium/chromium-53.0.2785.92-1-x86_64.pkg.tar.xz && \
  sudo pacman -U chromium-* --noconfirm --needed

RUN sudo npm install -g gulp bower polymer-cli
