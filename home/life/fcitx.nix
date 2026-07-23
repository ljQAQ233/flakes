{ ... }:
{
  config = {
    xdg.dataFile."fcitx5/rime/default.custom.yaml".text = ''
      patch:
        __include: rime_ice_suggestion:/
        schema_list:
          - schema: rime_ice
    '';
  };
}
