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

## 使用方法

### 1. Docker環境の起動

```bash
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
├── Dockerfile              # Docker設定ファイル
├── preamble.tex            # LaTeX プリアンブル設定
├── start_container.sh      # コンテナ起動スクリプト
├── attach_to_container.sh  # コンテナ接続スクリプト
└── stop_container.sh       # コンテナ停止スクリプト
```

## LaTeX文書の作成例

コンテナ内で以下のコマンドでPDFを生成できます：

```bash
# LuaLaTeXでコンパイル
lualatex your_document.tex

# 日本語文書の場合
lualatex -interaction=nonstopmode your_japanese_document.tex
```

## プリアンブル

`preamble.tex`には共通の設定が含まれています。LaTeX文書で以下のように読み込んで使用してください：

```latex
\input{/srv/preamble.tex}
```

## 要件

- Docker
- Docker Compose（オプション）

## トラブルシューティング

### 日本語フォントが表示されない場合

コンテナ内で以下を確認してください：

```bash
fc-list :lang=ja
```

### パッケージが見つからない場合

必要に応じて追加のパッケージをDockerfileに追加してリビルドしてください。


