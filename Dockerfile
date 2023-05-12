FROM ubuntu

RUN apt-get update && apt-get install -y \
    make \
    curl \
    git \
    zsh \
    sudo \
    neovim

COPY . /root/dotfiles

RUN make -C /root/dotfiles build-linux

CMD ["/bin/zsh"]
