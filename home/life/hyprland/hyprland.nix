{
  pkgs,
  ...
}:
{
  config = {
    home.packages = with pkgs; [
      catppuccin-cursors
    ];
    home.pointerCursor = {
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
      size = 24;
    };
    xdg.configFile."hypr/hyprland.conf".source = ./hyprland.conf;
  };
}
