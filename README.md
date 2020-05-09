# docker-ros-start

## やりたいこと
Jetson-nanoやUbuntuPCで、他の環境を壊さないようにDockerでROS/ROS2が動く環境を作る。
+ USB接続したカメラやコントローラと接続できる設定にする。
+ 作業したファイルはホスト側の適当なディレクトリに保存する。
+ プロキシ環境でも問題なく実行できるように、プロキシ設定も対応する（願望）。

## 事前準備
dockerとdocker-composeを以下のコマンドを実行してインストールしておく

```
curl https://get.docker.com | sh
sudo usermod -aG docker $USER
sudo systemctl start docker
sudo systemctl enable docker
sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

## 経緯
Jetson-nanoのROSの環境を取りそろえるのが大変だったのですが、@dandelion1124 さんのDockerfileを使わせていただきました。とっても便利でした。

https://github.com/atinfinity/jetson_ros_docker

REALSENSEを動かしたかったので、Dockerファイルに組み込んで動かせるようにしてみました。

その後、Ubuntu16のPCでもROSやgazeboを動かすために（PCの環境を崩さないために）、Dockerfileを作り始め、数が増えてきたのでgithubで管理することにしました。
本来は本家からフォークするべきかと思いますが、ディレクトリ構成が我流でオリジナルとは別物になってしまってますので、独立したリポジトリにしています。

## 注意点
起動やBuildなどがcomposeを使わずにスクリプトで書いています。

# 構成
## \Jetson-nano
+ ros-for-realsense:REALSENSEのドライバとパッケージを取り込んだ

## \Ubuntu
+ gazebo:gazeboを動かします。GUI表示され、保存ファイルはホスト側に格納されます。
+ NetworkX:python3でNetworkXやPandas,numpyを動かします。よく使うものを入れました

# コマンドのメモ

```bush:ビルド
docker-compose up -d --build
```

```bush:コンテナへ接続
docker-compose exec python3 bash
```

```bush:インストールしたライブラリの確認
python -m pip list
```

このページを参考にさせていただきました。
[dockerで簡易にpython3の環境を作ってみる](https://qiita.com/reflet/items/4b3f91661a54ec70a7dc)
