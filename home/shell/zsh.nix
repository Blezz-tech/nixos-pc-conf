{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      # Возращение НОРМАЛЬНОГО поведения в zsh для Ctrl + Arrow Left/Right
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
    '';

    oh-my-zsh = {
      enable = false;
      plugins = [ "git" "sudo" ];
      theme = "agnoster";
    };
  };
}
