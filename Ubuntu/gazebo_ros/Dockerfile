# https://github.com/osrf/docker_images

#FROM amd64/ros:dashing
FROM gazebo:gzserver8
FROM ros:melodic-ros-base
# install ros packages
RUN apt-get update && apt-get install -y
RUN apt-get install -y ros-melodic-ros-tutorials \
    ros-melodic-common-tutorials \
    && rm -rf /var/lib/apt/lists/


# place here your application's setup specifics
CMD [ "gzserver", "my-gazebo-app-args" ]
