# default recipe to display help information
default:
  @just --list

rebuild-pre:
  git add *.nix

rebuild: rebuild-pre
  sudo nixos-rebuild switch --flake ~/configuration

rebuild-trace: rebuild-pre
  sudo nixos-rebuild switch --flake ~/configuration --show-trace

update:
  nix flake update

rebuild-update: update && rebuild

