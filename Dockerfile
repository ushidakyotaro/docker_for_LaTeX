FROM ubuntu:22.04
# 対話的なセットアプ系を弾く
ENV DEBIAN_FRONTEND=noninteractive
# 作業用ディレクトリ。好きに設定する
WORKDIR /srv
RUN apt update && apt install -y \
    texlive-luatex \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-base \
    texlive-binaries \
    texlive-lang-japanese \
    #日本語フォント
    fonts-ipaexfont-mincho \
    fonts-ipaexfont-gothic \
    texlive-lang-cjk \
    #make用
    make \
    #physics用
    texlive-science \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./preamble.tex /srv/preamble.tex
CMD ["bash"]
