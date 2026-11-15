{ ... }: {
  # Несвободные пакеты: steam, vscode, chromium-кодеки, davinci-resolve и прочее
  # из nixos/packages.nix и home/programs. Без этого сборка падает на eval.
  nixpkgs.config.allowUnfree = true;
}
