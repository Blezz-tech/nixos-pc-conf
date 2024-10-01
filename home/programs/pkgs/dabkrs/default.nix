{ stdenv,
runCommand
}:
stdenv.mkDerivation (finalAttrs: {
  name = "dabkts-nightly";
  # version = "v93";
  date = "241001";
  
  date-nightly = builtins.readFile (runCommand "timestamp" {
    when = builtins.currentTime;
  } ''
    echo -n `date -d @$when '+%y%m%d'` > $out
  '');

  src = builtins.fetchurl {
    url = "https://bkrs.info/downloads/daily/dabkrs_${finalAttrs.date-nightly}.gz";
    sha256 = "sha256:0mlqic54kyrn22q0f6gbmg5wxpls0v3allpnvqcb6a5ig00qgmv1";
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

