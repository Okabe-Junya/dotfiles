FROM sickcodes/docker-osx:ventura

COPY . ~/.dotfiles

CMD [ "echo "$SHELL" ]
