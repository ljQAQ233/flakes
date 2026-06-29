# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://127.0.0.1:7897";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain,mirrors.ustc.edu.cn";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          # catppuccin-fcitx5
          (fcitx5-rime.override {
            rimeDataPkgs = [
              rime-ice
              fcitx5-pinyin-moegirl
              fcitx5-pinyin-zhwiki
            ];
          })
        ];
      };
    };
  };

  services = {
    # configure keymap in x11
    xserver.xkb = {
      layout = "us";
      variant = "";
    };
    # love my eyes :)
    redshift = {
      enable = true;
      temperature = {
        day = 5500;
        night = 3700;
      };
      brightness = {
        day = "1.0";
        night = "0.9";
      };
    };
    geoclue2.enable = true;
  };
  location.provider = "geoclue2";
  nix = {
    settings = {
      substituters = [
        "https://mirrors.ustc.edu.cn/nix-channels/store"
        "https://cache.nixos.org/"
      ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
  programs.nix-ld.enable = true;

  # general editor
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    withPython3 = true;
  };
  # programs.vscode = {
  #   enable = true;
  # };

  # user settings
  users.users.maouai233 = {
    isNormalUser = true;
    description = "qwqwqwq";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];
  };
  programs.zsh.enable = true;
  services.getty.autologinUser = "maouai233";

  # Allow limited unfree softwares
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "fcitx5-pinyin-moegirl"
      "sublime-merge"
      "qq"
      "vscode"
    ];
  environment = {
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    systemPackages = with pkgs; [
      zsh
      zsh-autosuggestions
      zsh-syntax-highlighting
      # neovim
      neovim
      neovide
      tectonic
      ghostscript
      imagemagick
      #
      git
      wget
      atool
      unzip
      gnupg
      gnumake
      cmake
      gcc
      gdb
      rofi
      yazi
      kitty
      clash-verge-rev
    ];
    sessionVariables = {
      # i18n
      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
    };
    shells = with pkgs; [
      bash
      zsh
    ];
  };

  # vm
  virtualisation = {
    containers = {
      enable = true;
      registries = {
        search = [
          "docker.io"
          "quay.io"
        ];
      };
    };
    podman = {
      enable = true;
      dockerCompat = true;
    };
  };

  # gui
  programs.waybar.enable = true;
  programs.hyprland.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-mono
  ];
  fonts.fontconfig.defaultFonts = {
    monospace = [ "JetBrainsMono Nerd Font" ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
