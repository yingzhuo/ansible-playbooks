#!/usr/bin/env zsh

rm -rf ./omz
rm -rf ./oh-my-zsh.tar.gz
cp -R "$HOME/.oh-my-zsh" ./omz

# shellcheck disable=SC2038
find ./omz \
  -type l -or \
  -iname '.git*' -or \
  -iname 'LICENSE*' -or \
  -iname 'README*' -or \
  -iname 'example*' -or \
  -iname 'SECURITY*' -or \
  -iname 'lantern*' -or \
  -iname '*.md' |
  xargs rm -rf

# shellcheck disable=SC2038
find ./omz/themes \
  -not -iname 'bira.zsh-theme' |
  xargs rm -rf

tar -czf ./oh-my-zsh.tar.gz ./omz/*
