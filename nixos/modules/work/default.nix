{ pkgs
, ...
}:
{
  imports = [
    ./blockchain.nix
    ./kotlin.nix
    ./qsoft.nix
  ];

  # Базы Данных #БД
  services.mysql.enable = true;
  services.mysql.package = pkgs.mysql84;

  # services.postgresql.enable = true;

  # Сервисы кеширования
  services.redis.servers."".enable = true;



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
