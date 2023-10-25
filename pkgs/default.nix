{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages = rec {
      astronvim-config = pkgs.callPackage ./astronvim/config.nix {inherit inputs;};
      astronvim = pkgs.callPackage ./astronvim {inherit astronvim-config;};
    };
  };
}
