FROM phusion/baseimage:0.9.9
MAINTAINER Seid Adem <seid.adem@gmail.com>

#================================================
# Customize sources for apt-get
#================================================
RUN  echo "deb http://archive.ubuntu.com/ubuntu precise main universe\n" > /etc/apt/sources.list \
  && echo "deb http://archive.ubuntu.com/ubuntu precise-updates main universe\n" >> /etc/apt/sources.list

#========================
# Miscellaneous packages
# Includes minimal runtime used for executing non GUI Java programs
#========================
RUN apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install \
    ca-certificates \
    openjdk-7-jre-headless \
    unzip \
    wget \
  && rm -rf /var/lib/apt/lists/*

#==========
# GNOME desktop
#==========
RUN apt-get install ubuntu-desktop