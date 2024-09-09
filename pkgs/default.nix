{inputs, ...}: {
  perSystem = {
    pkgs,
    self',
    myPkgs,
    ...
  }: {
    packages = rec {
      astronvim4-config = pkgs.callPackage ./astronvim4/config.nix {inherit myPkgs;};
      astronvim4 = pkgs.callPackage ./astronvim4 {inherit astronvim4-config;};

      astronvim = astronvim4;
    };

    overlayAttrs = self'.packages;
  };
}
