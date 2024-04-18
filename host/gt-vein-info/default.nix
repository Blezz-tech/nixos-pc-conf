{ stdenv
, makeWrapper
, fetchFromGitHub
, jre
, jdk
, copyDesktopItems
, makeDesktopItem
, lib
}:
stdenv.mkDerivation (finalAttrs: {
  name = "gt-vein-info";
  version = "210606";

  src = fetchFromGitHub {
    owner = "Techlone";
    repo = "GTVeinInfo";
    rev = finalAttrs.version;
    hash = "sha256-UIvu4JdgtG/UyzQGtXT3CpMLgyU24pa3YysjtF2i8x4=";
  };

  env.PROGRAM_NAME = "${finalAttrs.name}-${finalAttrs.version}.jar";

  dontUnpack = true;

  nativeBuildInputs = [
    makeWrapper
    jdk
    copyDesktopItems
  ];

  desktopItems = [
    (makeDesktopItem {
      name = "gt-vein-info";
      exec = "gt-vein-info";
      icon = "minecraft";
      comment = finalAttrs.meta.description;
      genericName = "gt-vein-info";
      desktopName = "gt-vein-info";
      categories = [ "Game" ];
    })
  ];

  buildPhase = ''
    cp -pr $src/src /build

    mkdir -p build

    javac -d build @<(find -name "*.java")

    cd build

    jar cvfm $PROGRAM_NAME /build/src/META-INF/MANIFEST.MF *  
  '';

  installPhase = ''
    runHook preInstall

    mkdir -pv $out/share/java $out/bin

    cp $PROGRAM_NAME $out/share/java/$PROGRAM_NAME

    makeWrapper ${jre}/bin/java $out/bin/gt-vein-info \
      --add-flags "-jar $out/share/java/$PROGRAM_NAME"
    
    runHook postInstall
  '';


  meta = with lib; {
    description = ''
      A program that finds ore veins for Minecraft Gregtech
    '';
    # sourceProvenance = with sourceTypes; [ binaryBytecode ];
    # license = licenses.unfree;
    # maintainers = with maintainers; [ bbigras rafaelrc ];
  };
})
