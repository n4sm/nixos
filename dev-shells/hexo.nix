{ pkgs, ... }:
pkgs.mkShell {
  packages = [
    pkgs.hexo-cli
  ];
}
