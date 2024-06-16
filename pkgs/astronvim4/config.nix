{
  lib,
  pkgs,
  stdenv,
  vimPlugins,
}: let
  lspPackages = with pkgs; [
    alejandra
    black
    clang-tools
    delve
    deno
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
    helm-ls
    iferr
    impl
    isort
    marksman
    nil
    nodePackages.bash-language-server
    nodePackages.prettier
    nodePackages.pyright
    nodejs
    reftools
    richgo
    ruff
    rust-analyzer
    shellcheck
    shfmt
    stylua
    sumneko-lua-language-server
    taplo-lsp
    terraform-ls
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

    passthru.lspPackages = lspPackages;
  }
