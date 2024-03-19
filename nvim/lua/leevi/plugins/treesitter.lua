return {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function()
	    ensure_installed = { "vim", "c", "lua", "cpp", "bash", "dockerfile", "gitcommit", "gitignore", "git_rebase", "jq", "json", "make", "markdown", "latex", "python", "sql", "yaml" }
	    sync_install = false
	    auto_install = true
	    highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
	    }
    end,
}

