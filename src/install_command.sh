install_tools() {
	tools=''
	eval "tools=(${args[tool]})"
	dep=${args[--dep]}
	if [ "$dep" ]; then
		install_dependencies
	fi
	for tool in "${tools[@]}"; do
		echo "Installing $tool"
		install_$tool
		echo "Done"
	done
	echo "Configuration(s) installed successfully"
}

install_tools
