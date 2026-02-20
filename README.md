# Vimrc Bootstrap Installer

This repository provides a shell script to bootstrap a complete development environment for the included `vimrc` configuration.

The installer sets up:

* Vim plugin manager (vim-plug)
* Compatibility runtime (pathogen)
* All Vim plugins
* Language tooling (Rust, Python, Node LSP)
* External utilities used by mappings and plugins

---

## What gets installed

### Core tools

* vim
* git
* curl
* build tools

### Editor integrations

* universal-ctags (Tagbar)
* fzf (fuzzy search)
* silversearcher-ag (project search)
* clang-format (format keybinding)

### Language support

* Rust toolchain (cargo, rustfmt, rust-analyzer)
* NodeJS + npm (coc.nvim LSP)
* Python support

### Vim plugins

* NERDTree
* fzf.vim
* coc.nvim
* ALE
* Tagbar
* vim-surround
* rust.vim

---

## Install

```bash
git clone https://github.com/caiocrux/vimrc.git
cd vimrc
chmod +x install_vimrc.sh
./install_vimrc.sh
```

After installation restart the shell or run:

```bash
source ~/.cargo/env
```

---

## Post-install verification

Run Vim and check:

```
:checkhealth
:PlugStatus
:CocInfo
```

Open a Rust file and confirm:

* completion works
* `cargo build` mapping works (`<leader>b`)
* Tagbar opens with `<F9>`
* File tree toggles with `<F5>`

---

## Notes

The vimrc currently initializes both pathogen and vim-plug. Pathogen is kept only for backward compatibility; vim-plug manages all plugins.

Removing pathogen from the vimrc will reduce startup latency.

