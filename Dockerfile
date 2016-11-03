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
  gconf \
  unzip \
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
  sudo pacman -U chromium-* --noconfirm --needed && \
  rm chromium-*

### upgrade chromedrive due to errors
RUN wget  http://chromedriver.storage.googleapis.com/2.25/chromedriver_linux64.zip -P /tmp/chromedriver && \
  unzip /tmp/chromedriver/chromedriver_linux64.zip -d /tmp/chromedriver && \
  chmod +x /tmp/chromedriver/chromedriver && \
  sudo mv -f /tmp/chromedriver/chromedriver /usr/local/share/chromedriver && \
  sudo ln -fs /usr/local/share/chromedriver /usr/local/bin/chromedriver && \
  sudo ln -fs /usr/local/share/chromedriver /usr/bin/chromedriver && \
  rm -r /tmp/chromedriver
