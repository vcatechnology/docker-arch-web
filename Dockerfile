FROM vcatechnology/arch-ci:latest
MAINTAINER VCA Technology <developers@vcatechnology.com>

RUN sudo pacman --noconfirm --needed -S \
  npm \
  chromium \
  firefox \
  xorg-server-xvfb \
  x11vnc \
  nodejs \
  jre8-openjdk \
  gcc \
  gconf \
  openssh

ENV LAUNCHPAD_CHROME /usr/local/bin/chromium-no-sandbox

ENV CHROME_BIN /usr/local/bin/chromium-no-sandbox

ENV CHROMIUM_BIN /usr/local/bin/chromium-no-sandbox

### downgrade node version due to nodegit error with v0.7.0
RUN sudo npm install -g n && sudo n 6.9.0

RUN sudo su -c " \
  echo '#! /bin/sh' > /usr/local/bin/chromium-no-sandbox && \
  echo 'chromium \$@ --no-sandbox' >> /usr/local/bin/chromium-no-sandbox && \
  chmod +x /usr/local/bin/chromium-no-sandbox && \
  exit"
