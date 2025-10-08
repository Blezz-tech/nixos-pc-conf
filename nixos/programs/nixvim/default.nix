{ pkgs
, ...
}:
{

  enable = true;
  viAlias = true;
  vimAlias = true;
  extraPackages = with pkgs; [
    ripgrep
    lazygit
    fzf
    fd
  ];

  imports = [
    ./plugins
  ];

  # programs.nixvim = {

  #   colorschemes.vscode.enable = true;

  #   plugins = {
  #     # lightline.enable = true;
  #     barbar.enable = true;
  #     gitsigns.enable = true;
  #     nvim-autopairs.enable = true;
  #     colorizer.enable = true;
  #     fzf-lua.enable = true;
  #     web-devicons.enable = true;
  #     lsp = {
  #       enable = true;
  #     };
  #     # lsp.servers.efm = {
  #     #   enable = true;
  #     # };
  #     # lsp-format = {
  #     #   enable = true;
  #     #   lspServersToEnable = [ "efm" ];
  #     # };
  #     # efmls-configs.enable = true;
  #     neo-tree = {
  #       enable = true;
  #     };
  #     telescope.enable = true;
  #     lazy.enable = true;
  #   };
  # };


}
