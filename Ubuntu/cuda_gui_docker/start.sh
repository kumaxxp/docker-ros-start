XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run --gpus all --privileged --rm -it \
           --volume=$XSOCK:$XSOCK:rw \
           --volume=$XAUTH:$XAUTH:rw \
           --volume=$HOME:$HOME \
           --shm-size=1gb \
           --env="XAUTHORITY=${XAUTH}" \
           --env="DISPLAY=${DISPLAY}" \
           --env=TERM=xterm-256color \
           --env=QT_X11_NO_MITSHM=1 \
           --net=host \
           -u "cuda10"  \
           ros2_gpu \
           bash

# GUIが正常に動作することを確認した
# xeyes を実行するために、この環境にインストール
# sudo apt update
# sudo apt install x11-apps
# xeyes
# で、画面に表示されることを確認した。

# sudo apt update
# sudo apt install python3.7
# sudo apt install python3-pip


# python -m pip install numpy
# python -m pip install pandas
# python -m pip install matplotlib
# python -m pip install networkx
# python -m pip install pyyaml
# python -m pip install xlsxwriter
# python -m pip install tornado

# sudo apt install locales
# sudo locale-gen en_US.UTF-8
# export LC_ALL=en_US.UTF-8
