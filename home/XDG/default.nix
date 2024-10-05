{ config
, ...
}: {
  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/media/desktop";
      download = "${config.home.homeDirectory}/downloads";
      templates = "${config.home.homeDirectory}/media/templates";
      publicShare = "${config.home.homeDirectory}/media/public";
      documents = "${config.home.homeDirectory}/media/documents";
      music = "${config.home.homeDirectory}/media/music";
      pictures = "${config.home.homeDirectory}/media/images";
      videos = "${config.home.homeDirectory}/media/videos";

      extraConfig = {
        XDG_PROJECTS_DIR = "${config.home.homeDirectory}/media/projects";
        XDG_GAMES_DIR = "${config.home.homeDirectory}/media/games";
      };
    };
  };
}

#  DESKTOP=media/desktop
#  DOWNLOAD=downloads
#  TEMPLATES=media/templates
#  PUBLICSHARE=media/public
#  DOCUMENTS=media/documents
#  MUSIC=media/music
#  PICTURES=media/photos
#  VIDEOS=media/video
