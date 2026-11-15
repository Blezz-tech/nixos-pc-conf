{
  home.shellAliases = {
    yandex-browser = "distrobox enter yandex -- yandex-browser --ozone-platform=wayland";
    yandex-browser-create = ''
      distrobox create --name yandex --image registry.fedoraproject.org/fedora:latest --yes \
        && RPM=$(curl -fsSL https://repo.yandex.ru/yandex-browser/rpm/stable/x86_64/ | grep -oE 'yandex-browser-stable-[^"]+\.rpm' | head -1) \
        && distrobox enter yandex -- bash -lc "sudo dnf clean all && sudo dnf install -y --exclude=openh264 --setopt=install_weak_deps=False --setopt=strict=0 https://repo.yandex.ru/yandex-browser/rpm/stable/x86_64/$RPM && yandex-browser --version"
    '';
    yandex-browser-clean = "distrobox rm yandex";

    myZ = "cd ~/nixos-pc-conf; code .; exit";

    # Пересборка. Имя конфигурации = имя хоста из hosts.nix (nixos-jenya),
    # раньше здесь стояло #pc — такого флейк-атрибута нет.
    myBuild = "sudo nixos-rebuild switch --flake ~/nixos-pc-conf#nixos-jenya";

    myErrors = "journalctl -p 3 -xb";

    myOblivionStorage = "cd ~/git-repos/my-oblivion-storage; code .; exit";

    # Чистка журнала: systemd копит его в /var/log/journal без размера по умолчанию
    myClearHistory = ''
      sudo journalctl --rotate
      sudo journalctl --vacuum-time=1s
    '';
    myPasswordGenerator = "pwgen -c 30";

    # fix zip archives
    fixFileCP866 = "runzip -s CP866 -t utf-8 $1";

    fixRussainTextInMP3 = "find . -iname '*.mp3' -print0 | xargs -0 mid3iconv -eCP1251 --remove-v1";

    # yt-dlp
    saveYoutubeMusic = "yt-dlp -x --audio-format best -o \"%(title)s.%(ext)s\" --sleep-requests 1.5 --min-sleep-interval 60 --max-sleep-interval 90 --download-archive archive.txt $1";

    # gpg
    myGpgEdit = "gpg --edit-key markus.jenya04@yandex.ru";
    myGpgList = "gpg --list-keys --with-keygrip";
    myGpgSshExport = "gpg --export-ssh-key blezz-tech";
    mySshCurrent = "ssh-add -l";

    Desktop = "cd ~/media/desktop";
    Downloads = "cd ~/downloads";
    Images = "cd ~/media/images";
    Documents = "cd ~/media/documents";
    Videos = "cd ~/media/videos";
    Music = "cd ~/media/music";

    sshToCSV = ''
      echo "Host,HostName,Port,User"

      awk '
      /^Host / {
          # If we encounter a new Host, reset variables
          if (host) {
              printf "%s,%s,%s,%s\n", host, hostname, port, user
          }
          host = $2
          hostname = ""
          port = ""
          user = ""
      }
      /^  HostName / { hostname = $2 }
      /^  Port / { port = $2 }
      /^  User / { user = $2 }
      END {
          # Print the last entry if it exists
          if (host) {
              printf "%s,%s,%s,%s\n", host, hostname, port, user
          }
      }
      ' ~/.ssh/config
    '';
  };
}
