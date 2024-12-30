-- disables enter key for completion
return {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
        local cmp = require("cmp")
        opts.mapping["<CR>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                fallback()
            else
                fallback()
            end
        end, { "i", "s" })
    end,
}
