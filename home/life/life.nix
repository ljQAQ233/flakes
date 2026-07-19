{
  config,
  ...
}:
let
  entries = builtins.readDir ./.;
  filter = type: builtins.filter (n: entries.${n} == type) (builtins.attrNames entries);
  mkSingles = str: map (x: ./. + "/${x}") str;
  mkImports = str: map (x: ./. + "/${x}/${x}.nix") str;
in
{
  imports =
    mkImports (filter "directory")
    ++ builtins.filter (f: baseNameOf f != "life.nix") (mkSingles (filter "regular"));

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
