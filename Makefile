.PHONY: update
update:
	home-manager switch --flake .

.PHONY: clean
clean: 
	nix-collect-garbage -d

.PHONY: rebuild
rebuild:
	sudo nixos-rebuild switch 
