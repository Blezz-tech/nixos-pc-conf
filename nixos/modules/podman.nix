{ pkgs, ... }:
{
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # Useful other development tools
  environment.systemPackages = [
    pkgs.dive # look into docker image layers
    pkgs.podman-tui # status of containers in the terminal
    pkgs.docker-compose # start group of containers for dev
    pkgs.podman-compose # start group of containers for dev
    pkgs.podman-desktop
  ];

  environment.variables = {
    DOCKER_HOST = "unix:///run/user/1000/podman/podman.sock";
  };

  environment.shellAliases = {
    docker = "podman";
    docker-compose = "podman-compose";
  };
}
