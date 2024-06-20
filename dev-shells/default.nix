{ pkgs }:
{
  clang = pkgs.callPackage ./clang.nix { };
  pwn = pkgs.callPackage ./pwn.nix { };
  python = pkgs.callPackage ./python.nix { };
}
