#!/usr/bin/env bash

#Creates symlink to files inside dotfiles-repo
#Use -sfn instead of -s to overwrite existing dotfiles
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.zshrc ~/.zshrc 

#Checks if plug.vim is installed, if not: install it
install_plugvim () {

if [[ ! -d ~/.local/nvim/site/autoload/plug.vim ]]; then
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
}

create_initvim_in_config () {

	if [[ ! -d ~/.config ]]; then
		mkdir .config
		cd .config
		mkdir nvim
		cat > init.vim <<EOF
			set runtimepath^=~/.vim runtimepath+=~/.vim/after
			let &packpath=&runtimepath
			source ~/.vimrc
EOF
	fi
}

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d ~/.oh-my-zsh ]] || [[ ! -d ~/oh-my-zsh ]]; then
		cd && git clone http://github.com/robbyrussell/oh-my-zsh.git
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        if [[ -f /etc/redhat-release ]]; then
            sudo yum install zsh
            install_zsh
        fi
        if [[ -f /etc/debian_version ]]; then
            sudo apt-get install zsh
            install_zsh
        fi
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

install_zsh
install_plugvim

