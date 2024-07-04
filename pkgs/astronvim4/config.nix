{
  lib,
  pkgs,
  stdenv,
  vimPlugins,
}: let
  lspToolingPkgs = with pkgs; [
    # C
    clang-tools

    # golang
    delve
    ginkgo
    go
    gofumpt
    golangci-lint
    golines
    gomodifytags
    gopls
    gotests
    gotools
    govulncheck
    iferr
    impl
    isort
    richgo

    # Helm
    helm-ls

    # Lua
    stylua
    lua-language-server

    # Markdown
    marksman

    # Nix
    alejandra
    nil

    # NodeJS
    deno
    nodePackages.prettier
    nodejs

    # Python
    black
    nodePackages.pyright
    reftools
    ruff

    # Rust
    rust-analyzer
    rustfmt

    # Shell
    nodePackages.bash-language-server
    shellcheck
    shfmt

    # TOML
    taplo-lsp

    # Terraform
    terraform-ls
    tflint

    # YAML
    yaml-language-server
  ];
in
  stdenv.mkDerivation {
    name = "astronvim4-config";

    phases = "installPhase";

    installPhase = ''
      # create out dir
      mkdir -p $out/parser

      # copy the astronvim config
      cp -rs ${./config}/. $out

      # copy all grammars
      ${lib.concatMapStringsSep "\n" (grammar: ''
          ln -s $(readlink -f ${grammar}/parser/*.so) $out/parser/${lib.last (builtins.split "-" grammar.name)}.so
        '')
        vimPlugins.nvim-treesitter.withAllGrammars.dependencies}
    '';

    passthru.lspToolingPkgs = lspToolingPkgs;
  }
