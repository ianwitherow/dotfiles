# 💤 LazyVim


## ⚡️ Requirements
- Neovim >= 0.9.0 (needs to be built with LuaJIT)
- Git >= 2.19.0 (for partial clones support)
- a Nerd Font(v3.0 or greater) (optional, but needed to display some icons)
- lazygit (optional)
- a C compiler for nvim-treesitter. See here
- curl for blink.cmp (completion engine)
- for fzf-lua (optional)
  - fzf: fzf (v0.25.1 or greater)
  - live grep: ripgrep
  - find files: fd
- a terminal that support true color and undercurl:
  - kitty (Linux & Macos)
  - wezterm (Linux, Macos & Windows)
  - alacritty (Linux, Macos & Windows)
  - iterm2 (Macos)

### Install dependencies on MacOS
```bash
brew install gcc
brew install fzf
brew install ripgrep
brew install fd
```

Font:
```bash
brew install font-meslo-lg-nerd-font
```

[Terminal setup for wezterm](https://www.josean.com/posts/how-to-setup-wezterm-terminal)

