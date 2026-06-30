{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services.kd;
in
{
  options.services.kd = {
    enable = lib.mkEnableOption "kd dictionary with daemon";
    package = lib.mkPackageOption pkgs "kd" { };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ cfg.package ];

    systemd.user.services.kd-server = {
      Unit = {
        Description = "kd dictionary daemon";
        After = [ "network-online.target" ];
      };
      Service = {
        Type = "simple";
        ExecStart = "${lib.getExe cfg.package} --server --log-to-stream";
        Restart = "always";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}
