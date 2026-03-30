{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "kubectl-aliases";
  version = "1.0.0";

  src = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases";
    hash = "sha256-Kqb6kk2EZjoX55flZqiuNRLJQDfC2XMgO+F3tyCEnqk=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/kubectl-aliases
    cp $src $out/share/kubectl-aliases/.kubectl_aliases
  '';

  meta = with pkgs.lib; {
    description = "kubectl aliases for bash/zsh";
    homepage = "https://github.com/ahmetb/kubectl-aliases";
    license = licenses.asl20;
    maintainers = [ ];
  };
}