{
  config,
  pkgs,
  ...
}:
let
  USER = "maouai233";
  HOME = "/home/${USER}";
in
{
  home.username = USER;
  home.homeDirectory = HOME;

  # Dir configurations
  # Check the result by `$ xdg-user-dir DESKTOP`
  xdg.userDirs =
    let
      SYS = "${HOME}/sys";
    in
    {
      enable = true;
      package = pkgs.xdg-user-dirs;
      createDirectories = true;
      setSessionVariables = true;
      desktop = "${SYS}/desktop";
      documents = "${SYS}/documents";
      download = "${SYS}/download";
      music = "${SYS}/music";
      pictures = "${SYS}/pictures";
      videos = "${SYS}/videos";
      publicShare = "${SYS}/public";
      templates = "${SYS}/templates";
      extraConfig = {
        MISC = "${SYS}/misc";
      };
    };
  home.sessionVariables = {
    WALLPAPERS = config.xdg.userDirs.pictures + "/wallpaper";
  };

  imports = [
    ./zsh.nix
    ./life/life.nix
    ./devel/agent.nix
    ./devel/devel.nix
  ];

  home.packages = with pkgs; [
    tree
    htop
    awww
    imv
    go-musicfox
    flameshot
    qq
    zip
    ffmpeg
    wf-recorder
  ];

  programs.obs-studio = {
    enable = true;
    plugins = [ ];
    package = pkgs.obs-studio;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
