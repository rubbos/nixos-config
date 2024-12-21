{ config, lib, pkgs, ... }:

let
  dotfilesDir = "${config.home.homeDirectory}/dotfiles";
in  
{  
    #Sourcing dotfiles for nvim
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

    username = "rub";
    homeDirectory = "/home/rub";

    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "24.11";
}
