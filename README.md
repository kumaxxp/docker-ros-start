# docker-ros-start

## やりたいこと
Jetson-nanoやUbuntuPCで、他の環境を壊さないようにDockerでROS/ROS2が動く環境を作る。
+ USB接続したカメラやコントローラと接続できる設定にする。
+ 作業したファイルはホスト側の適当なディレクトリに保存する。
+ プロキシ環境でも問題なく実行できるように、プロキシ設定も対応する（願望）。

## 経緯
Jetson-nanoのROSの環境を取りそろえるのが大変だったのですが、@dandelion1124 さんのDockerfileを使わせていただきました。とっても便利でした。

https://github.com/atinfinity/jetson_ros_docker

REALSENSEを動かしたかったので、Dockerファイルに組み込んで動かせるようにしてみました。

その後、Ubuntu16のPCでもROSやgazeboを動かすために（PCの環境を崩さないために）、Dockerfileを作り始め、数が増えてきたのでgithubで管理することにしました。
本来は本家からフォークするべきかと思いますが、ディレクトリ構成が我流でオリジナルとは別物になってしまってますので、独立したリポジトリにしています。

# 構成
## \Jetson-nano
+ ros-for-realsense:REALSENSEのドライバとパッケージを取り込んだ

## \Ubuntu
+ gazebo:gazeboを動かします。GUI表示され、保存ファイルはホスト側に格納されます。