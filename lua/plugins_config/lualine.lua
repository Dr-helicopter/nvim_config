local term_pastel_nord = {
  normal = {
    a = { bg = 5, fg = 0, gui = 'bold' }, -- Accent/Mode section (Color 5: Magenta)
    b = { bg = 8, fg = 4 },               -- Middle sections (Color 8: Muted Slate / Color 4: Blue)
    c = { bg = 'NONE', fg = 7 },         -- Main bar background (Transparent to match terminal BG)
  },
  insert = {
    a = { bg = 2, fg = 0, gui = 'bold' }, -- Insert mode gets Color 2 (Soft Neon Green)
    b = { bg = 8, fg = 4 },
    c = { bg = 'NONE', fg = 7 },
  },
  visual = {
    a = { bg = 3, fg = 0, gui = 'bold' }, -- Visual mode gets Color 3 (Soft Neon Yellow)
    b = { bg = 8, fg = 4 },
    c = { bg = 'NONE', fg = 7 },
  },
  replace = {
    a = { bg = 1, fg = 0, gui = 'bold' }, -- Replace mode gets Color 1 (Soft Neon Red)
    b = { bg = 8, fg = 4 },
    c = { bg = 'NONE', fg = 7 },
  },
  inactive = {
    a = { bg = 'NONE', fg = 8 },
    b = { bg = 'NONE', fg = 8 },
    c = { bg = 'NONE', fg = 8 },
  },
}

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = "16color",
        component_separators = { left = '/', right = '/' },
        section_separators = { left = '/', right = '/' },
    },
  sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
}
