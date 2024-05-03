{
  description = "astronvim.nix / My personal astronvim configuration";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://numtide.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
    ];
  };

  inputs = {
    # nix packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # nvim
    astro-nvim = {
      url = "github:AstroNvim/AstroNvim/v3.45.3";
      flake = false;
    };

    # flake-parts
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    # utils
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    devour-flake = {
      url = "github:srid/devour-flake";
      flake = false;
    };
    haumea = {
      url = "github:nix-community/haumea/v0.2.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lib-extras = {
      url = "github:aldoborrero/lib-extras";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    flake-parts,
    haumea,
    lib-extras,
    nixpkgs,
    nixpkgs-unstable,
    ...
  }: let
    lib = nixpkgs-unstable.lib.extend (l: _: lib-extras.lib l);
    localInputs = haumea.lib.load {
      src = ./.;
      loader = haumea.lib.loaders.path;
    };
  in
    flake-parts.lib.mkFlake
    {
      inherit inputs;
      specialArgs = {inherit lib localInputs;};
    }
    {
      imports = [
        inputs.devshell.flakeModule
        inputs.flake-parts.flakeModules.easyOverlay
        inputs.treefmt-nix.flakeModule
        localInputs.pkgs.default
      ];

      debug = false;

      systems = ["x86_64-linux"];

      perSystem = {
        config,
        pkgs,
        pkgsUnstable,
        system,
        ...
      }: {
        # nixpkgs
        _module.args = {
          pkgs = lib.nix.mkNixpkgs {
            inherit system;
            inherit (inputs) nixpkgs;
            overlays = [
              (final: _prev: {
                devour-flake = final.callPackage inputs.devour-flake {};
              })
            ];
          };
          pkgsUnstable = lib.nix.mkNixpkgs {
            inherit system;
            nixpkgs = inputs.nixpkgs-unstable;
          };
        };

        # devshell
        devshells.default = {
          name = "astronvim.nix";
          packages = [];
          commands = [
            {
              name = "clean";
              category = "Nix";
              help = "Cleans any result produced by Nix or associated tools";
              command = ''rm -rf repl-result* result* *.qcow2'';
            }

            {
              category = "Nix";
              name = "fmt";
              help = "Format the source tree";
              command = "nix fmt";
            }

            {
              category = "Nix";
              name = "check";
              help = "Check the source tree";
              command = "nix flake check";
            }
          ];
        };

        # formatter
        treefmt.config = {
          flakeFormatter = true;
          flakeCheck = true;
          projectRootFile = "flake.nix";
          programs = {
            alejandra.enable = true;
            deadnix.enable = true;
            deno.enable = true;
            mdformat.enable = true;
            shellcheck.enable = true;
            shfmt.enable = true;
            statix.enable = true;
          };
          settings.formatter = {
            deno.excludes = [
              "*.md"
              "*.html"
            ];
          };
        };

        # checks
        checks = {
          nix-build-all = pkgs.writeShellApplication {
            name = "nix-build-all";
            runtimeInputs = with pkgs; [
              devour-flake
              nix
            ];
            text = ''
              # Make sure that flake.lock is sync
              nix flake lock --no-update-lock-file

              # Do a full nix build (all outputs)
              devour-flake . "$@"
            '';
          };
        };
      };
    };
}
