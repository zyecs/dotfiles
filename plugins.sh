#!/bin/sh

# Install extra plugins for zsh and vim

# check if .oh-my-zsh exists

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "Not found oh-my-zsh, fetch it from github."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo "oh-my-zsh already exists."
fi

# zsh autosuggestions
echo "Now start installing zsh autosuggestions and zsh syntax highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Done."

# zsh spaceship prompt
echo "Now start installing spaceship prompt"

git clone https://github.com/denysdovhan/spaceship-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt
ln -s ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme

echo "The installation of zsh plugins is finished.\n"

echo "Clean previous usage of vim."

rm -rf .vim*

echo "Install Vundle for plugins"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Copying from pre-configured dot files"
cp ~/dotfiles/zshrc ~/.zshrc
cp ~/dotfiles/vimrc ~/.vimrc
cp ~/dotfiles/tmux.conf ~/.tmux.conf
echo "Copy finished."

echo "WARNING: .zshrc may not be directly used."
echo "So far so good."
