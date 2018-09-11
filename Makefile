DOTFILES = $(PWD)
SCRIPTS = $(DOTFILES)/scripts

basic:: bash zsh git  vim config

bash::
	@ln -fs $(DOTFILES)/Bash/.bashrc $(HOME)/.bashrc
	@ln -fs $(DOTFILES)/Bash/.bash_profile $(HOME)/.bash_profile
	@echo .bashrc and .bash_profile are symlinked.

zsh::
	@ln -fs $(DOTFILES)/Zsh/.zshrc $(HOME)/.zshrc
	@ln -fs $(DOTFILES)/Zsh/.zshenv $(HOME)/.zshenv
	@ln -fs $(DOTFILES)/Zsh/.aliases $(HOME)/.aliases
	@ln -fs $(DOTFILES)/Zsh/.exports $(HOME)/.exports
	@ln -fs $(DOTFILES)/Zsh/.functions $(HOME)/.functions
	@ln -fs $(DOTFILES)/Zsh/.extra $(HOME)/.extra
	@echo .zshrc, .zshenv, .aliases, .exports, and .extra are symlinked.

git::
	@ln -fs $(DOTFILES)/Git/.gitconfig $(HOME)/.gitconfig
	@ln -fs $(DOTFILES)/Git/.gitattributes $(HOME)/.gitattributes
	@ln -fs $(DOTFILES)/Git/.gitignore $(HOME)/.gitignore
	@echo .gitconfig, .gitignore and .gitattributes are symlinked.

vim::
	@ln -fs $(DOTFILES)/Vim/.vimrc	$(HOME)/.vimrc
	@ln -fs $(DOTFILES)/Vim/.gvimrc	$(HOME)/.gvimrc
	@echo Vim is symlinked.

config::
	@ln -fs $(DOTFILES)/Config/.tmux.conf	$(HOME)/.tmux.conf
	@ln -fs $(DOTFILES)/Config/.inputrc	$(HOME)/.inputrc
	@ln -fs $(DOTFILES)/Config/.wgetrc	$(HOME)/.wgetrc
	@ln -fs $(DOTFILES)/Config/.curlrc	$(HOME)/.curlrc
	@ln -fs $(DOTFILES)/Config/.gdbinit	$(HOME)/.gdbinit
	@ln -fs $(DOTFILES)/Config/.screenrc	$(HOME)/.screenrc
	@ln -fs $(DOTFILES)/Config/.clang-format	$(HOME)/.clang-format
	@ln -fs $(DOTFILES)/Config/.editorconfig	$(HOME)/.editorconfig
	@ln -fs $(DOTFILES)/Config/ssh_config	$(HOME)/.ssh/config
	@echo .tmux.conf, .clang-format, .editorconfig, .inputrc, .screenrc, .wgetrc, .curlrc , ssh_config and .gdbinit is symlinked.


.PHONY: basic
