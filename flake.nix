{
    description = "Assets Storage for my dotfiles";
    inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    inputs.flake-utils = {
        url = "github:numtide/flake-utils";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = {
        nixpkgs,
        flake-utils,
        ...
        }:
        flake-utils.lib.eachDefaultSystem (
            system: let
                pkgs = import nixpkgs {
                    inherit system;
                    config = {allowUnfree = true;};
                };


            in {
                devShells.default = pkgs.mkShell {
                    packages = with pkgs; [
                        git-lfs
                    ];
                    shellHook = ''
                    '';
                };
            }
        );
}
