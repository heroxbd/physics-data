{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/71d7a4c037dc4f3e98d5c4a81b941933cf5bf675.tar.gz") { }
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    python310Packages.pygments
    which
    gnumake
    (emacs.pkgs.withPackages (epkgs: (with epkgs.melpaStablePackages; [
      htmlize
    ] ++ (with epkgs.elpaPackages; [
      org
    ]))))
    (texlive.combine {
      inherit (texlive) scheme-small latexmk luatex wrapfig capt-of siunitx mhchem adjustbox wasysym ctex beamer collectbox appendixnumberbeamer medstarbeamer rsfs wasy minted fvextra catchfile xstring framed;
    })
    git
    graphviz
    python3
  ];
}

