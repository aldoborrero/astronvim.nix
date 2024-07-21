{
  writeShellScriptBin,
  astronvim4-config,
  buildEnv,
  vimPlugins,
  neovim,
  nvim-appname ? "astronvim4",
}:
writeShellScriptBin "astronvim4" ''
  set -efu
  unset VIMINIT

  # Parse command line arguments
  NVIM_APPNAME="${nvim-appname}"
  NO_LINK=0
  ARGS=()
  while [[ $# -gt 0 ]]; do
    case $1 in
      --app-name)
        NVIM_APPNAME="$2"
        shift 2
        ;;
      --no-link)
        NO_LINK=1
        shift
        ;;
      *)
        ARGS+=("$1")
        shift
        ;;
    esac
  done

  export PATH=${buildEnv {
    name = "lsp-servers";
    paths = astronvim4-config.lspToolingPkgs;
  }}/bin:$PATH
  export NVIM_APPNAME

  # Ensure XDG folders
  XDG_CONFIG_HOME=''${XDG_CONFIG_HOME:-$HOME/.config}
  XDG_DATA_HOME=''${XDG_DATA_HOME:-$HOME/.local/share}
  mkdir -p "$XDG_CONFIG_HOME" "$XDG_DATA_HOME"
  NVIM_CONFIG="$XDG_CONFIG_HOME/$NVIM_APPNAME"
  NVIM_DATA="$XDG_DATA_HOME/$NVIM_APPNAME"

  # Link or copy custom config based on --no-link option
  if [ $NO_LINK -eq 1 ]; then
    rm -rf "$NVIM_CONFIG"
    cp -R -L ${astronvim4-config} "$NVIM_CONFIG"
    chown -R $(id -u):$(id -g) $NVIM_CONFIG
    chmod -R u=rwX,go=rX "$NVIM_CONFIG"
  else
    ln -sfT ${astronvim4-config} "$NVIM_CONFIG"
  fi

  # Install plugins and necessary tooling
  ${neovim}/bin/nvim --headless -c 'quitall'

  # Link telescope-fzf-native plugin
  if [[ -d $NVIM_DATA/lazy/telescope-fzf-native.nvim ]]; then
    mkdir -p "$NVIM_DATA/lazy/telescope-fzf-native.nvim/build"
    ln -sf "${vimPlugins.telescope-fzf-native-nvim}/build/libfzf.so" "$NVIM_DATA/lazy/telescope-fzf-native.nvim/build/libfzf.so"
  fi

  # Run nvim
  exec ${neovim}/bin/nvim "''${ARGS[@]}"
''
