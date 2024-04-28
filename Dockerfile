FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    make \
    curl \
    git \
    zsh \
    sudo \
    neovim \
    && rm -rf /var/lib/apt/lists/*

COPY . /root/dotfiles

RUN make -C /root/dotfiles setup-linux

CMD ["/bin/zsh"]
