let
  pkgs = import <nixpkgs> {};
  nodepkgs = import ./override.nix {
    inherit pkgs;
  };
in
{
  env = pkgs.stdenv.mkDerivation {
    name = "node-env";
    buildInputs = [
      nodepkgs.less
    ];
  };
}
