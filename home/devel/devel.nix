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
        nil
        nixd
        stylua
        yq
        jq
        yamlfmt
        nixfmt
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
      ++ (
        let
          myPkgs = import ../../pkgs { inherit pkgs; };
        in
        [
          myPkgs.qemu-custom
        ]
      );
    xdg.configFile."kitty/kitty.conf".source = ./kitty.conf;
  };
}
