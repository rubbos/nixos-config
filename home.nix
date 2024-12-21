{ config, lib, pkgs, ... }:

let
  dotfilesDir = "${config.home.homeDirectory}/dotfiles";
in  
{  
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "24.11";
    
    # Sourcing dotfiles for nvim
    home.file."${config.home.homeDirectory}/.config/nvim".source = "${dotfilesDir}/nvim";

    home.packages = with pkgs; [
	home-manager
	vim
	kitty
	wezterm
	neovim
	git
	lazygit
	neofetch
	wget
	wofi
	waybar
	hyprpaper
	font-awesome
	protonup
	librewolf
	gnumake
	ripgrep
	fd
	fzf
	stow
    ];

    # User settings
    username = "rub";
    homeDirectory = "/home/rub";
}
