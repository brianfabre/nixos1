{
  config,
  pkgs,
  ...
}: let
  nvimConfigDir = "${config.home.homeDirectory}/nix-config/home-manager/nvim/nvim";
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink nvimConfigDir;
}
