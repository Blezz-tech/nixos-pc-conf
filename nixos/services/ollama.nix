{ pkgs
, ...
}:
{
  services = {
    ollama = {
      enable = true;
      acceleration = "rocm";
      rocmOverrideGfx = "11.0.2";
      loadModels = [
        # "deepseek-r1:8b"
        "deepseek-r1:1.5b"
      ];
      package = pkgs.ollama-rocm;
    };

    nextjs-ollama-llm-ui.enable = true;
  };
}
