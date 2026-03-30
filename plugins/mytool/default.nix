{ pkgs }:

pkgs.writeShellScriptBin "mytool" ''
  echo "Hello from mytool 🚀"
''