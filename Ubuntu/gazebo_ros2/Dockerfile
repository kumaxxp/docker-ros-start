# https://github.com/osrf/docker_images
FROM ubuntu:18.04

# add new sudo user
ENV USERNAME jetpack
ENV HOME /home/$USERNAME
RUN useradd -m $USERNAME && \
        echo "$USERNAME:$USERNAME" | chpasswd && \
        usermod --shell /bin/bash $USERNAME && \
        usermod -aG sudo $USERNAME && \
        mkdir /etc/sudoers.d && \
        echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
        chmod 0440 /etc/sudoers.d/$USERNAME && \
        # Replace 1000 with your user/group id
        usermod  --uid 1000 $USERNAME && \
        groupmod --gid 1000 $USERNAME

#FROM amd64/ros:dashing
FROM gazebo:gzserver8
FROM ros:dashing-ros-core-bionic

# install package
RUN yes | unminimize && \
    apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        git \
        gpg \
        gpg-agent \
        gpgconf \
        gpgv \
        less \
        libcanberra-gtk-module \
        libcanberra-gtk3-module \
        libgconf-2-4 \
        libgtk-3-0 \
        libnss3 \
        libx11-xcb1 \
        libxss1 \
        libxtst6 \
        net-tools \
        python3.7 \
        sshpass \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# set locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections


# install ros2 packages
RUN apt-get update && apt-get install -y \
    ros-dashing-ros-base=0.7.3-1* \
    && rm -rf /var/lib/apt/lists/*


# place here your application's setup specifics
CMD [ "gzserver", "my-gazebo-app-args" ]
