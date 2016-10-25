FROM vcatechnology/arch-ci:latest
MAINTAINER VCA Technology <developers@vcatechnology.com>

RUN sudo pacman --noconfirm --needed -S \
  npm \
  chromium \
  firefox \
  xorg-server-xvfb \
  x11vnc \
  nodejs \
  ### chrome dependencies
  alsa-lib \
  desktop-file-utils \
  flac \
  gconf \
  gnome-themes-standard \
  gtk2 \
  harfbuzz \
  harfbuzz-icu \
  hicolor-icon-theme \
  libpng \
  libxss \
  libxtst \
  nss \
  opus \
  snappy \
  speech-dispatcher \
  ttf-font \
  xdg-utils \
  fakeroot \
  patch \
  # yaourt
  openssh

RUN git clone https://aur.archlinux.org/google-chrome.git && cd google-chrome && makepkg && sudo pacman -U google-chrome-5* --noconfirm --needed

RUN sudo npm install -g gulp bower polymer-cli
