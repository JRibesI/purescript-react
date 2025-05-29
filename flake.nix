{
  description = "Frontend con PureScript + React Basic + Node 20";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        nodejs = pkgs.nodejs_20;
        nodePackages = pkgs.nodePackages;

        devShell = pkgs.mkShell {
          buildInputs = [
            nodejs
          ];

          shellHook = ''
            echo "🟢 Entorno PureScript + React listo"
            echo " - Node: ${nodejs.version}"
            echo " - Usa 'npm install' para instalar dependencias"
            echo " - Usa 'npm run start' para levantar el servidor Parcel"
          '';
        };
      in {
        devShells.default = devShell;
      }
    );
}
