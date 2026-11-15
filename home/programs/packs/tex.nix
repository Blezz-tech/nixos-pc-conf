# LaTeX и работа с PDF. texliveSmall с 10 нужными пакетами вместо scheme-full
# на несколько гигабайт; чего не хватает — добавляется в список ниже.
{ pkgs, ... }:
let
  tex = pkgs.texliveSmall.withPackages (
    ps: with ps; [
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
    ]
  );
in
{
  home.packages = [
    tex
    pkgs.ghostscript # ps/pdf -> pdf
    pkgs.pdf2svg
    pkgs.poppler-utils # pdfinfo, pdftotext, pdftoppm
    pkgs.pdftk
    pkgs.mupdf
  ];
}
