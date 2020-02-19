#!/bin/bash

# Set user specific actions which do not require sudo and should be run in
# the local userspace
localInstallDir="${HOME}/.local"
localInstallBin="${localInstallDir}/bin"

# Set current path
SOURCE="${BASH_SOURCE[0]}"
while [[ -h "$SOURCE" ]]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Set base path
installBaseDir="${HOME}/.spacemacsInstall"

# Install haskell dependencies with stack, do it manually to avoid dynamic
# linking in arch linux haskell packages
# Avoid building too much packages as this exceed max build time
# https://wiki.archlinux.org/index.php/Haskell
stack install hoogle
stack install hlint
stack install hindent
stack install hasktags
stack install happy
stack install alex
stack install apply-refact
stack install stylish-haskell

# Install haskell lsp from source
lspHaskelBaseDir="${installBaseDir}/hie"
if [[ ! -d "${lspHaskelBaseDir}" ]]; then
    mkdir "${lspHaskelBaseDir}"
    cd "${lspHaskelBaseDir}"
    git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules
    cd haskell-ide-engine
    stack ./install.hs hie-8.6.5
    stack ./install.hs build-doc-8.6.5
fi
