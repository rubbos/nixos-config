{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      hello
    ];

    username = "rub";
    homeDirectory = "/home/rub";

    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "23.11";
  };
}
