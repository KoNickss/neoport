#!/bin/bash
if [[ $1 == 1up ]];
then
	if [[ $(whoami) != root ]];
	then
		echo "This needs to be ran as root"
	fi
	if [[ $(whoami) == root ]];
	then
		rm -rf /tmp/neoport
		git clone https://github.com/konickss/neoport /tmp/neoport
		/tmp/neoport/install u
	fi
fi
if [[ $1 == setup ]];
then
	mkdir ~/.config/nvim
	touch ~/.config/nvim/init.vim
	mkdir ~/.config/nvim/ports
	echo "source ~/.config/nvim/ports/record.vim" >> ~/.config/nvim/init.vim
	echo "source ~/.config/nvim/colors/record.vim" >> ~/.config/nvim/init.vim
	touch ~/.config/nvim/ports/record.vim
	mkdir ~/.config/nvim/colors/
	touch ~/.config/nvim/colors/record.vim
fi
if [[ $1 == install ]];
then
	exname=$(echo $2 | cut -f 2 -d '/')
	echo "==> Cloning git repo"
	git clone https://github.com/$2 ~/.config/nvim/ports/$exname
	cd ~/.config/nvim/ports/$exname
	echo "==> Installing extension"
	echo "==> Registering extension in database"
	echo "set rtp+=~/.config/nvim/ports/$exname" >> ~/.config/nvim/ports/record.vim
	srcname=$(ls ~/.config/nvim/ports/$exname/plugin/ | grep .vim)
	echo "source ~/.config/nvim/ports/$exname/plugin/$srcname" >> ~/.config/nvim/ports/record.vim
	echo "==> Done."
fi
if [[ $1 == update ]];
then
	declare -a plist
	echo "==> Fetching extension list"
	plist=$(ls ~/.config/nvim/ports/)
	plist=${plist/record.vim}
	for extension in $plist
	do
		echo "==> Updating $extension"
		cd ~/.config/nvim/ports/$extension
		git config pull.rebase false
		git pull
		cd ..
	done
fi
if [[ $1 == color ]]
then
	if [[ $2 == install ]];
	then
		echo "==> Creating work directory"
		rm -rf ~/.tmp/neoport/*
		mkdir ~/.tmp
		mkdir ~/.tmp/neoport
		echo "==> Cloning git repo"
		git clone https://github.com/$3 ~/.tmp/neoport/col
		echo "==> Installing color scheme"
		cp ~/.tmp/neoport/col/colors/*.vim ~/.config/nvim/colors/
		ttbi=$(ls ~/.tmp/neoport/col/colors/ | cut -f 1 -d ' ')
		echo
		echo $ttbi
		echo
		neoport color set $ttbi
	fi
	if [[ $2 == set ]];
	then
		if [[ $3 == list ]];
		then
			lst=$(ls ~/.config/nvim/colors/ | sed 's/\.vim *$//')
			lst=${lst/record}
			echo $lst
		fi
		if [[ $3 != list ]];
		then
			echo "color $3" > ~/.config/nvim/colors/record.vim

		fi
	fi

fi
if [[ $1 == --help ]];
then
	echo "neoPort v1.0.3"
	echo "================================================"
	echo "neoPort is an easy to use command-line package"
	echo "manager for NeoVim (not vim). It has support for"
	echo "all extensions on github and all color schemes"
	echo "on github. Make sure that you're using neoPort"
	echo "on a fresh neovim setup as having other package"
	echo "managers can cause conflicts with manually ported"
	echo "color schemes. Extensions don't usually conflict"
	echo "but, once again, I recommend doing this on a fresh"
	echo "neovim install"
	echo "================================================"
	echo "Why did I make neoPort? I was tired of plug-in"
	echo "managers that were clunky, required file editing"
	echo "and couldn't be adapted into bash workflows, no"
	echo "one wants to edit a file and run a vim command to"
	echo "install a plug-in when a simple bash command"
	echo "can do the same."
	echo "================================================"
	echo "Syntax:"
	echo
	echo "Tip: when you see 'author/repo' it reffers to the"
	echo "last part of the github url of the extension, so"
	echo "for https://github.com/konickss/neoport it's"
	echo "'konickss/neoport'."
	echo 
	echo "Installing extensions:"
	echo "neoport install author/repo"
	echo 
	echo "Updating all extensions:"
	echo "neoport update"
	echo
	echo "Installing color scheme"
	echo "neoport color install author/repo"
	echo 
	echo "Listing installed color schemes and applying one:"
	echo "neoport color set list"
	echo "neoport color set colorscheme"
	echo
	echo "Updating neoport:"
	echo "sudo neoport 1up"
	echo 
	echo "TO SET UP NEOPORT FOR A USER, RUN 'neoport setup'"
fi
