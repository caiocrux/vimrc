#!/usr/bin/env bash
set -euo pipefail

echo "== Vim environment bootstrap =="

#######################################
# Detect package manager
#######################################
if command -v apt >/dev/null 2>&1; then
    PKG_INSTALL="sudo apt install -y"
    sudo apt update
elif command -v dnf >/dev/null 2>&1; then
    PKG_INSTALL="sudo dnf install -y"
elif command -v pacman >/dev/null 2>&1; then
    PKG_INSTALL="sudo pacman -S --noconfirm"
else
    echo "Unsupported distro. Install dependencies manually."
    exit 1
fi

#######################################
# Base dependencies
#######################################
echo "== Installing base dependencies =="
$PKG_INSTALL \
    vim git curl wget build-essential \
    universal-ctags \
    silversearcher-ag \
    clang-format \
    ripgrep \
    python3 python3-pip \
    npm nodejs

#######################################
# Rust toolchain
#######################################
if ! command -v cargo >/dev/null; then
    echo "== Installing Rust toolchain =="
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    source "$HOME/.cargo/env"
fi

rustup component add rustfmt rust-analyzer || true

#######################################
# Vim plugin managers
#######################################
echo "== Installing vim-plug =="
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "== Installing pathogen runtime =="
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim \
    https://tpo.pe/pathogen.vim

#######################################
# Install your vimrc
#######################################
echo "== Installing vimrc =="
cp vimrc ~/.vimrc

#######################################
# Install CoC dependencies (Node packages)
#######################################
echo "== Preparing coc.nvim runtime =="
mkdir -p ~/.config/coc/extensions
cat > ~/.config/coc/extensions/package.json <<EOF
{
  "dependencies": {
    "coc-json": "latest",
    "coc-pyright": "latest",
    "coc-rust-analyzer": "latest"
  }
}
EOF

cd ~/.config/coc/extensions
npm install

#######################################
# Install plugins headless
#######################################
echo "== Installing vim plugins =="
vim +'PlugInstall --sync' +qa

#######################################
# Install fzf binary
#######################################
if [ -d ~/.vim/plugged/fzf ]; then
    ~/.vim/plugged/fzf/install --all
fi

#######################################
# Generate default tags file directory
#######################################
mkdir -p "$HOME/tags"

echo "====================================="
echo " Vim environment ready"
echo " Restart shell or source cargo env:"
echo "   source \$HOME/.cargo/env"
echo "====================================="
