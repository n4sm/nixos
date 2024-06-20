{ pkgs, ... }:
let
  pythonEnv = pkgs.python310.withPackages (ps: [
    ps.pwntools
    ps.ipython
    ps.sympy
    ps.numpy
  ]);
in pkgs.mkShell {
  packages = with pkgs; [
    pythonEnv
    python310
  
    patchelf
    one_gadget
    pwndbg
    pwninit 
    gef
  ];
}
