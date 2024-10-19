{ pkgs
, config
, inputs
, ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    plugins = {
      # Buffer bar
      bufferline = { enable = true; };

      #neoscrool
      neoscroll.enable = true;

      # Status bar
      lualine = { enable = true; };

      # # Make `nvim .` look prettier
      # oil = { enable = true; };

      # Includes all parsers for treesitter
      treesitter = { enable = true; };

      # Auto-tagging
      ts-autotag = { enable = true; };

      # Autopairs
      nvim-autopairs = { enable = true; };

      none-ls = {
        enable = true;
        settings = {
          cmd = [ "bash -c nvim" ];
          debug = true;
        };
        sources = {
          code_actions = {
            statix.enable = true;
            gitsigns.enable = true;
          };
          diagnostics = {
            statix.enable = true;
            deadnix.enable = true;
            pylint.enable = true;
            checkstyle.enable = true;
          };
          formatting = {
            alejandra.enable = true;
            stylua.enable = true;
            shfmt.enable = true;
            nixpkgs_fmt.enable = true;
            google_java_format.enable = false;
            prettier = {
              enable = true;
              disableTsServerFormatter = true;
            };
            black = {
              enable = true;
              settings = ''
                {
                  extra_args = { "--fast" },
                }
              '';
            };
          };
          completion = {
            luasnip.enable = true;
            spell.enable = true;
          };
        };
      };

      # Lazygit
      lazygit = { enable = true; };

      # Notify
      notify = with config.colorScheme.palette; {
        enable = true;
        backgroundColour = "#${base00}";
        fps = 60;
        render = "default";
        timeout = 500;
        topDown = true;
      };

      # Persistence
      persistence.enable = true;

      # Debugger
      dap = {
        enable = true;
        signs = {
          dapBreakpoint = {
            text = "●";
            texthl = "DapBreakpoint";
          };
          dapBreakpointCondition = {
            text = "●";
            texthl = "DapBreakpointCondition";
          };
          dapLogPoint = {
            text = "◆";
            texthl = "DapLogPoint";
          };
        };
        extensions = {
          dap-python = { enable = true; };
          dap-ui = {
            enable = true;
            floating.mappings = { close = [ "<ESC>" "q" ]; };
          };
          dap-virtual-text = { enable = true; };
        };
        configurations = {
          java = [
            {
              type = "java";
              request = "launch";
              name = "Debug (Attach) - Remote";
              hostName = "127.0.0.1";
              port = 5005;
            }
          ];
        };
      };

      # Linting
      lint = {
        enable = true;
        lintersByFt = {
          text = [ "vale" ];
          json = [ "jsonlint" ];
          markdown = [ "vale" ];
          rst = [ "vale" ];
          ruby = [ "ruby" ];
          janet = [ "janet" ];
          inko = [ "inko" ];
          clojure = [ "clj-kondo" ];
          dockerfile = [ "hadolint" ];
          terraform = [ "tflint" ];
        };
      };

      # Trouble
      trouble = { enable = true; };

      # Code snippets
      luasnip = {
        enable = true;
        #extraConfig = {
        #  enable_autosnippets = true;
        #  store_selection_keys = "<Tab>";
        #};
      };

      # Easily toggle comments
      commentary.enable = true;

      # Terminal inside Neovim
      toggleterm = {
        enable = true;
        settings = {
          hide_numbers = false;
          autochdir = true;
          close_on_exit = true;
          open_mapping = "[[<c-s>]]";
          direction = "float";
        };
      };

      # Git signs in code
      gitsigns = {
        enable = true;
        settings.current_line_blame = true;
      };

      which-key = {
        enable = true;
      };

      # Markdown preview server
      # markdown-preview = {
      #   enable = true;
      #   settings.theme = "dark";
      # };

      # Prettier fancier command window
      noice = { enable = true; };

      # Good old Telescope
      telescope = {
        enable = true;
        extensions = { fzf-native = { enable = true; }; };
      };

      # Todo comments
      todo-comments = {
        enable = true;
        settings.colors = {
          error = [ "DiagnosticError" "ErrorMsg" "#DC2626" ];
          warning = [ "DiagnosticWarn" "WarningMsg" "#FBBF24" ];
          info = [ "DiagnosticInfo" "#2563EB" ];
          hint = [ "DiagnosticHint" "#10B981" ];
          default = [ "Identifier" "#7C3AED" ];
          test = [ "Identifier" "#FF00FF" ];
        };
      };

      # File tree
      neo-tree = {
        enable = true;
        enableDiagnostics = true;
        enableGitStatus = true;
        enableModifiedMarkers = true;
        enableRefreshOnWrite = true;
        closeIfLastWindow = true;
        popupBorderStyle = "rounded"; # Type: null or one of “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code
        buffers = {
          bindToCwd = false;
          followCurrentFile = { enabled = true; };
        };
        window = {
          width = 40;
          height = 15;
          autoExpandWidth = false;
          mappings = { "<space>" = "none"; };
        };
      };

      undotree = {
        enable = true;
        settings = {
          autoOpenDiff = true;
          focusOnToggle = true;
        };
      };

      # Highlight word under cursor
      illuminate = {
        enable = true;
        underCursor = false;
        filetypesDenylist = [ "Outline" "TelescopePrompt" "alpha" "harpoon" "reason" ];
      };

      # hardtime = {
      #   enable = true;
      #   enabled = true;
      #   disableMouse = true;
      #   disabledFiletypes = [ "Oil" ];
      #   hint = true;
      #   maxCount = 4;
      #   maxTime = 1000;
      #   restrictionMode = "hint";
      #   restrictedKeys = {
      #     "h" = [ "n" "x" ];
      #     "j" = [ "n" "x" ];
      #     "k" = [ "n" "x" ];
      #     "l" = [ "n" "x" ];
      #     "-" = [ "n" "x" ];
      #     "+" = [ "n" "x" ];
      #     "gj" = [ "n" "x" ];
      #     "gk" = [ "n" "x" ];
      #     "<CR>" = [ "n" "x" ];
      #     "<C-M>" = [ "n" "x" ];
      #     "<C-N>" = [ "n" "x" ];
      #     "<C-P>" = [ "n" "x" ];
      #   };
      # };

      # Nix expressions in Neovim
      nix = { enable = true; };

      # Language server
      lsp = {
        enable = true;
        servers = {
          # Average webdev LSPs
          # tsserver.enable = true; # TS/JS
          cssls.enable = true; # CSS
          tailwindcss.enable = true; # TailwindCSS
          html.enable = true; # HTML
          astro.enable = true; # AstroJS
          phpactor.enable = true; # PHP
          svelte.enable = false; # Svelte
          vuels.enable = false; # Vue
          pyright.enable = true; # Python
          marksman.enable = true; # Markdown
          nil-ls.enable = true; # Nix
          dockerls.enable = true; # Docker
          bashls.enable = true; # Bash
          clangd.enable = true; # C/C++
          csharp-ls.enable = true; # C#
          yamlls.enable = true; # YAML
          lua-ls = {
            # Lua
            enable = true;
            settings.telemetry.enable = false;
          };

          # Rust
          rust-analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };
        };
      };

      # Dashboard
      alpha = {
        enable = true;
        theme = "dashboard";
      };

      cmp-emoji = { enable = true; };

      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          experimental = { ghost_text = true; };
          performance = {
            debounce = 60;
            fetchingTimeout = 200;
            maxViewEntries = 30;
          };
          snippet = { expand = "luasnip"; };
          formatting = { fields = [ "kind" "abbr" "menu" ]; };
          sources = [
            { name = "nvim_lsp"; }
            { name = "emoji"; }
            {
              name = "buffer"; # text within current buffer
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
              keywordLength = 3;
            }
            # { name = "copilot"; } # enable/disable copilot
            {
              name = "path"; # file system paths
              keywordLength = 3;
            }
            {
              name = "luasnip"; # snippets
              keywordLength = 3;
            }
          ];

          window = {
            completion = { border = "solid"; };
            documentation = { border = "solid"; };
          };

          mapping = {
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-k>" = "cmp.mapping.select_prev_item()";
            "<C-e>" = "cmp.mapping.abort()";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
          };
        };
      };
      cmp-nvim-lsp = {
        enable = true; # LSP
      };
      cmp-buffer = { enable = true; };
      cmp-path = {
        enable = true; # file system paths
      };
      cmp_luasnip = {
        enable = true; # snippets
      };
      cmp-cmdline = {
        enable = true; # autocomplete for cmdline
      };

      lspkind = {
        enable = true;
        symbolMap = { Copilot = ""; };
        extraOptions = {
          maxwidth = 50;
          ellipsis_char = "...";
        };
      };

      schemastore = {
        enable = true;
        yaml.enable = true;
        json.enable = false;
      };

      fidget = {
        enable = true;
        logger = {
          level = "warn"; # “off”, “error”, “warn”, “info”, “debug”, “trace”
          floatPrecision =
            1.0e-2; # Limit the number of decimals displayed for floats
        };
        progress = {
          pollRate = 0; # How and when to poll for progress messages
          suppressOnInsert = true; # Suppress new messages while in insert mode
          ignoreDoneAlready = false; # Ignore new tasks that are already complete
          ignoreEmptyMessage =
            false; # Ignore new tasks that don't contain a message
          clearOnDetach =
            # Clear notification group when LSP server detaches
            ''
              function(client_id)
                local client = vim.lsp.get_client_by_id(client_id)
                return client and client.name or nil
              end
            '';
          notificationGroup =
            # How to get a progress message's notification group key
            ''
              function(msg) return msg.lsp_client.name end
            '';
          ignore = [ ]; # List of LSP servers to ignore
          lsp = {
            progressRingbufSize =
              0; # Configure the nvim's LSP progress ring buffer size
          };
          display = {
            renderLimit = 16; # How many LSP messages to show at once
            doneTtl = 3; # How long a message should persist after completion
            doneIcon = "✔"; # Icon shown when all LSP progress tasks are complete
            doneStyle = "Constant"; # Highlight group for completed LSP tasks
            progressTtl = "math.huge"; # How long a message should persist when in progress
            progressIcon = {
              pattern = "dots";
              period = 1;
            }; # Icon shown when LSP progress tasks are in progress
            progressStyle = "WarningMsg"; # Highlight group for in-progress LSP tasks
            groupStyle = "Title"; # Highlight group for group name (LSP server name)
            iconStyle = "Question"; # Highlight group for group icons
            priority = 30; # Ordering priority for LSP notification group
            skipHistory =
              true; # Whether progress notifications should be omitted from history
            formatMessage = ''
              require ("fidget.progress.display").default_format_message
            ''; # How to format a progress message
            formatAnnote = ''
              function (msg) return msg.title end
            ''; # How to format a progress annotation
            formatGroupName = ''
              function (group) return tostring (group) end
            ''; # How to format a progress notification group's name
            overrides = {
              rust_analyzer = { name = "rust-analyzer"; };
            }; # Override options from the default notification config
          };
        };
        notification = {
          pollRate = 10; # How frequently to update and render notifications
          filter = "info"; # “off”, “error”, “warn”, “info”, “debug”, “trace”
          historySize = 128; # Number of removed messages to retain in history
          overrideVimNotify = true;
          redirect = ''
            function(msg, level, opts)
              if opts and opts.on_open then
                return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
              end
            end
          '';
          configs = {
            default = "require('fidget.notification').default_config";
          };

          window = {
            normalHl = "Comment";
            winblend = 0;
            border = "none"; # none, single, double, rounded, solid, shadow
            zindex = 45;
            maxWidth = 0;
            maxHeight = 0;
            xPadding = 1;
            yPadding = 0;
            align = "bottom";
            relative = "editor";
          };
          view = {
            stackUpwards = true; # Display notification items from bottom to top
            iconSeparator = " "; # Separator between group name and icon
            groupSeparator = "---"; # Separator between notification groups
            groupSeparatorHl =
              # Highlight group used for group separator
              "Comment";
          };
        };
      };
    };
    extraConfigLua = ''
        require("telescope").load_extension("lazygit")

        luasnip = require("luasnip")
        kind_icons = {
          Text = "󰊄",
          Method = "",
          Function = "󰡱",
          Constructor = "",
          Field = "",
          Variable = "󱀍",
          Class = "",
          Interface = "",
          Module = "󰕳",
          Property = "",
          Unit = "",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "",
          Event = "",
          Operator = "",
          TypeParameter = "",
        } 

        local cmp = require'cmp'

        -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({'/', "?" }, {
          sources = {
            { name = 'buffer' }
          }
        })

        -- Set configuration for specific filetype.
         cmp.setup.filetype('gitcommit', {
           sources = cmp.config.sources({
             { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
           }, {
             { name = 'buffer' },
           })
         })

         -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
         cmp.setup.cmdline(':', {
           sources = cmp.config.sources({
             { name = 'path' }
           }, {
             { name = 'cmdline' }
           }),
      --      formatting = {
      --       format = function(_, vim_item)
      --         vim_item.kind = cmdIcons[vim_item.kind] or "FOO"
      --       return vim_item
      --      end
      -- }
           })  '';

    # extraPlugins = with pkgs.vimPlugins; [
    #   vim-be-good
    #   headlines-nvim
    #   # accelerated-jk
    # ];

    extraPlugins = with pkgs.vimPlugins;
      [
        base16-nvim
        vim-be-good
        headlines-nvim # Should load this in at the opening of filetypes that require this, namely Markdown.
        nvim-web-devicons # Should load this in at Telescope/Neotree actions.
        friendly-snippets # Should load this in at LuaSnip's initialisation, no clue how tho yet...
        glow-nvim # Glow inside of Neovim
        ultisnips
        clipboard-image-nvim
      ]
      ++ [
        (pkgs.vimUtils.buildVimPlugin {
          pname = "markview.nvim";
          version = "0.0.1";
          src = pkgs.fetchFromGitHub {
            owner = "OXY2DEV";
            repo = "markview.nvim";
            rev = "a959d77ca7e9f05175e3ee4e582db40b338c9164";
            hash = "sha256-w6yn8aNcJMLRbzaRuj3gj4x2J/20wUROLM6j39wpZek=";
          };
        })
        # (pkgs.vimUtils.buildVimPlugin {
        #   pname = "accelerated-jk";
        #   src = pkgs.fetchFromGitHub {
        #     owner = "rainbowhxch";
        #     repo = "accelerated-jk.nvim";
        #     rev = "8fb5dad4ccc1811766cebf16b544038aeeb7806f";
        #     sha256 = "";
        #   };
        #   version = "2023-03-01";
        # })

        # Just copy this block for a new plugin
        # (pkgs.vimUtils.buildVimPlugin {
        #   pname = "";
        #   src = pkgs.fetchFromGitHub {
        #     owner = "";
        #     repo = "";
        #     rev = "";
        #     sha256 = "";
        #   };
        # })
      ];
    keymaps = [
      # Auto format
      {
        action = "<cmd>lua vim.lsp.buf.format()<cr>";
        key = "<leader>a";
        options = { desc = "Auto Format"; };
      }

      # Quit
      {
        action = "<cmd>q<CR>";
        key = "<leader>q";
        options = { desc = "Quit"; };
      }

      # Write
      {
        action = "<cmd>w<CR>";
        key = "<leader>w";
        options = { desc = "Write"; };
      }

      # Neo-tree bindings
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<leader>e";
      }

      # Undotree
      {
        mode = "n";
        key = "<leader>ut";
        action = "<cmd>UndotreeToggle<CR>";
        options = { desc = "Undotree"; };
      }

      # Lazygit
      {
        mode = "n";
        key = "<leader>gg";
        action = "<cmd>LazyGit<CR>";
        options = { desc = "LazyGit (root dir)"; };
      }

      # Commentary bindings
      {
        action = "<cmd>Commentary<CR>";
        key = "<leader>/";
      }

      # Telescope bindings

      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>fw";
      }
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>ff";
      }
      {
        action = "<cmd>Telescope git_commits<CR>";
        key = "<leader>fg";
      }
      {
        action = "<cmd>Telescope oldfiles<CR>";
        key = "<leader>fh";
      }
      {
        action = "<cmd>Telescope colorscheme<CR>";
        key = "<leader>ch";
      }
      {
        action = "<cmd>Telescope man_pages<CR>";
        key = "<leader>fm";
      }

      # Notify bindings

      {
        mode = "n";
        key = "<leader>un";
        action = ''
          <cmd>lua require("notify").dismiss({ silent = true, pending = true })<cr>
        '';
        options = { desc = "Dismiss All Notifications"; };
      }

      # Bufferline bindings

      {
        mode = "n";
        key = "<Tab>";
        action = "<cmd>BufferLineCycleNext<cr>";
        options = { desc = "Cycle to next buffer"; };
      }

      {
        mode = "n";
        key = "<S-Tab>";
        action = "<cmd>BufferLineCyclePrev<cr>";
        options = { desc = "Cycle to previous buffer"; };
      }

      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>BufferLineCycleNext<cr>";
        options = { desc = "Cycle to next buffer"; };
      }

      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>BufferLineCyclePrev<cr>";
        options = { desc = "Cycle to previous buffer"; };
      }

      {
        mode = "n";
        key = "<leader>bd";
        action = "<cmd>bdelete<cr>";
        options = { desc = "Delete buffer"; };
      }
    ];
    globalOpts = {
      title = true;
      # Line numbers
      number = true;
      relativenumber = true;

      # Always show the signcolumn, otherwise text would be shifted when displaying error icons
      signcolumn = "yes";

      # Search
      ignorecase = true;
      smartcase = true;

      # Tab defaults (might get overwritten by an LSP server)
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 0;
      expandtab = true;
      smarttab = true;

      # System clipboard support, needs xclip/wl-clipboard
      clipboard = "unnamedplus";

      # Highlight the current line
      cursorline = true;

      # Show line and column when searching
      ruler = true;

      # Global substitution by default
      gdefault = true;

      # Start scrolling when the cursor is X lines away from the top/bottom
      scrolloff = 5;
    };

    userCommands = {
      Q.command = "q";
      Q.bang = true;
      Wq.command = "q";
      Wq.bang = true;
      WQ.command = "q";
      WQ.bang = true;
      W.command = "q";
      W.bang = true;
    };

    globals.mapleader = " ";

    # autoCmd = [
    #   {
    #     event = [ "BufEnter" "BufWinEnter" ];
    #     pattern = [ "*.md" "*.mdx" ];
    #     command = "MarkdownPreviewToggle";
    #   }
    # ];

    highlight = with config.colorScheme.palette; {
      # Cor padrão do texto normal
      normal = {
        bg = "#${base00}"; # Fundo
        fg = "#${base04}"; # Texto
      };

      # Comentários
      Comment = {
        fg = "#${base03}";
        bg = "none";
        underline = false; # Sublinhado
        bold = false; # Negrito
      };

      # Texto inserido ou destacado
      Visual = {
        bg = "#${base01}"; # Fundo quando está em modo visual
      };

      # Texto em strings
      String = {
        fg = "#${base0B}"; # Cor do texto de string
      };

      # Funções
      Function = {
        fg = "#${base0D}"; # Cor das funções
        bold = true;
      };

      # Variáveis
      Identifier = {
        fg = "#${base08}";
      };

      # Constantes
      Constant = {
        fg = "#${base09}";
      };

      # Erros
      Error = {
        fg = "#${base08}";
        bg = "#${base00}";
        bold = true;
        underline = true;
      };

      # Operadores
      Operator = {
        fg = "#${base05}";
      };

      # Palavras reservadas
      Keyword = {
        fg = "#${base0E}";
        bold = true;
      };

      # Diretivas de pré-processador
      PreProc = {
        fg = "#${base0A}";
      };

      # Tipo de dados
      Type = {
        fg = "#${base0C}";
        bold = true;
      };

      # Variável booleana
      Boolean = {
        fg = "#${base09}";
      };

      # Números
      Number = {
        fg = "#${base09}";
      };

      # Texto que foi sublinhado
      Underlined = {
        underline = true;
      };

      # Fundo da barra de status
      StatusLine = {
        fg = "#${base04}";
        bg = "#${base02}";
      };

      # Separadores verticais entre janelas
      VertSplit = {
        fg = "#${base02}";
        bg = "#${base00}";
      };
    };
  };
}
