{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
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
    ];

    username = "rub";
    homeDirectory = "/home/rub";

    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "24.11";
  };
}
