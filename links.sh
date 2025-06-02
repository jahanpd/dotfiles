# echo -n "Add xmonad (y/n)? "
# read answer
# if [[ $answer =~ ^[Yy]$ ]]
# then
#   rm -r ~/.config/xmonad
#   ln -s ~/.dotfiles/xmonad ~/.config/xmonad
# fi
# echo -n "Add xinitrc (y/n)? "
# read answer
# if [[ $answer =~ ^[Yy]$ ]]
# then
#   rm ~/.xinitrc
#   ln -s ~/.dotfiles/config/xinitrc ~/.xinitrc
# fi
# echo -n "Add zshrc (y/n)? "
# read answer
# if [[ $answer =~ ^[Yy]$ ]]
# then
#   rm ~/.zshrc
#   ln -s ~/.dotfiles/.zshrc ~/.zshrc
# fi

echo -n "Add alacritty (y/n)? "
read answer
if [[ $answer =~ ^[Yy]$ ]]
then
  rm -r ~/.config/alacritty
  ln -s ~/.dotfiles/alacritty ~/.config/alacritty
fi

echo -n "Add kitty (y/n)? "
read answer
if [[ $answer =~ ^[Yy]$ ]]
then
  rm -r ~/.config/kitty
  ln -s ~/.dotfiles/kitty ~/.config/kitty
fi

echo -n "Add nvim (y/n)? "
read answer
if [[ $answer =~ ^[Yy]$ ]]
then
  sudo rm -r ~/.config/nvim
  ln -s ~/.dotfiles/nvim ~/.config/nvim
fi

echo -n "Add hypr (y/n)? "
read answer
if [[ $answer =~ ^[Yy]$ ]]
then
  sudo rm -r ~/.config/hypr
  ln -s ~/.dotfiles/hypr ~/.config/hypr
fi

echo -n "Add waybar (y/n)? "
read answer
if [[ $answer =~ ^[Yy]$ ]]
then
  sudo rm -r ~/.config/waybar
  ln -s ~/.dotfiles/waybar ~/.config/waybar
fi

echo -n "Add rofi (y/n)? "
read answer
if [[ $answer =~ ^[Yy]$ ]]
then
  sudo rm -r ~/.config/rofi
  ln -s ~/.dotfiles/rofi ~/.config/rofi
fi

# echo -n "Add tmux (y/n)? "
# read answer
# if [[ $answer =~ ^[Yy]$ ]]
# then
#   rm ~/.tmux.conf
#   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# 	mkdir -p ~/.config/tmux/plugins/catppuccin
#   git clone -b v2.1.1 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
#   ln -s ~/.dotfiles/config/.tmux.conf ~/.tmux.conf
# fi

