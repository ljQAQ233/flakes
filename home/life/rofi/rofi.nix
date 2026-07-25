{ ... }: {
  config = {
    xdg.configFile."rofi/config.rasi".source = ./config.rasi;
    xdg.configFile."rofi/onedark.rasi".source = ./onedark.rasi;
  };
}
