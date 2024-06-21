{ pkgs }:
{
  gefpp = pkgs.callPackage ./gefpp { };
  ida-free = pkgs.callPackage ./ida-free { };
}
