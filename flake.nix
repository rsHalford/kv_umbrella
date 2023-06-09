{
  description = "KV: Introduction to Mix";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in
        with pkgs; {
          devShells.default = mkShell {
            buildInputs = [
              elixir
              elixir-ls
              inetutils
            ];

            shellHook = ''
              ${elixir}/bin/mix --version
              ${elixir}/bin/iex --version
            '';
          };
        }
    );
}
