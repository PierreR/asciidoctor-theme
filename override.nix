{pkgs ? import <nixpkgs> {
  inherit system;
}, system ? builtins.currentSystem}:

let
  nodePackages = import ./_build/default.nix {
    inherit pkgs system;
  };
in
nodePackages // {
  clean-css-cli = nodePackages.clean-css-cli.override (oldAttrs: {
    dontNpmInstall = true;
  });
}
