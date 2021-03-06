{ stdenv, fetchgit, unzip, firefox, makeWrapper }:

stdenv.mkDerivation {
  name = "conkeror-1.0pre-20150730";

  src = fetchgit {
    url = git://repo.or.cz/conkeror.git;
    rev = "a1f7e879b129df5cf14ea4ce80a9c1407380ed58";
    sha256 = "12d8949a81a670037664dd930f7efe3d54b321aad48deea68343eba9aaea8785";
  };

  buildInputs = [ unzip makeWrapper ];

  installPhase = ''
    mkdir -p $out/libexec/conkeror
    cp -r * $out/libexec/conkeror

    makeWrapper ${firefox}/bin/firefox $out/bin/conkeror \
      --add-flags "-app $out/libexec/conkeror/application.ini"
  '';

  meta = with stdenv.lib; {
    description = "A keyboard-oriented, customizable, extensible web browser";
    longDescription = ''
      Conkeror is a keyboard-oriented, highly-customizable, highly-extensible
      web browser based on Mozilla XULRunner, written mainly in JavaScript,
      and inspired by exceptional software such as Emacs and vi. Conkeror
      features a sophisticated keyboard system, allowing users to run commands
      and interact with content in powerful and novel ways. It is
      self-documenting, featuring a powerful interactive help system.
    '';
    homepage = http://conkeror.org/;
    license = with licenses; [ mpl11 gpl2 lgpl21 ];
    maintainers = with maintainers; [ astsmtl chaoflow ];
    platforms = with platforms; linux;
  };
}
