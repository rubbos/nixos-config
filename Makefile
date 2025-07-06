# Update home-manager
.PHONY: update u
update:
	home-manager switch --flake .
u: update

# Rebuild NixOS
.PHONY: rebuild r
rebuild:
	sudo nixos-rebuild switch 
r: rebuild

# Clean garbage from NixOS
.PHONY: clean
clean: 
	nix-collect-garbage -d

# Reload Hyprland
.PHONY: reload-hypr 
reload-hypr:
	hyprctl reload

# Update and reload hyprland
.PHONY: update-hypr urh
update-hypr: update reload-hypr
urh: update-hypr

