{ pkgs
, ...
}:
{
  services.mysql.enable = true;
  services.mysql.package = pkgs.mysql84;

  services.redis.servers."" = {
    enable = true;
  };

  environment.systemPackages = [
    pkgs.nodejs_22
  ];
}
