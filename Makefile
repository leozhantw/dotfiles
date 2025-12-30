init:
	brew install starship eza bat zsh-autosuggestions zsh-syntax-highlighting fnm
	make link
link:
	ln -fs `pwd`/bash_profile ~/.bash_profile
	ln -fs `pwd`/gitconfig ~/.gitconfig
	ln -fs `pwd`/gitignore ~/.gitignore
	ln -fs `pwd`/vim ~/.vim
	ln -fs `pwd`/vimrc ~/.vimrc
	ln -fs `pwd`/zshrc ~/.zshrc
	mkdir -p ~/.config/ghostty
	ln -fs `pwd`/ghostty/config ~/.config/ghostty/config
	ln -fs `pwd`/starship/starship.toml ~/.config/starship.toml
sync:
	git pull
	git push
