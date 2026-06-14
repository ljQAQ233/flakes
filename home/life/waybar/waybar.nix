{
  ...
}:

{
  config = {
    programs.waybar = {
      enable = true;
    };
    xdg.configFile."waybar/config".source = ./waybar.jsonc;
    xdg.configFile."waybar/style.css".source = ./waybar.css;
  };
}
