# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  pkgsUnstable,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "brian";
    homeDirectory = "/home/brian";
  };

  # Add stuff for your user as you see fit:
  programs.neovim.enable = true;
  programs.firefox.enable = true;
  home.packages = 
    (with pkgs; [ 
      lf
      fd
      fzf
      ripgrep
      tealdeer
      yazi

      lazygit

      # wayland
      wl-clipboard
    ])
    ++
    (with pkgsUnstable; [
      mullvad-browser
    ]);

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "brian";
    userEmail = "brian@localhost";
  };

  # Enable Plasma Manager
  programs.plasma = {
    enable = true;

    # Example: set a theme, colors, etc.
    workspace.lookAndFeel = "org.kde.breezedark.desktop";
    # fonts.defaultFamily = "Noto Sans";

    hotkeys.commands."launch-konsole" = {
      name = "Launch Konsole";
      key = "Meta+Return";
      command = "konsole";
    };

    # remove shortcut to use with switch desktop
    shortcuts.plasmashell = {
      "activate task manager entry 1" = "";
      "activate task manager entry 2" = "";
      "activate task manager entry 3" = "";
      "activate task manager entry 4" = "";
      "activate task manager entry 5" = "";
      "activate task manager entry 6" = "";
      "activate task manager entry 7" = "";
      "activate task manager entry 8" = "";
      "activate task manager entry 9" = "";
    };

    shortcuts = {
      kwin = {
	"Switch to Desktop 1" = "Meta+1"; 
        "Switch to Desktop 2" = "Meta+2"; 
        "Switch to Desktop 3" = "Meta+3"; 

        "Window to Desktop 1" = "Meta+!";
        "Window to Desktop 2" = "Meta+@";
        "Window to Desktop 3" = "Meta+#";
      };
    };

    kwin = {
      # System Settings > Window Management > Desktop Effects > ...
      effects = {
        blur = {
          enable = true;
          noiseStrength = 0;
          strength = 6;
        };

        slideBack.enable = true;

        translucency.enable = true;

        wobblyWindows.enable = true;
      };

      # System Settings > Window Management > Virtual Desktops
      virtualDesktops = {
        number = 3;
        rows = 1;
      };
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
