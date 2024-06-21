{ pkgs, packages, }:
{
  clang = pkgs.callPackage ./clang.nix { };
  pwn = pkgs.callPackage ./pwn.nix { pkgs = pkgs; packages = packages; };
  python = pkgs.callPackage ./python.nix { };
}
