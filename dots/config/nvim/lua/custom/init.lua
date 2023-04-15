-- local autocmd = vim.api.nvim_create_autocmd
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- vim.cmd(colorscheme jellybeans-nvim)

local options = {
	-- neovide_fullscreen = true,
	guifontwide = "UDEV Gothic 35NFLG:h24",
	guifont = "UDEV Gothic 35NFLG:h24",
	-- {{{ Visual
	termguicolors = true, -- truecolours for better experience
	--neovide_hide_mouse_when_typing = true,
	--neovide_cursor_animation_length = 0,
	number = false, -- Always show line number
	--relativenumber = true, -- Always show relative numbers
	--cursorline = true, -- Change current line background
	showtabline = 1, -- Show tabline when more than 1 tab
    -- Visual }}}

	-- {{{ Files & Buffers
	hidden = true, -- Do not close the buffers, hide them
	history = 1000, -- Remember more commands and search history
	undolevels = 1000, -- Remember more levels of undo
	-- undofile,
	-- undodir = "$HOME/.cache/undo",
	-- noerrorbells = true,        -- No buzz on error
	-- novisualbell = true,        -- No 'visual buzz' on error
	-- t_vb = "",                  -- Same as above
	-- autoread = true,            -- Reload the file if changed from the outside
	switchbuf = "uselast", -- If opening a file from :ls, :buffers, :files, etc. jump to open version
	-- of the file, if one exists
	clipboard = "unnamed", -- Use * and + registers to access system clipboard(i.e. tmux)

	confirm = true, -- Dialog foor unsaved changes
	splitright = true, -- Go to right pane by default (Needed for quickmenu)
	shortmess = "csa", -- Disable some hit-enter messages
    -- Files & Buffers }}}

	-- {{{ Terminal setup
	lazyredraw = true, -- lazyredraw to make macro faster
	showcmd = true, -- Show keys in status
    -- Terminal setup }}}

	-- {{{ Folding
	foldmethod = "marker", -- foldmethod using marker
	foldlevel = 10, -- limit foldings
    -- Folding }}}

	-- {{ Trailings / tabs
	list = true, -- display listchars
	fillchars = { vert = "│", eob = " " }, -- make vertical split sign better
	listchars = { eol = "↲", tab = "» " }, -- set listchars
    -- Trailings / tabs }}}
	--
	-- -- Better vimdiff{{{
	-- diffopt = "internal,algorithm:patience,indent-heuristic", --}}}
	--
	-- Completion{{{
	pumheight = 10, -- limit completion items
	timeoutlen = 400, -- faster timeout wait time
	updatetime = 100, -- set faster update time ]]}}}
	wildmode = "list:longest,full",
	scrolloff = 50,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
