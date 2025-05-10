{
  programs.nvf.enable = true;
  programs.nvf.enableManpages = true;
  programs.nvf.settings = {
    vim = {
      viAlias = true;
      vimAlias = true;
      theme = {
        enable = true;
        name = "gruvbox";
        style = "dark";
      };

      lsp.enable = true;

      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;

      languages = {
        enableTreesitter = true;

        nix.enable = true;
        rust.enable = true;
        ts.enable = true;
        python.enable = true;
        html.enable = true;
        css.enable = true;
        php.enable = true;
        lua.enable = true;
        markdown.enable = true;
        sql.enable = true;
        nu.enable = true;
        typst.enable = true;
        bash = {
          enable = true;
          extraDiagnostics.enable = true;
          format.enable = true;
        };
        clang.enable = true;
      };
    };
  };
}
