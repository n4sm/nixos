{
  stdenv,
  fetchFromGitHub,
  pkgs,
  python3,
  lib,
}:
let
  vmlinux-to-elf = pkgs.python3Packages.callPackage (import ./vmlinux-to-elf.nix) {};
in stdenv.mkDerivation {
  pname = "gefpp";
  version = "dev-unstable";

  src = fetchFromGitHub {
    owner = "bata24";
    repo = "gef";
    rev = "691d88b4d32a9e25429ab8a8514358a5124964e1";
    sha256 = "sha256-z2HD0sXAOZCXbl2KUQcS4urZbMh2SAMoLDWTSDfpnE8=";
  };

  buildInputs = [
    pkgs.gdb
    pkgs.python3
    pkgs.one_gadget
    vmlinux-to-elf
    pkgs.makeWrapper
  ];

  installPhase = ''
	mkdir -vp $out/src/
	cp $src/gef.py $out/src/

	mkdir -vp $out/bin
	echo -ne "#!/bin/bash\n${pkgs.gdb}/bin/gdb -q -x $out/src/gef.py" > $out/bin/gefpp
	chmod +x $out/bin/gefpp	
	'';

  dontbuild = true;
}
