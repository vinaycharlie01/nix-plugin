{
  description = "Collection of dev plugins";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        packages.${system} = {
          gcloudplugin = import ./plugins/gcloud { inherit pkgs; };
          kubectl-instana = import ./plugins/kubectl-instana { inherit pkgs; };
          mytool = import ./plugins/mytool { inherit pkgs; };
        };

        defaultPackage.${system} = self.packages.${system}.mytool;

        devShells.${system}.default = pkgs.mkShell {
          buildInputs = [
            self.packages.${system}.gcloudplugin
            self.packages.${system}.kubectl-instana
            self.packages.${system}.mytool
          ];
        };
      }
    );
}