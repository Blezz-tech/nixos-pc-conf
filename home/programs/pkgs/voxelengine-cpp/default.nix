{ stdenv
, fetchFromGitHub
, cmake
, pkg-config
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
  pname = "VoxelEngine-Cpp";
  version = "v0.23.4";

  # LD_LIBRARY_PATH = "${wayland}/lib:$LD_LIBRARY_PATH";
  # glfw mesa freeglut entt

  src = fetchFromGitHub {
    owner = "MihailRis";
    repo = "VoxelEngine-Cpp";
    rev = finalAttrs.version;
    sha256 = "sha256-RTkCgyLyiOBTp3UP3e0X1HBPxQZh/873TFrRX063fSM=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    # libglvnd
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

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin/res
    cp VoxelEngine $out/bin/

    cp -r $src/res $out/bin

    runHook postInstall
  '';

  meta = {
    description = "Voxel game engine written in C++";
    homepage = "https://github.com/MihailRis/VoxelEngine-Cpp";
    # license = licenses.mit;
    # platforms = platforms.unix;
    # maintainers = with maintainers; [ ]; # Add maintainers if applicable
  };
})
