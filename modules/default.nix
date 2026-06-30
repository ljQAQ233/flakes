let
  scan =
    dir:
    let
      entries = builtins.readDir dir;
      nixFiles = builtins.filter (n: entries.${n} == "regular" && builtins.match ".*\\.nix" n != null) (
        builtins.attrNames entries
      );
      subDirs = builtins.filter (n: entries.${n} == "directory") (builtins.attrNames entries);
    in
    map (f: dir + "/${f}") nixFiles ++ builtins.concatMap (d: scan (dir + "/${d}")) subDirs;
in
builtins.filter (p: baseNameOf p != "default.nix") (scan ./.)
