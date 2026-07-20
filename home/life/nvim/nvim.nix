{ config, flakeDir, ... }: {
  config = {
    xdg.configFile."nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/home/life/nvim/nvim";
    };
  };
}
