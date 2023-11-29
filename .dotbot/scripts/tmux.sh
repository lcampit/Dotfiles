local path=$(pwd)
git clone https://github.com/tmux/tmux.git $HOME/tmux
cd tmux
sh autogen.sh
./configure && make
cd path
