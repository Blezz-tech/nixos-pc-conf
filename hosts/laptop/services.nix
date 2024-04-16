{ config
, pkgs
, inputs
, ...
}:
let
  hostname = "blezz-tech.ru";
in
{

  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  virtualisation.docker = {
    enableOnBoot = true;
    enable = true;
  };

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/home/jenya/.config/sops/age/keys.txt";

    secrets = {
      "server/acme" = { };
      "server/kavita" = { };
      "server/photoprism" = { };
      "server/gitea/lol-simple-image-generator" = { };
    };
  };


  users.users.nginx.extraGroups = [ "acme" ];

  security.acme = {
    acceptTerms = true;
    defaults.email = "blezz-tech+markus.jenya04@yandex.ru";
    defaults.dnsProvider = "regru";
    defaults.credentialsFile = /run/secrets/server/acme;
    # defaults.validMinDays = 60;
    defaults.enableDebugLogs = true;
    defaults.dnsResolver = "194.58.117.15";

    certs.${hostname} = {
      extraDomainNames = [ "*.${hostname}" ];
      group = "nginx";
    };
  };

  services = {

    gitea = {
      enable = true;
      lfs.enable = true;

      appName = "Blezz-tech gitea server";
      settings = {
        session.COOKUE_SECURE = true;
        service.DISABLE_REGISTRATION = true;
        server.DOOMAIN = "gitea.blezz-tech.ru";
        server.HTTP_PORT = 3220;
        server.ROOT_URL = "https://gitea.blezz-tech.ru/";
      };

    };

    gitea-actions-runner.instances = {
      "4" = {
        enable = true;
        url = "https://gitea.blezz-tech.ru";
        name = "ci";
        tokenFile = /run/secrets/server/gitea/lol-simple-image-generator;
        labels = [
          "ubuntu-latest:docker://node:18-bullseye"
          "nixos-minimal:docker://gitea.blezz-tech.ru/blezz-tech/actions"
        ];
      };
    };

    # paperless = {
    #   enable = true;
    #   port = 3221;
    # };

    # kavita = {
    #   enable = true;
    #   port = 3222;
    #   ipAdresses = ["127.0.0.1"];
    #   tokenKeyFile = /run/secrets/server/kavita;
    # };

    # photoprism = {
    #   enable = true;
    #   port = 3223;
    #   originalsPath = "${config.services.photoprism.storagePath}/data/photos";
    #   passwordFile = /run/secrets/server/photoprism;
    # };

    # vaultwarden = {
    #   enable = true;
    #   config = {
    #     ROCKET_ADDRESS = "127.0.0.1";
    #     ROCKET_PORT = 3224;
    #   };
    # };

    home-assistant = {
      enable = true;
      extraComponents = [
        # Components required to complete the onboarding
        "esphome"
        "met"
        "radio_browser"
      ];
      config = {
        homeassistant = {
          name = "home assistant";
          temperature_unit = "C";
          unit_system = "metric";
          currency = "RUB";
          country = "RU";
          # language = "";
        };
        http = {
          server_host = "127.0.0.1";
          server_port = 3225;
          use_x_forwarded_for = true;
          trusted_proxies = [ "127.0.0.1" ];
        };
        default_config = { };
      };
    };

    nginx = {
      enable = true;
      enableReload = true;

      # statusPage = true;

      serverTokens = false;

      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;

      clientMaxBodySize = "1024M";

      virtualHosts =
        let
          def-cfg = cfg: cfg // {
            forceSSL = true;
            enableACME = false;
            useACMEHost = "${hostname}";
          };
        in
        {
          "gitea.${hostname}" = def-cfg {
            locations."/".proxyPass = "http://localhost:3220";
          };

          # "paperless.${hostname}" = def-cfg {
          #   locations."/".proxyPass = "http://localhost:3221";
          # };

          # "kavita.${hostname}" = def-cfg {
          #   locations."/".proxyPass = "http://localhost:3222";
          # };

          # "photoprism.${hostname}" = def-cfg {
          #   locations."/".proxyPass = "http://localhost:3223";
          # };

          # "vaultwarden.${hostname}" = def-cfg {
          #   locations."/".proxyPass = "http://localhost:3224";
          # };

          "home.${hostname}" = def-cfg {
            locations."/".proxyPass = "http://localhost:3225";
            locations."/".proxyWebsockets = true;
          };

          "${hostname}" = def-cfg {
            locations."/".root = "/var/lib/blezz-tech.ru";
            locations."/".index = "index.html";
          };

          "*.${hostname}" = def-cfg {
            globalRedirect = hostname;
          };
        };
    };
  };
}
