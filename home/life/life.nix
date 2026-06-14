{
  config,
  ...
}:
let
  mkImports = str: map (x: ./. + "/${x}/${x}.nix") str;
in
{
  imports = mkImports [
    "fetch"
    "waybar"
    "hyprland"
  ];

  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}.mozilla/firefox";
    policies = {
      DisplayMenuBar = "never";
      ExtensionSettings = {
        "firefox-compact-dark@mozilla.org" = {
          installation_mode = "force_installed";
        };
      };
    };
    profiles.default.settings = {
      "sidebar.verticalTabs" = true;
      "browser.tabs.tabmanager.enabled" = false;
    };
  };
}
