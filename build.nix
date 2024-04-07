{ stdenv
, qtbase
, full
, cmake
, wrapQtAppsHook
}:
stdenv.mkDerivation {
  pname = "shellstorm-qt";
  version = "1.0";

  src = ./src;

  buildInputs = [
    qtbase
    full
  ];

  # buildInputs = buildInputs ++ [ ./sample.csv ];

  nativeBuildInputs = [
    cmake
    wrapQtAppsHook
  ];

  installPhase = ''
    ls -lsa
    ls $src -lsa
    mkdir -p $out/bin
    cp ./shellstorm-qt $out/bin/
  '';
}
