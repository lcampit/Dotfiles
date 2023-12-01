local path=$(pwd)
git clone https://github.com/tmux/tmux.git $HOME/tmux
cd tmux
sh autogen.sh
./configure && make

mkdir -p ~/.config/tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
cd path
