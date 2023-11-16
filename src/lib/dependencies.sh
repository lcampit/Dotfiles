install_dependencies() {
	echo "Installing common dependencies and libraries"
	sudo apt-get install libssl-dev libffi-dev libncurses5-dev zlib1g zlib1g-dev libreadline-dev libbz2-dev libsqlite3-dev make gcc unzip libstdc++6 g++ libyaml-dev librust-alsa-sys-dev libxcb-xfixes0-dev libxcb-shape0-dev gzip -y
	echo "Done"
}
