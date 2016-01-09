{ pkgs ? import <nixpkgs> {} }:
with pkgs; stdenv.mkDerivation {
  name = "cgip";
  version = "0.1.0";
  src = ./.;
  installPhase = ''
    mkdir -p $out/bin
    cp cgip $out/bin
  '';
}
