FROM vcatechnology/arch-ci:latest
MAINTAINER VCA Technology <developers@vcatechnology.com>

RUN sudo pacman --noconfirm --needed -S \
  npm \
  chromium \
  firefox \
  xorg-server-xvfb \
#  x11vnc \
  nodejs \
  openssh

RUN sudo npm install -g gulp bower polymer-cli
