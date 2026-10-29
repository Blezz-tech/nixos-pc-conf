{ lib
, stdenv
, fetchFromGitHub
, cmake
, pkg-config
, copyDesktopItems
, makeDesktopItem
, addDriverRunpath
, glfw
, glew
, glm
, libpng
, libvorbis
, openal
, luajit
, entt
, zlib
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "voxelengine-cpp";
  version = "v0.23.4";

  src = fetchFromGitHub {
    owner = "MihailRis";
    repo = "VoxelEngine-Cpp";
    rev = finalAttrs.version;
    sha256 = "sha256-RTkCgyLyiOBTp3UP3e0X1HBPxQZh/873TFrRX063fSM=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
    copyDesktopItems
    addDriverRunpath
  ];

  buildInputs = [
    glfw
    glew
    glm
    libpng
    libvorbis
    openal
    luajit
    entt
    zlib
  ];

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
  ];

  # Прописываем путь к libGL/libEGL в RPATH бинарника,
  # иначе на NixOS рантайм не найдёт драйверы OpenGL.
  postFixup = ''
    addDriverRunpath $out/bin/VoxelEngine
  '';

  desktopItems = [
    (makeDesktopItem {
      name = "voxelengine-cpp";
      desktopName = "VoxelEngine";
      comment = "Voxel game engine written in C++";
      exec = "VoxelEngine";
      icon = "voxelengine-cpp";
      categories = [ "Game" "GameEngine" ];
      terminal = false;
    })
  ];

  installPhase = ''
    runHook preInstall

    install -Dm755 VoxelEngine $out/bin/VoxelEngine
    mkdir -p $out/share/voxelengine-cpp
    cp -r $src/res $out/share/voxelengine-cpp/res

    # Опционально: иконка, если она есть в исходниках.
    # Пример (раскомментируйте и поправьте путь, если иконка присутствует):
    # install -Dm644 $src/res/icon.png $out/share/icons/hicolor/256x256/apps/voxelengine-cpp.png

    runHook postInstall
  '';

  meta = {
    description = "Voxel game engine written in C++";
    homepage = "https://github.com/MihailRis/VoxelEngine-Cpp";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
    mainProgram = "VoxelEngine";
    maintainers = [ ];
  };
})