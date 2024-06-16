{inputs, ...}: {
  perSystem = {
    pkgs,
    self',
    ...
  }: {
    packages = rec {
      astronvim3-config = pkgs.callPackage ./astronvim3/config.nix {inherit inputs;};
      astronvim3 = pkgs.callPackage ./astronvim3 {inherit astronvim3-config;};

      astronvim4-config = pkgs.callPackage ./astronvim4/config.nix {};
      astronvim4 = pkgs.callPackage ./astronvim4 {inherit astronvim4-config;};

      astronvim = astronvim4;
    };

    overlayAttrs = self'.packages;
  };
}
