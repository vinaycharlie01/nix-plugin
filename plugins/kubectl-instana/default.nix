{ pkgs }:

pkgs.writeShellScriptBin "kubectl-instana" ''
  exec "$HOME/kubectl-instana" "$@"
''