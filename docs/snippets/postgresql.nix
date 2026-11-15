{ lib
, pkgs
, ...
}: {
  services.postgresql = {
    enable = true;
    enableJIT = true;
    # TODO: Попробовать сделать auth-method = scram-sha-256
    authentication = lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
    
      #type database  DBuser  ipv4         auth-method
      host  all       all     127.0.0.1/32 trust
    '';
  };
}
