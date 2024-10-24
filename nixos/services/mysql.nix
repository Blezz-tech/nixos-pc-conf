{ pkgs
, ...
}:
{
  # База данных
  services.mysql = {
    enable = true;
    package = pkgs.mysql84;
  };
}
