{
  description = "Flake con solo Node.js (LTS)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.nodejs_20
          ];
          shellHook = ''
            echo "🟢 Entorno con Node.js LTS listo."
            node --version
            npm --version
          '';
        };
      }
    );
}
