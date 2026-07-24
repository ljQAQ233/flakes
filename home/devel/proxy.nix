{
  config,
  lib,
  pkgs,
  ...
}:
let
  proxtConfigPort = 7889;
  toml = pkgs.formats.toml { };
in
{
  config = {
    xdg.configFile = {
      "mihoro/geoip.dat".source = "${pkgs.v2ray-geoip}/share/v2ray/geoip.dat";
      "mihoro/geosite.dat".source = "${pkgs.v2ray-domain-list-community}/share/v2ray/geosite.dat";
      "mihoro/country.mmdb".source = "${pkgs.dbip-country-lite.mmdb}";
    };
    systemd.user.sockets = {
      proxy-httpd = {
        Socket = {
          ListenStream = "${toString proxtConfigPort}";
          Accept = true;
        };
        Install = {
          WantedBy = [ "sockets.target" ];
        };
      };
    };
    systemd.user.services."proxy-httpd@" = {
      Service = {
        ExecStart = "${pkgs.busybox}/bin/httpd -i -h ${config.xdg.configHome}/mihoro";
        StandardInput = "socket";
        StandardOutput = "socket";
      };
    };

    home.activation.copyMihoroConfig =
      let
        prefix = "http://127.0.0.1:${toString proxtConfigPort}";
        mihoroToml = toml.generate "mihoro.toml" {
          remote_config_url = "${prefix}/Configuration.yaml";
          ui = "zashboard";
          mihomo_channel = "stable";
          mihomo_binary_path = "${pkgs.mihomo}/bin/mihomo";
          mihomo_config_root = "~/.config/mihomo";
          user_systemd_root = "~/.config/systemd/user";
          mihoro_user_agent = "mihoro";
          auto_update_interval = 12;
          mihomo_config = {
            port = 7891;
            socks_port = 7892;
            mixed_port = 7890;
            allow_lan = true;
            bind_address = "*";
            mode = "rule";
            log_level = "info";
            ipv6 = true;
            external_controller = "0.0.0.0:9090";
            external_ui = "ui";
            secret = "q";
            geodata_mode = false;
            geo_auto_update = false;
            geo_update_interval = 0;
            geox_url = {
              geoip = "${prefix}/geoip.dat";
              geosite = "${prefix}/geosite.dat";
              mmdb = "${prefix}/country.mmdb";
            };
          };
        };
      in
      lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        if [ ! -e ${config.xdg.configHome}/mihoro.toml ]; then
          $DRY_RUN_CMD cp ${mihoroToml} ${config.xdg.configHome}/mihoro.toml
        fi
      '';
  };
}
