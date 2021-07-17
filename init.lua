local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Treesiter is a incremental parser to improve syntax highlighting and such
    use {"nvim-treesitter/nvim-treesitter",
        config = require'nvim-treesitter.configs'.setup {
                highlight = {
                    enable = true
                },
                indent = {
                    enable = false
                },
                incremental_selection = {
                    enable = true
                },
                rainbow = {enable = true}
            }
    }

    -- File Explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {"kyazdani42/nvim-web-devicons"}
    }

    -- LSP
    use "neovim/nvim-lspconfig"
    use "kabouzeid/nvim-lspinstall"
    use "glepnir/lspsaga.nvim"

    -- Auto complete
    use "hrsh7th/nvim-compe"

    -- Orgmode
    use "kristijanhusak/orgmode.nvim"

    -- Colorizer for hex code and such within the code
    use 'norcalli/nvim-colorizer.lua'

    -- todo highlighter that is really awesome
    use "folke/todo-comments.nvim"

    -- Git stuff
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function ()
            require('gitsigns').setup()
        end
    }

    use "tpope/vim-fugitive"

    -- Lines
    use {
        "romgrk/barbar.nvim",
        requires = {"kyazdani42/nvim-web-devicons"}
    }
    use {
      'glepnir/galaxyline.nvim',
        branch = 'main',
        -- some optional icons
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    -- Which key port to nvim
    use {
	"AckslD/nvim-whichkey-setup.lua",
	requires={"liuchengxu/vim-which-key"}
    }

    -- Helper for coding
    use "p00f/nvim-ts-rainbow"

    -- Faster jump to character navigation
    use { 'ggandor/lightspeed.nvim' }
    --     -- config = require('lightspeed').setup {
    --     --     jump_to_first_match = true,
    --     --     jump_on_partial_input_safety_timeout = 400,
    --     --     -- This can get _really_ slow if the window has a lot of content,
    --     --     -- turn it on only if your machine can always cope with it.
    --     --     highlight_unique_chars = false,
    --     --     grey_out_search_area = true,
    --     --     match_only_the_start_of_same_char_seqs = true,
    --     --     limit_ft_matches = 5,
    --     --     full_inclusive_prefix_key = '<c-x>',
    --     --     -- By default, the values of these will be decided at runtime,
    --     --     -- based on `jump_to_first_match`.
    --     --     labels = nil,
    --     --     cycle_group_fwd_key = nil,
    --     --     cycle_group_bwd_key = nil,
    --     -- }
    -- }

    -- Dashboard
    use "glepnir/dashboard-nvim"

    -- Colorscheme
    use 'marko-cerovac/material.nvim'
    use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}
    vim.cmd [[packadd nvcode-color-schemes.vim]]
    use 'folke/tokyonight.nvim'

    require('patgro')


end)
