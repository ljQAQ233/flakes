{
  pkgs,
  lib,
  ...
}:
{
  config = {
    programs.yazi = {
      enable = true;
      plugins = {
        inherit (pkgs.yaziPlugins) full-border;
      };
      flavors = {
        inherit (pkgs.yaziPlugins) kanagawa;
      };
      initLua = ./init.lua;
      theme = lib.importTOML ./theme.toml;
    };
  };
}
