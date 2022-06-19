echo -n "Add xmonad (y/n)? "
read answer
if [[ $answer =~ ^[Yy]$ ]]
then
  rm ~/.xmonad/xmonad.hs
  ln -s ~/.dotfiles/config/xmonad.hs ~/.xmonad/xmonad.hs
fi
echo -n "Add xinitrc (y/n)? "
read answer
if [[ $answer =~ ^[Yy]$ ]]
then
  rm ~/.xinitrc
  ln -s ~/.dotfiles/config/xinitrc ~/.xinitrc
fi
echo -n "Add zshrc (y/n)? "
read answer
if [[ $answer =~ ^[Yy]$ ]]
then
  rm ~/.zshrc
  ln -s ~/.dotfiles/.zshrc ~/.zshrc
fi

echo -n "Add alacritty (y/n)? "
read answer
if [[ $answer =~ ^[Yy]$ ]]
then
  rm ~/.config/alacritty/alacritty.yml
  ln -s ~/.dotfiles/config/alacritty.yml ~/.config/alacritty/alacritty.yml
fi

echo -n "Add nvim (y/n)? "
read answer
if [[ $answer =~ ^[Yy]$ ]]
then
  sudo rm -r ~/.config/nvim
  ln -s ~/.dotfiles/config/nvim ~/.config/nvim
fi
echo -n "Add tmux (y/n)? "
read answer
if [[ $answer =~ ^[Yy]$ ]]
then
  rm ~/.tmux.conf
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ln -s ~/.dotfiles/config/.tmux.conf ~/.tmux.conf
fi

