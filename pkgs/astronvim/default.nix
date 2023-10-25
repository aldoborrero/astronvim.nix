{
  writeShellScriptBin,
  astronvim-config,
  buildEnv,
  vimPlugins,
  neovim,
  nvim-appname ? "nvim-aldo",
}:
writeShellScriptBin "nvim" ''
  set -efu

  unset VIMINIT
  export PATH=${buildEnv {
    name = "lsp-servers";
    paths = astronvim-config.lspPackages;
  }}/bin:$PATH
  export NVIM_APPNAME=${nvim-appname}

  # Ensure XDG folders
  XDG_CONFIG_HOME=''${XDG_CONFIG_HOME:-$HOME/.config}
  XDG_DATA_HOME=''${XDG_DATA_HOME:-$HOME/.local/share}
  mkdir -p "$XDG_CONFIG_HOME" "$XDG_DATA_HOME"

  NVIM_CONFIG="$XDG_CONFIG_HOME/$NVIM_APPNAME"
  NVIM_DATA="$XDG_DATA_HOME/$NVIM_APPNAME"

  # Link custom config and install plugins
  ln -sfT ${astronvim-config} "$NVIM_CONFIG"
  ${neovim}/bin/nvim --headless -c 'quitall'

  if [[ -d $NVIM_DATA/lazy/telescope-fzf-native.nvim ]]; then
    mkdir -p "$NVIM_DATA/lazy/telescope-fzf-native.nvim/build"
    ln -sf "${vimPlugins.telescope-fzf-native-nvim}/build/libfzf.so" "$NVIM_DATA/lazy/telescope-fzf-native.nvim/build/libfzf.so"
  fi

  exec ${neovim}/bin/nvim "$@"
''
