return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            completion = {},
            snippet = {},
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
            }, {
                { name = "buffer" },
            }, {
                { name = "path" }
            }, {
                { name = "vsnip" },
            })
        })
        
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = { 
                { name = "buffer" }
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({ 
                { name = "path" }
            }, {
                { name = "cmdline" }
            })
        })
    end,
}

--return {
--  "hrsh7th/nvim-cmp",
--  event = "InsertEnter",
--  dependencies = {
--    "hrsh7th/cmp-buffer", -- source for text in buffer
--    "hrsh7th/cmp-path", -- source for file system paths
--    "L3MON4D3/LuaSnip", -- snippet engine
--    "hrsh7th/cmp-nvim-lsp",
--    "saadparwaiz1/cmp_luasnip", -- for autocompletion
--    "rafamadriz/friendly-snippets", -- useful snippets
--    "onsails/lspkind.nvim", -- vs-code like pictograms
--  },
--  config = function()
--    local cmp = require("cmp")
--    local luasnip = require("luasnip")
--    local lspkind = require("lspkind")
--
--    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
--    require("luasnip.loaders.from_vscode").lazy_load()
--
--    cmp.setup({
--      completion = {
--        completeopt = "menu,menuone,preview,noselect",
--      },
--      snippet = { -- configure how nvim-cmp interacts with snippet engine
--        expand = function(args)
--          luasnip.lsp_expand(args.body)
--        end,
--      },
--      mapping = cmp.mapping.preset.insert({
--        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
--        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
--        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--        ["<C-f>"] = cmp.mapping.scroll_docs(4),
--        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
--        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
--        ["<CR>"] = cmp.mapping.confirm({ select = false }),
--      }),
--      -- sources for autocompletion
--      sources = cmp.config.sources({
--        --{ name = "lspkind" },
--        { name = "nvim_lsp" },
--        --{ name = "luasnip" }, -- snippets
--      }, {
--        { name = "fuzzy_buffer" }, -- text within current buffer
--      }, {
--        { name = "path" }, -- file system paths
--      }),
--      -- configure lspkind for vs-code like pictograms in completion menu
--      --formatting = {
--      --  format = lspkind.cmp_format({
--      --    maxwidth = 50,
--      --    ellipsis_char = "...",
--      --  }),
--      --},
--    })
--  end,
--}
