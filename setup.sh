##!/bin/bash
# Installing Neovim
mkdir ~/.config/nvim/
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
mv ./nvim.appimage ~/.config/nvim/
chmod u+x ~/.config/nvim/nvim.appimage

echo 'alias nvim="~/.config/nvim/nvim.appimage"' >> ~/.zshrc
echo 'alias vim="~/.config/nvim/nvim.appimage"' >> ~/.zshrc
echo 'alias vi="~/.config/nvim/nvim.appimage"' >> ~/.zshrc

echo 'alias nvim="~/.config/nvim/nvim.appimage"' >> ~/.bashrc
echo 'alias vim="~/.config/nvim/nvim.appimage"' >> ~/.bashrc
echo 'alias vi="~/.config/nvim/nvim.appimage"' >> ~/.bashrc


# Vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Save neovim configs
cp init.vim ~/.config/nvim/

# Install plugins
~/.config/nvim/nvim.appimage --headless +PlugInstall +qall
~/.config/nvim/nvim.appimage --headless -c 'CocInstall coc-json coc-tsserver' -c 'qall'

exec zsh
exec bash
