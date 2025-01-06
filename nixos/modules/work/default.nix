{
  imports = [
    ./blockchain.nix
    # ./kotlin.nix
    ./qsoft.nix
  ];



  # Обраный прокси сервер
  # services.nginx = {
  #   enable = true;
  #   enableReload = true;

  #   serverTokens = false;

  #   recommendedGzipSettings = true;
  #   recommendedOptimisation = true;
  #   recommendedProxySettings = true;
  #   recommendedTlsSettings = true;

  #   clientMaxBodySize = "32M";

  #   virtualHosts = {
  #     "qsoft.qsoft" = {
  #       forceSSL = false;
  #       enableACME = false;
  #       locations."/" = {

  #         proxyPass = "http://localhost:3000";
  #       };
  #     };
  #   };
  # };

}
