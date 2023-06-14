local status, lualine = pcall(require, "lualine")
if not status then
    return
end

--https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
local lualine_theme = require("lualine.themes.papercolor_light")

-- lualine_theme.normal.a.bg = "blue"
lualine_theme.insert.a.bg = "red"
lualine_theme.insert.a.fg = "white"
lualine_theme.visual.a.bg = "violet"
lualine_theme.command = {
    a = {
        gui = "bold",
        bg = "yellow",
        fg = "black",
    },
}
lualine.setup({
    options = {
        theme = lualine_theme
    }
})

