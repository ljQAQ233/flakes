{
  config,
  lib,
  ...
}:
{
  config = {
    programs.zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
        ];
      };
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      loginExtra = ''
        if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
          exec start-hyprland
        fi
      '';
      completionInit = "autoload -U compinit && compinit -C";
      initContent = lib.mkMerge [
        (lib.mkAfter ''
          function proxy {
              export http_proxy="http://127.0.0.1:7897"
              export https_proxy="http://127.0.0.1:7897"
              export all_proxy="socks5://127.0.0.1:7897"
          }
        '')
        (lib.mkAfter "alias n=fastfetch")
        (lib.mkAfter "alias nz='nix-shell --run zsh'")
        (lib.mkAfter "export MANPAGER='nvim +Man\\!'")
      ];
    };
  };
}
