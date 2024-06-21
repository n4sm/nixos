{ lib
, stdenv
, buildPythonPackage
, fetchFromGitHub
}:

buildPythonPackage rec {
  pname = "vmlinux-to-elf";
  version = "fa5c9-master";

  doCheck = false;

  # https://github.com/marin-m/vmlinux-to-elf
  src = fetchFromGitHub {
    owner = "marin-m";
    repo = "vmlinux-to-elf";
    rev = "fa5c9305ae1c4bbcd2debabb810e7613def690a7";
    sha256 = "sha256-/q4pZAam96OL6rMDGJcxBGD02Oo8rDpKoOcnydFUioo=";
  };
}

