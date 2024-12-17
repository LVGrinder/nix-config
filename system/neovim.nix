{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;

  };

  # Install LazyVim dependencies
  environment.systemPackages = with pkgs; [
    neovim # Neovim itself
    ripgrep # Needed for telescope.nvim
    fd # Fast file searching
    fzf # Fuzzy finder
    nodejs # Required for LSP and CoC plugins
    gcc # Compiler for plugins like treesitter
    curl
    wget
    unzip # For extracting plugins
    git # Needed for LazyVim and plugin managers
    python3 # Python support for plugins
    nil
    cargo # needed for nix lsp
    git
    clang
    nil
    nixfmt-rfc-style
  ];
  programs.lazygit.enable = true;
}
