{
  stdenv,
  lib,
  fetchFromGitHub,
  fetchpatch,
  cmake,
  zlib,
  libxml2,
  eigen,
  python3,
  cairo,
  pcre,
  pkg-config,
}:

stdenv.mkDerivation rec {
  pname = "openbabel";
  version = "2.4.1";

  src = lib.cleanSource ../.;

  postPatch = ''
    sed '1i#include <ctime>' -i include/openbabel/obutil.h # gcc12
  '';

  buildInputs = [
    zlib
    libxml2
    eigen
    python3
    cairo
    pcre
  ];

  cmakeFlags = [ "-DCMAKE_CXX_STANDARD=14" ];

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  meta = with lib; {
    description = "Toolbox designed to speak the many languages of chemical data";
    homepage = "http://openbabel.org";
    platforms = platforms.all;
    license = licenses.gpl2Plus;
  };
}
