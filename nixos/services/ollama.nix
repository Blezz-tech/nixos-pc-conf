{ pkgs
, ...
}:
{
  services = {
    ollama = {
      enable = true;
      acceleration = "rocm";
      loadModels = [
        # "deepseek-r1:8b"
        "deepseek-r1:1.5b"
      ];
      package = pkgs.ollama-rocm;
    };

    nextjs-ollama-llm-ui.enable = true;
  };
}
