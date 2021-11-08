#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# autostart tbsm after login on first two VTs
[[ $XDG_VTNR -le 2 ]] && tbsm
