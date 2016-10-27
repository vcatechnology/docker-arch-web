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
  # yaourt
  openssh

ENV LAUNCHPAD_CHROME /usr/bin/chromium

ENV CHROME_BIN /usr/bin/chromium

ENV DISPLAY :99.0

### downgrade chromium due to errors https://github.com/Polymer/web-component-tester/issues/366
RUN wget https://archive.archlinux.org/packages/c/chromium/chromium-51.0.2704.84-1-x86_64.pkg.tar.xz && sudo pacman -U chromium-* --noconfirm --needed

RUN sudo npm install -g gulp bower polymer-cli
