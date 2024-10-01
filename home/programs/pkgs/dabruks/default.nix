{ stdenv,
runCommand
}:
stdenv.mkDerivation (finalAttrs: {
  name = "bruks-nightly";
  # version = "v93";
  date = "241001";
  
  date-nightly = builtins.readFile (runCommand "timestamp" {
    when = builtins.currentTime;
  } ''
    echo -n `date -d @$when '+%y%m%d'` > $out
  '');

  src = builtins.fetchurl {
    url = "https://bkrs.info/downloads/daily/dabruks_${finalAttrs.date-nightly}.gz";
    sha256 = "sha256-5/2wS2rKeUpduI/b+588sffpd4qzyP51Xsv/r6rzZZo=";
  };

  dontUnpack = true;

  buildPhase = ''
    mkdir -p /build

    gzip -dc < $src > /build/dabruks
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/

    cp /build/dabruks $out/dabruks-${finalAttrs.date}.dsl

    runHook postInstall
  '';


  meta = {
    description = ''
      Russian-Chinese Dictionary 
    '';
    # sourceProvenance = with sourceTypes; [ binaryBytecode ];
    # license = licenses.unfree;
    # maintainers = with maintainers; [ bbigras rafaelrc ];
  };
})

