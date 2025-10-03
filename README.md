<<<<<<< HEAD
# docker_for_LaTeX
this is docker file to create docker environment for LaTeX
=======
# LaTeX Docker Environment

LaTeX文書作成のためのDocker環境です。日本語文書の作成に対応しており、物理学関連のパッケージも含まれています。

## 特徴

- Ubuntu 22.04ベース
- LuaLaTeX対応
- 日本語文書作成対応
- 物理学パッケージ（physics等）対応
- 軽量で高速な環境構築

## 含まれるパッケージ

- `texlive-luatex` - LuaLaTeX エンジン
- `texlive-latex-recommended` - 推奨LaTeXパッケージ
- `texlive-latex-extra` - 追加LaTeXパッケージ
- `texlive-fonts-recommended` - 推奨フォント
- `texlive-base` - 基本パッケージ
- `texlive-binaries` - LaTeX実行ファイル
- `texlive-lang-japanese` - 日本語対応
- `texlive-science` - 物理学・数学パッケージ

## セットアップ手順

### 0. dockerをsudoに入れる
```
sudo groupadd docker
sudo gpasswd -a $USER docker
sudo systemctl restart docker
exit
```

### 1. リポジトリのクローン

```bash
# ホームディレクトリにdockerフォルダを作成
mkdir -p ~/docker

# リポジトリをクローン
cd ~/docker
git clone https://github.com/ushidakyotaro/docker_for_LaTeX.git latex_docker
cd latex_docker
```

### 2. Dockerイメージのビルド

```bash
# Docker環境を構築
docker build -t latex-env .
```

### 3. 動作確認

```bash
# コンテナの起動確認
docker run --rm latex-env lualatex --version
```

正常に動作すれば、LuaLaTeXのバージョン情報が表示されます。

### 4. LaTeX作業用のディレクトリを作成
```bash
# ホームディレクトリにtexフォルダを作成
mkdir -p ~/tex
```

### 5. （docker環境内で）ライブラリのinstall
```bash
apt update
apt install make
```


## 使用方法

### 1. Docker環境の起動

```bash
cd ~/docker/latex_docker
./start_container.sh
```

### 2. コンテナへの接続

```bash
./attach_to_container.sh
```

### 3. 環境の停止

```bash
./stop_container.sh
```

## ファイル構成

```
~/docker/latex_docker/
├── Dockerfile              # Docker設定ファイル
├── preamble.tex            # LaTeX プリアンブル設定
├── start_container.sh      # コンテナ起動スクリプト
├── attach_to_container.sh  # コンテナ接続スクリプト
├── stop_container.sh       # コンテナ停止スクリプト
└── README.md              # このファイル
```

### 1. LaTeX文書の配置
```bash
# ホームディレクトリのtexフォルダに文書を配置
cd ~/tex
nano my_document.tex
```


### 3. 生成されたPDFの確認
```bash
# ホストマシンの~/texディレクトリで確認
ls ~/tex/*.pdf
```

## プリアンブル

`preamble.tex`には共通のLaTeX設定が含まれています。このファイルはコンテナ内の`/srv/preamble.tex`に配置されます。

## 実際のLaTeX文書の管理

このリポジトリはDocker環境の構築のみを目的としています。実際のLaTeX文書の作成・管理は別のリポジトリで行うことを想定しています。

コンテナの使用時は、適切なボリュームマウントを設定してLaTeX文書にアクセスしてください。

## 要件

- Docker（インストール済みであること）
- Git
- 十分なディスク容量（Docker imageは約1-2GB）

## インストール前の確認

Dockerが正しくインストールされているか確認してください：

```bash
docker --version
docker run hello-world
```
## dockerをvscodeで開く方法
https://qiita.com/tsuyotobi26/items/9d48fa676f4d55170b5e

## トラブルシューティング

### 日本語フォントが表示されない場合

コンテナ内で以下を確認してください：

```bash
fc-list :lang=ja
```

### パッケージが見つからない場合

必要に応じて追加のパッケージをDockerfileに追加してリビルドしてください。
>>>>>>> master
