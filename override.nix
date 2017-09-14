{pkgs ? import <nixpkgs> {
  inherit system;
}, system ? builtins.currentSystem}:

let
  nodePackages = import ./default.nix {
    inherit pkgs system;
  };
in
nodePackages // {
  clean-css-cli = nodePackages.clean-css-cli.override (oldAttrs: {
    dontNpmInstall = true;
  });
}
