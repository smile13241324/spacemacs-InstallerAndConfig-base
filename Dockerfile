# syntax = docker/dockerfile:1.0-experimental
FROM smile13241324/spacemacs-installerandconfig
LABEL Description="This image creates a dockerized version of spacemacs with strong Haskell development support." Vendor="smile13241324@gmail.com" Version="1.0"
COPY . /installRepo-haskell
WORKDIR /installRepo-haskell
RUN ./spacemacsAutoInstall_manjaro.sh

# Persist the home dir again to override the persistence from the base
VOLUME /home/spacemacs

# Keep the remaining volumes, ports and cmd from the base
