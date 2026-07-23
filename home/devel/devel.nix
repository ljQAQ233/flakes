{
  pkgs,
  ...
}:
{
  config = {
    home.packages =
      with pkgs;
      [
        # lsp / formatter
        ripgrep
        fd
        tree-sitter
        lua-language-server
        clang-tools
        rustfmt
        rust-analyzer
        nixd
        stylua
        yq
        jq
        yamlfmt
        nixfmt
        prettier
        # env
        bun
        nodejs
        python3Packages.python
        python3Packages.ipython
        rustc
        cargo
        clippy
        # editor
        vscode
        zed-editor
        sublime-merge
        # manual pages
        man-pages
        man-pages-posix
        # utils
        gh
        axel
      ]
      ++ [
        qemu-custom
      ];
    xdg.configFile."kitty/kitty.conf".source = ./kitty.conf;
  };
}
