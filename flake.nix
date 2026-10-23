{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs =
    { nixpkgs, ... }:
    let
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
    in
    {
      devShells.x86_64-linux.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          nodejs
          prisma-engines_7
          prisma_7
          openssl
        ];
        shellHook = ''
          export PRISMA_SCHEMA_ENGINE_BINARY="${pkgs.prisma-engines_7}/bin/schema-engine"
          export PRISMA_QUERY_ENGINE_BINARY="${pkgs.prisma-engines_7}/bin/query-engine"
          export PRISMA_FMT_BINARY="${pkgs.prisma-engines_7}/bin/prisma-fmt"
        '';
      };
    };
}
