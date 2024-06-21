{ pkgs, packages, ... }:
let
  pythonEnv = pkgs.python310.withPackages (ps: [
    ps.pwntools
    ps.ipython
    ps.sympy
    ps.numpy
  ]);
in pkgs.mkShell {
  packages = [
    pythonEnv
    pkgs.python310
  
    pkgs.patchelf
    pkgs.one_gadget
    pkgs.pwndbg
    pkgs.pwninit 
    pkgs.gef
    packages."x86_64-linux".gefpp
  ];
}
