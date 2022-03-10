#!/bin/sh

dotfiles=$(
	cd $(dirname $0)
	pwd
)

for f in .??*
do
	[[ "$f" == ".git" ]] && continue
	[[ "$f" == ".DS_Store" ]] && continue

	echo $f && ln -snf  $dotfiles/$f ~/$f
done
