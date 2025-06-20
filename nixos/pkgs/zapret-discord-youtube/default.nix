{ stdenv
, fetchFromGitHub
, lib
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "zapret-discord-youtube";
  version = "1.8.0";

  src = fetchFromGitHub {
    owner = "Flowseal";
    repo = "zapret-discord-youtube";
    rev = finalAttrs.version;
    sha256 = "sha256-GgDxB2GFnQizvY2kiBs7E9lgvxn4KwxRcOZBAeUXCPk=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out/
    cp -r $src/* $out
    runHook postInstall
  '';

  meta = {
    description = "Configs for zapret for Discord and YouTube";
    homepage = "https://github.com/Flowseal/zapret-discord-youtube";
    license = lib.licenses.mit;
    platforms = lib.platforms.unix;
    # maintainers = with maintainers; [ ]; # Add maintainers if applicable
  };
})
