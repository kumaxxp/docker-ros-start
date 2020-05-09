# https://github.com/osrf/docker_images

#FROM amd64/ros:dashing
FROM gazebo:gzserver8
FROM ros:dashing-ros-core-bionic
# install ros2 packages
RUN apt-get update && apt-get install -y \
    ros-dashing-ros-base=0.7.3-1* \
    && rm -rf /var/lib/apt/lists/*


# place here your application's setup specifics
CMD [ "gzserver", "my-gazebo-app-args" ]
