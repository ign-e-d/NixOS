{ config, pkgs, ... }:
{
  imports =
    [
      <home-manager/nixos>
    ];

  home-manager.users.a = {
    home.stateVersion = "23.11";

    home.packages = with pkgs; [
      anki-bin
      audacious
      clinfo
      drawio
      ffmpeg_5-full
      firefox
      gimp
      gsmartcontrol
      htop
      kate
      kiwix
      libnotify
      linuxKernel.packages.linux_5_4.wireguard
      lm_sensors
      neofetch
      obs-studio
      obsidian
      qalculate-gtk
      qbittorrent
      runelite
      tor-browser-bundle-bin
      unison
      vlc
      wireguard-tools
      wmctrl
      xclip
      xdotool

      libreoffice-qt
      hunspell
      hunspellDicts.en_US
      hunspellDicts.ru_RU

      steam
      steam-tui
      steamcmd
      steam-run

      libsForQt5.yakuake
      libsForQt5.ark
      libsForQt5.kruler
      libsForQt5.kdeconnect-kde
      krita
    ];

    programs.git = {
      enable = true;

      userName = "Ignatov Egor";
      userEmail = "ign-e-d@proton.me";
    };

    programs.neovim = {
      enable = true;

      extraConfig = ''
        set number
        set encoding=utf-8
        set scrolloff=10
        set sidescrolloff=10
        set tabstop=4
        set shiftwidth=4
        set expandtab
        set smarttab
        set updatetime=100
        set clipboard+=unnamedplus

        inoremap <expr> <Up> pumvisible() ? "\<C-y>\<Up>" : "\<Up>"
        inoremap <expr> <Down> pumvisible() ? "\<C-y>\<Down>" : "\<Down>"

        set list
        set lcs=nbsp:␣,tab:»\ ,extends:›,precedes:‹,trail:•
      '';
      
      extraPackages = with pkgs; [
        tree-sitter
        nodejs-slim_20
      ];

      plugins = with pkgs.vimPlugins; [
        {
          plugin = gruvbox;
          config = "color gruvbox";
        }
        {
          plugin = vim-which-key;
          config = ''
            let timeoutlen = 500
          '';
        }
        {
          plugin = telescope-nvim;
          config = ''
            nnoremap <leader>ff <cmd>Telescope find_files<cr>
            nnoremap <leader>fg <cmd>Telescope live_grep<cr>
            nnoremap <leader>fb <cmd>Telescope buffers<cr>
            nnoremap <leader>fh <cmd>Telescope help_tags<cr>
          '';
        }
        {
          plugin = lightline-vim;
          config = ''
          '';
        }
        {
          plugin = nerdtree;
          config = ''
            nnoremap <leader>n :NERDTreeFocus<CR>
            nnoremap <C-n> :NERDTree<CR>
            nnoremap <C-t> :NERDTreeToggle<CR>
            nnoremap <C-f> :NERDTreeFind<CR>

            autocmd VimEnter * NERDTree | wincmd p

            autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

            autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
          '';
        }
        {
          plugin = nvim-treesitter.withPlugins (
            plugins: with plugins; [
              tree-sitter-nix
              tree-sitter-python
              tree-sitter-c
              tree-sitter-cpp
              tree-sitter-bash
            ]
          );
          config = ''
            lua require'nvim-treesitter.configs'.setup{highlight={enable=true}}
          '';
        }
        {
          plugin = nvim-treesitter-refactor;
          config = ''
            lua<<EOF
            require'nvim-treesitter.configs'.setup {
              refactor = {
                highlight_definitions = {
                  enable = true,
                  -- Set to false if you have an `updatetime` of ~100.
                  clear_on_cursor_move = false,
                },
              },
            }
            EOF
          '';
        }
        {
          plugin = coc-nvim;
          config = ''
          '';
        }
        {
          plugin = coc-clangd;
          config = ''
          '';
        }
        {
          plugin = coc-pairs;
          config = ''
            inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"
          '';
        }
        {
          plugin = vim-qml;
          config = ''
          '';
        }
        {
          plugin = indentLine;
          config = ''
          '';
        }
        {
          plugin = vim-devicons;
          config = ''  
          '';
        }
      ];
    };
  };
}
