{ pkgs
, ...
}:
let
  tex = pkgs.texliveSmall.withPackages (ps: with ps; [
    fontspec
    polyglossia
    amsmath
    hyphen-russian
    standalone
    luatex85
    pgfplots
    cancel
    lualatex-math
    enumitem
  ]);
in
{
  home.packages = [
    # pkgs.texlive.combined.scheme-full
    tex
    pkgs.ghostscript
    pkgs.pdf2svg
  ];
}
