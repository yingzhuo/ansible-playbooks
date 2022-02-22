#!/usr/bin/env zsh

rm -rf ./omz
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
