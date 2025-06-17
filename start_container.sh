# !/bin/bash

# コンテナが既に存在するかチェック
if [ "$(docker ps -aq -f name=latex-container)" ]; then
    echo "既存のコンテナを起動中..."
    docker start latex-container

else
    echo "新しいコンテナを作成中..."
    # ~/texディレクトリがなければ作成
    mkdir -p ~/tex
    
    # 新しいコンテナを作成してそのまま接続
    docker run -it --name latex-container \
      -v ~/tex:/srv \
      -w /srv \
      latex-env \
      bash
fi

echo "コンテナに接続中..."
docker exec -it latex-container bash