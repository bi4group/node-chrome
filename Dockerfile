# Grab Ubuntu
FROM ubuntu:latest

# Install utilities
RUN apt-get update --fix-missing && apt-get -y upgrade &&\
apt-get install -y sudo curl wget unzip git python build-essential

# Install node 10
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

# Install Chromium & Xvfb
RUN \
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update && \
  apt-get install -y google-chrome-stable xvfb && \
  rm -rf /var/lib/apt/lists/*
