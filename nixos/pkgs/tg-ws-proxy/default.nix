{ lib
, python3Packages
, fetchFromGitHub
, gobject-introspection
, gtk3
, libappindicator-gtk3
, wrapGAppsHook3
,
}:

python3Packages.buildPythonApplication rec {
  pname = "tg-ws-proxy";
  version = "1.11.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Flowseal";
    repo = "tg-ws-proxy";
    rev = "v${version}";
    hash = "sha256-oX6fdrsqeLwcwGJsI+0bj/y+5JM2ap+d3HuqLmnViho=";
  };

  build-system = with python3Packages; [
    hatchling
  ];

  dependencies = with python3Packages; [
    certifi
    cryptography
    customtkinter
    h2
    httpx
    pillow
    psutil
    pyperclip
    pystray
  ];

  pythonRelaxDeps = [
    "cryptography"
    "pillow"
    "psutil"
    "pyperclip"
  ];

  nativeBuildInputs = [
    gobject-introspection
    wrapGAppsHook3
  ];

  buildInputs = [
    gtk3
    libappindicator-gtk3
  ];

  pythonRemoveDeps = [
    "pyobjc-framework-Cocoa"
  ];

  pythonImportsCheck = [
    "proxy"
  ];

  meta = {
    description = "Telegram Desktop WebSocket bridge proxy";
    homepage = "https://github.com/Flowseal/tg-ws-proxy";
    changelog = "https://github.com/Flowseal/tg-ws-proxy/releases";
    license = lib.licenses.mit;
    # maintainers = with lib.maintainers; [ ];
    mainProgram = "tg-ws-proxy";
    platforms = lib.platforms.linux;
  };
}
