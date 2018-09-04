#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE" \
		--exclude "Gemfile" \
		--exclude "to_gemfile.rb" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
	source ~/.zshrc;
}

doIt;
unset doIt;
