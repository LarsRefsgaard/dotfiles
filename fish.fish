#!/usr/bin/env fish
set DOTFILES_ROOT (pwd -P)

function info
	echo [(set_color --bold) ' .. ' (set_color normal)] $argv
end

function user
	echo [(set_color --bold) ' ?? ' (set_color normal)] $argv
end

function success
	echo [(set_color --bold green) ' OK ' (set_color normal)] $argv
end

function abort
	echo [(set_color --bold yellow) ABRT (set_color normal)] $argv
	exit 1
end

curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher && fisher update
	and success 'fisher'
	or abort 'fisher'

yes | fish_config theme save "Catppuccin Macchiato"
	and success 'colorscheme'
	or abort 'colorscheme'

if ! grep (command -v fish) /etc/shells
	command -v fish | sudo tee -a /etc/shells
		and success 'added fish to /etc/shells'
		or abort 'setup /etc/shells'
	echo
end


test (which fish) = $SHELL
	and success 'dotfiles installed/updated!'
	and exit 0

chsh -s (which fish)
	and success set (fish --version) as the default shell
	or abort 'set fish as default shell'
