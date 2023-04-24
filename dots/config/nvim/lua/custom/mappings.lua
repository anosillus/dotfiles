---@type MappingsConfig
local M = {}

M.disabled = {
	n = {
		["<C-s>"] = "",
		["N"] = "",
		["E"] = "",
		["c"] = "",
		["v"] = "",
	},
	i = {
		["<C-j>"] = "",
	},
	c = {
		["<C-j>"] = "",
	},
}

M.colemak = { --{{{
	n = { --{{{
		-- h/n {{{
		-- Single:100% {{{
		-- ["n"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
		-- ["e"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
		["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
		["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
		-- Single }}}
		-- <S 100 %>: Edge Motion
		-- <L 100%>:
		["<leader>n"] = { '"}"', "paragraph forward", opts = { expr = true } },
		["<leader>e"] = { '"{"', "paragraph previous", opts = { expr = true } },
		-- TODO MatchUp <l>N and <l>E
		-- <C 100%>: EdgeMotion
		-- <M>:
		-- <m>: Fold
		-- <g>:
		["gn"] = { "<C-w>j", "Move Focus Down", opts = { nowait = true } },
		["ge"] = { "<C-w>k", "Move Focus Up", opts = { nowait = true } },
		["gN"] = { "<C-w>J", "Move Screen Down", opts = { nowait = true } },
		["gE"] = { "<C-w>K", "Move Screen Up", opts = { nowait = true } },
		-- <j>: TODO
		-- h/n }}}
		-- i/h {{{
		-- <>: WordMotion
		-- <S>: WordMotion
		-- <L>:
		["<leader>i"] = { "$", "To the end of the line", opts = { nowait = true } },
		["<leader>h"] = { "^", "To the first non-blank character of the line", opts = { nowait = true } },
		-- <LS>:
		["<leader>I"] = { "+", "Lines downward, on the first non-blank character", opts = { nowait = true } },
		--
		["<leader>H"] = { "0", "To the first character of the line", opts = { nowait = true } },
		-- <C>:
		["<C-i>"] = { "W", "WORD forward", opts = { nowait = true } },
		["<C-h>"] = { "B", "WORD backward", opts = { nowait = true } },
		-- <M>:
		-- <m>:
		-- <g>:
		["gh"] = { "<C-w>h", "Move Focus Left", opts = { nowait = true } },
		["gi"] = { "<C-w>l", "Move Focus Right", opts = { nowait = true } },
		["gH"] = { "<C-w>H", "Move Screen Left", opts = { nowait = true } },
		["gI"] = { "<C-w>L", "Move Screen Right", opts = { nowait = true } },
		-- <j>:
		-- i/h }}}
		-- y/u {{{
		-- <>:
		["y"] = { "<Right>", opts = { nowait = true } },
		["u"] = { "<Left>", opts = { nowait = true } },
		-- <S>: EasyMotion
		-- <L>:
		-- L is LineMotion
		-- l is comment
		-- TODO PLUG ["<leader>y"] = { "gt", "Go to the next tab page.", opts = { nowait = true }},
		-- TODO PLUG ["<leader>u"] = { "gT", "Go to the previous tab page.", opts = { nowait = true }},
		-- <C>:
		["<C-y>"] = { "E", "Forward to the end of WORD", opts = { nowait = true } },
    ["<C-u>"] = { "gE", "Backward to the end of WORD", opts = { nowait = true } },
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- y/u }}}
		-- s/t {{{
		-- <>:
		["s"] = { "i", "insert", opts = { nowait = true } },
		["t"] = { "a", "append", opts = { nowait = true } },
		-- <S>:
		["S"] = { "I", "Insert", opts = { nowait = true } },
		["T"] = { "A", "Append", opts = { nowait = true } },
		-- <L>:
		-- <C>:
		-- <M>:
		--
		-- <m>:
		-- <g>:
		["gs"] = { ":<C-u>%s/\\v/<Left>", "replace" },
		-- TODO gt
		-- <j>:
		-- s/t }}}
		-- a {{{
		-- <>:
		["a"] = { "v", "visual", opts = { nowait = true } },
		-- <S>:
		["A"] = { "V", "Visual", opts = { nowait = true } },
		["<C-a>"] = { "<C-v>", "block selection", opts = { nowait = true } },
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>: EasyAlign
		-- <j>:
		-- a }}}
		-- r {{{
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:lsp
		["<C-r>"] = { "*:%s///g<Left><Left>", "replace" },
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- r }}}
		-- c/v {{{
		["c"] = { "y", "copy", opts = { nowait = true } },
		["C"] = { "y$", "Copy", opts = { nowait = true } },

		["v"] = { "]p", "paste", opts = { nowait = true } },
		["gv"] = { "gp", "pre_paste", opts = { nowait = true } },
		["V"] = { "]P", "Paste", opts = { nowait = true } },
		["gV"] = { "gP", "pre_Paste", opts = { nowait = true } },

		["<leader>v"] = { '"+p', "Paste from clip", opts = { nowait = true } },
		["<leader>V"] = { '<Right>"+p', "Paste from clip", opts = { nowait = true } },

		["<leader>c"] = { '"+y', "Paste from clip", opts = { nowait = true } },
		["<leader>C"] = { '<Right>"+y$', "Paste from clip", opts = { nowait = true } },
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- c/v }}}
		-- z/x {{{
		-- <>:
		["<leader>x"] = { '"+d', "Delete to clip", opts = { nowait = true } },
		["<leader>X"] = { '<Right>"+d$', "Delete to clip", opts = { nowait = true } },

		["z"] = { "u", "undo", opts = { nowait = true } },
		["Z"] = { "<C-r>", "redo", opts = { nowait = true } },
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- z/x }}}
		-- m {{{
		["m"] = { "`", "JumpMark", opts = { nowait = true } },
		["M"] = { "m", "Mark", opts = { nowait = true } },
		["mn"] = { "zj", "", opts = { nowait = true } },
		["Me"] = { "zk", "", opts = { nowait = true } },
		["mE"] = { "[z", "", opts = { nowait = true } },
		["mN"] = { "]z", "", opts = { nowait = true } },
		["mh"] = { "zc", "", opts = { nowait = true } },
		["mH"] = { "zC", "", opts = { nowait = true } },
		["mi"] = { "zo", "", opts = { nowait = true } },
		["mI"] = { "zO", "", opts = { nowait = true } },
		["mm"] = { "zM", "", opts = { nowait = true } },
		["mM"] = { "zR", "", opts = { nowait = true } },
		["mx"] = { "zd", "", opts = { nowait = true } },
		["mX"] = { "zD", "", opts = { nowait = true } },
		["mo"] = { "zMzv", "", opts = { nowait = true } },
		["mO"] = { "zX", "", opts = { nowait = true } },
		["mD"] = { "zD", "", opts = { nowait = true } },
		["gM"] = { "M", "Middle", opts = { nowait = true } },
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- m }}}
		-- b/k {{{
		-- ["b"] = { "", "Repeat the latest search", opts = { nowait = true } },

		["k"] = { "n", "Repeat the latest search", opts = { nowait = true } },
		["K"] = { "N", "Search opposite direction.", opts = { nowait = true } },
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- v/b }}}
		-- z/x {{{
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- z/x }}}
		-- q {{{
		["q"] = { "@", "MacroPlay" },
		["Q"] = { "q", "MacroRecord" },
		-- qq is for tabufline close buffer
		["<leader>q"] = { "<cmd> q <CR>", "Exit", opts = { nowait = true } },
		["<leader>Q"] = { "<cmd> q! <CR>", "Force Exit", opts = { nowait = true } },
		-- <C>: formatting
		-- <M>:
		-- <m>:
		-- <g>: Refactoring
		-- <j>:
		-- q }}}
		-- w {{{
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- w }}}
		-- f / p {{{
		-- Normal+Shift 100% : Easymotion
		-- <L>:
		-- <C>:
		--
		["<C-p>"] = { "<C-b>", "MoveScreen", opts = { nowait = true } },
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- f / p }}}
		-- g / j {{{
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- g / j }}}
		-- l {{{
		-- <>:
		-- ["l"] = { "[comment]", "for plugins", opts = { nowait = true } },
		["L"] = { "[block]", "for plugins" },
		-- l<lhnei>L<lhnie> is comment.
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- l }}}
		-- u/y {{{
		-- shift is easymotion
		-- Ctrl
		-- Leader
		-- ["gu"] = { ":sp ",'side split', opts = { nowait = true }},
		-- ["gy"] = { ":vs ",'vertical split', opts = { nowait = true }},
		-- ["go"] = { ":tabe ",'Tab Edit', opts = { nowait = true }},

		-- ["k"] = { "n", "Repeat the latest search", opts = { nowait = true } },
		-- ["K"] = { "N", "Search opposite direction.", opts = { nowait = true } },
		-- ["m"] = { "`", "JumpMark", opts = { nowait = true } },
		-- ["M"] = { "m", "Mark", opts = { nowait = true } },
		-- u / y }}}
		-- o {{{
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- o }}}
		-- ; {{{
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- ; }}}
		-- , / . {{{
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- , / . }}}
	}, --}}}
	x = { --{{{
		-- h/n {{{
		-- <>:
		["n"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
		["e"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
		["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
		["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
		-- <S>: Edge Motion
		-- <L>:
		["<leader>n"] = { '"}"', "paragraph forward", opts = { expr = true } },
		["<leader>e"] = { '"{"', "paragraph previous", opts = { expr = true } },
		-- TODO <l>N
		-- TODO <l>E
		-- <C>:
		-- <M>:
		-- <m>: Fold
		-- <g>:
		["gn"] = { "<C-w>j", "Move Focus Down", opts = { nowait = true } },
		["ge"] = { "<C-w>k", "Move Focus Up", opts = { nowait = true } },
		["gN"] = { "<C-w>J", "Move Screen Down", opts = { nowait = true } },
		["gE"] = { "<C-w>K", "Move Screen Up", opts = { nowait = true } },
		-- <j>: TODO
		-- h/n }}}
		-- i/h {{{
		-- <>: WordMotion
		-- <S>: WordMotion
		-- <L>:
		["<leader>h"] = { "^", "To the first non-blank character of the line", opts = { nowait = true } },
		["<leader>i"] = { "$", "To the end of the line", opts = { nowait = true } },
		-- <LS>:
		["<leader>H"] = { "0", "To the first character of the line", opts = { nowait = true } },
		["<leader>I"] = { "+", "Lines downward, on the first non-blank character", opts = { nowait = true } },
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		["gh"] = { "<C-w>h", "Move Focus Left", opts = { nowait = true } },
		["gi"] = { "<C-w>l", "Move Focus Right", opts = { nowait = true } },
		["gH"] = { "<C-w>H", "Move Screen Left", opts = { nowait = true } },
		["gI"] = { "<C-w>L", "Move Screen Right", opts = { nowait = true } },
		-- <j>:
		-- i/h }}}
		-- y/u {{{
		-- <>:
		["y"] = { "<Right>", opts = { nowait = true } },
		["u"] = { "<Left>", opts = { nowait = true } },
		-- <S>: EasyMotion
		-- <L>:
		-- TODO PLUG ["<leader>y"] = { "gt", "Go to the next tab page.", opts = { nowait = true }},
		-- TODO PLUG ["<leader>u"] = { "gT", "Go to the previous tab page.", opts = { nowait = true }},
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- y/u }}}
		-- s/t {{{
		-- <>:
		["s"] = { "i", "insert", opts = { nowait = true } },
		["t"] = { "a", "append", opts = { nowait = true } },
		-- <S>:
		["S"] = { "I", "Insert", opts = { nowait = true } },
		["T"] = { "A", "Append", opts = { nowait = true } },
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- Single specific
		["gs"] = { ":<C-u>%s/\\v/<Left><Left><Left>", "replace" },
		-- TODO gt
		-- <j>:
		-- s/t }}}
		-- a {{{
		-- <>:
		["a"] = { "v", "visual", opts = { nowait = true } },
		-- <S>:
		["A"] = { "V", "Visual", opts = { nowait = true } },
		["<C-a>"] = { "<C-v>", "block selection", opts = { nowait = true } },
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>: EasyAlign
		-- <j>:
		-- a }}}
		-- r {{{
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:
		["<C-r>"] = { "*:%s///g<Left><Left>", "replace" },
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- r }}}
		-- c/v {{{
		["c"] = { "y", "copy", opts = { nowait = true } },
		["C"] = { "y$", "Copy", opts = { nowait = true } },

		["v"] = { "]p", "paste", opts = { nowait = true } },
		["gv"] = { "gp", "pre_paste", opts = { nowait = true } },
		["V"] = { "]P", "Paste", opts = { nowait = true } },
		["gV"] = { "gP", "pre_Paste", opts = { nowait = true } },

		["<leader>v"] = { '"+p', "Paste from clip", opts = { nowait = true } },
		["<leader>V"] = { '<Right>"+p', "Paste from clip", opts = { nowait = true } },

		["<leader>c"] = { '"+y', "Paste from clip", opts = { nowait = true } },
		["<leader>C"] = { '<Right>"+y$', "Paste from clip", opts = { nowait = true } },
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- c/v }}}
		-- z/x {{{
		-- <>:
		["<leader>x"] = { '"+d', "Delete to clip", opts = { nowait = true } },
		["<leader>X"] = { '<Right>"+d$', "Delete to clip", opts = { nowait = true } },

		["z"] = { "u", "undo", opts = { nowait = true } },
		["Z"] = { "<C-r>", "redo", opts = { nowait = true } },
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- z/x }}}
		-- m {{{
		["m"] = { "`", "JumpMark", opts = { nowait = true } },
		["M"] = { "m", "Mark", opts = { nowait = true } },
		-- m is normal only
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- m }}}
		-- b/k {{{
		["k"] = { "n", "Repeat the latest search", opts = { nowait = true } },
		["K"] = { "N", "Search opposite direction.", opts = { nowait = true } },
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- v/b }}}
		-- z/x {{{
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- z/x }}}
		-- y / u {{{
		-- shift is easymotion
		-- Ctrl
		-- Leader
		-- ["gu"] = { ":sp ",'side split', opts = { nowait = true }},
		-- ["gy"] = { ":vs ",'vertical split', opts = { nowait = true }},
		-- ["go"] = { ":tabe ",'Tab Edit', opts = { nowait = true }},

		-- ["k"] = { "n", "Repeat the latest search", opts = { nowait = true } },
		-- ["K"] = { "N", "Search opposite direction.", opts = { nowait = true } },
		-- ["m"] = { "`", "JumpMark", opts = { nowait = true } },
		-- ["M"] = { "m", "Mark", opts = { nowait = true } },
		-- y/u }}}
		-- q {{{
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- q }}}
		-- w {{{
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- w }}}
		-- f / p {{{
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- f / p }}}
		-- g / j {{{
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- g / j }}}
		-- l {{{
		["l"] = { "<Nop>", "for plugins", opts = { noremap = true, expr = true } },
		["L"] = { "<Nop>", "for plugins", opts = { noremap = true, expr = false } },
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- l }}}
		-- u/y {{{
		-- shift is easymotion
		-- Ctrl
		-- Leader
		-- ["gu"] = { ":sp ",'side split', opts = { nowait = true }},
		-- ["gy"] = { ":vs ",'vertical split', opts = { nowait = true }},
		-- ["go"] = { ":tabe ",'Tab Edit', opts = { nowait = true }},

		-- ["k"] = { "n", "Repeat the latest search", opts = { nowait = true } },
		-- ["K"] = { "N", "Search opposite direction.", opts = { nowait = true } },
		-- ["m"] = { "`", "JumpMark", opts = { nowait = true } },
		-- ["M"] = { "m", "Mark", opts = { nowait = true } },
		-- u / y }}}
		-- o {{{
		-- ["l"] = { "<Nop>", "for plugins", opts = { nowait = true } },
		-- ["L"] = { "<Nop>", "for plugins" },
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- o }}}
		-- ; {{{
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- ; }}}
		-- , / . {{{
		-- <>:
		-- <S>:
		-- <L>:
		-- <C>:
		-- <M>:
		-- <m>:
		-- <g>:
		-- <j>:
		-- , / . }}}

		-- specific
		-- ["v"] = { '"_dp', "paste", opts = { nowait = true } },
		-- ["V"] = { '"_dP', "Paste", opts = { nowait = true } },
	}, -- v }}}
	o = { --{{{
		-- common
		-- h/n
		["n"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
		["e"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
		["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
		["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
		-- Leader
		["<leader>n"] = { '"}"', "paragraph forward", opts = { expr = true } },
		["<leader>e"] = { '"{"', "paragraph previous", opts = { expr = true } },
		-- Ctrl + Shift is Edge / Easy Motion

		-- i / h
		-- WordMotion
		["<leader>h"] = { "^", "To the first non-blank character of the line", opts = { nowait = true } },
		["<leader>i"] = { "$", "To the end of the line", opts = { nowait = true } },
		["<leader>H"] = { "0", "To the first character of the line", opts = { nowait = true } },
		["<leader>I"] = { "+", "Lines downward, on the first non-blank character", opts = { nowait = true } },
		-- y / u
		["y"] = { "<Right>", opts = { nowait = true } },
		["u"] = { "<Left>", opts = { nowait = true } },
		-- s/tw
		["s"] = { "i", "in", opts = { nowait = true } },
		["t"] = { "a", "around", opts = { nowait = true } },
		-- ["S"] = { 'I', "Insert" , opts = { nowait = true }},
		-- ["T"] = { 'A', "Append" , opts = { nowait = true }},
	}, --}}}
	i = { --{{{
		["<C-h>"] = { "<Left>", opts = { nowait = true } },
		-- ["<C-i>"] = { "<Right>", opts = { nowait = true } },
		["<C-r>"] = { "<ESC>R", "replace line", opts = { nowait = true } },
		["<C-a>"] = { "<Esc>0i", "move start", opts = { nowait = true } },
		["<C-d>"] = { "<C-u>", "move previous", opts = { nowait = true } },
		["<C-f>"] = { "<C-e>", "move previous", opts = { nowait = true, noremap = true } },
		["<C-p>"] = { "<C-y>", "move previous", opts = { nowait = true } },

		["<C-v>"] = { "<C-r><C-r>", "paste", opts = { nowait = true } },
		["<C-b>"] = { '<ESC>"+pi', "paste", opts = { nowait = true } },

		["<C-c>"] = { "<ESC>", "paste", opts = { nowait = true } },
	}, --}}}
} --}}}
-- M.edgemotion = { --{{{
-- 	-- toggle comment in both modes
-- 	n = {
-- 		["N"] = { "<Plug>(edgemotion-j)", "Edge forward", opts = { expr = true } },
-- 		["E"] = { "<Plug>(edgemotion-k)", "Edge previous", opts = { expr = true } },
-- 	},
-- 	v = {
-- 		["N"] = { "<Plug>(edgemotion-j)", "Edge forward", opts = { expr = true } },
-- 		["E"] = { "<Plug>(edgemotion-k)", "Edge previous", opts = { expr = true } },
-- 	},
-- 	o = {
-- 		["N"] = { "<Plug>(edgemotion-j)", "Edge forward", opts = { expr = true } },
-- 		["E"] = { "<Plug>(edgemotion-k)", "Edge previous", opts = { expr = true } },
-- 	},
-- } --}}}
M.easymotion = { --{{{
	-- toggle comment in both modes
	n = {
		["Y"] = {
			"<Plug>(easymotion-lineforward)",
			"To the occurrence of {char} to the left",
			opts = { expr = true },
		},
		["U"] = {
			"<Plug>(easymotion-linebackward)",
			"Till before the occurrence of {char} to the right.",
			opts = { expr = true },
		},
		["<C-n>"] = { "<Plug>(easymotion-j)", "JK motion option", opts = { expr = true } },
		["<C-e>"] = { "<Plug>(easymotion-k)", "JK motion option", opts = { expr = true } },
		["f"] = { "<Plug>(easymotion-bd-fl)", "To the occurrence of {char} to the left", opts = { expr = true } },
		["F"] = {
			"<Plug>(easymotion-Fl)",
			"Till before the occurrence of {char} to the right.",
			opts = { expr = true },
		},
		["p"] = { "<Plug>(easymotion-tl)", "To the occurrence of {char} to the left", opts = { expr = true } },
		["P"] = {
			"<Plug>(easymotion-Tl)",
			"Till before the occurrence of {char} to the right.",
			opts = { expr = true },
		},
		-- ["<leader>w"] = { "<Plug>(easymotion-overwin-w)", "jump", opts = { expr = true } },
		-- ["<leader>s"] = { "<Plug>(easymotion-overwin-f2)", "jump", opts = { expr = true } },
	},
	v = {
		["Y"] = {
			"<Plug>(easymotion-lineforward)",
			"To the occurrence of {char} to the left",
			opts = { expr = true },
		},
		["U"] = {
			"<Plug>(easymotion-linebackward)",
			"Till before the occurrence of {char} to the right.",
			opts = { expr = true },
		},
		["<C-n>"] = { "<Plug>(easymotion-j)", "JK motion option", opts = { expr = true } },
		["<C-e>"] = { "<Plug>(easymotion-k)", "JK motion option", opts = { expr = true } },
		["f"] = { "<Plug>(easymotion-bd-fl)", "To the occurrence of {char} to the left", opts = { expr = true } },
		["F"] = {
			"<Plug>(easymotion-Fl)",
			"Till before the occurrence of {char} to the right.",
			opts = { expr = true },
		},
		["p"] = { "<Plug>(easymotion-tl)", "To the occurrence of {char} to the left", opts = { expr = true } },
		["P"] = {
			"<Plug>(easymotion-Tl)",
			"Till before the occurrence of {char} to the right.",
			opts = { expr = true },
		},
		-- ["<leader>s"] = { "<Plug>(easymotion-bd-f2)", "jump", opts = { expr = true } },
		-- ["<leader>w"] = { "<Plug>(easymotion-bd-w)", "jump", opts = { expr = true } },
	},
	o = {
		["Y"] = {
			"<Plug>(easymotion-lineforward)",
			"To the occurrence of {char} to the left",
			opts = { expr = true },
		},
		["U"] = {
			"<Plug>(easymotion-linebackward)",
			"Till before the occurrence of {char} to the right.",
			opts = { expr = true },
		},
		["<C-n>"] = { "<Plug>(easymotion-j)", "JK motion option", opts = { expr = true } },
		["<C-e>"] = { "<Plug>(easymotion-k)", "JK motion option", opts = { expr = true } },
		["f"] = { "<Plug>(easymotion-bd-fl)", "To the occurrence of {char} to the left", opts = { expr = true } },
		["F"] = {
			"<Plug>(easymotion-Fl)",
			"Till before the occurrence of {char} to the right.",
			opts = { expr = true },
		},
		["p"] = { "<Plug>(easymotion-tl)", "To the occurrence of {char} to the left", opts = { expr = true } },
		["P"] = {
			"<Plug>(easymotion-Tl)",
			"Till before the occurrence of {char} to the right.",
			opts = { expr = true },
		},
		-- ["<leader>s"] = { "<Plug>(easymotion-bd-f2)", "jump", opts = { expr = true } },
		-- ["<leader>w"] = { "<Plug>(easymotion-bd-w)", "jump", opts = { expr = true } },
	},
} --}}}
M.debug = { --{{{
	-- toggle comment in both modes
	-- g?
} --}}}
M.sandwich = { --{{{
	plugin = true,
	n = {
		-- ["w"] = { "<Nop>", "Sandwich" },
		-- ["W"] = { "<Nop>", "Sandwich" },
		["w"] = { "<Plug>(operator-sandwich-add)", "Sandwich" },
		["W"] = { "<Plug>(operator-sandwich-add)<Plug>(operator-sandwich-synchro-count)", "Sandwich" },
		["wd"] = {
			"<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)",
			"Sandwich",
		},
		["Wd"] = {
			"<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)",
			"Sandwich",
		},
		["wr"] = { "<Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-auto-a)", "Sandwich" },
		["Wr"] = { "<Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-query-a)", "Sandwich" },
	},
	x = {
		-- ["w"] = { "<Nop>", "Sandwich" },
		-- ["W"] = { "<Nop>", "Sandwich" },
		["w"] = { "<Plug>(operator-sandwich-add)", "Sandwich, maybe don't work" },
		["W"] = { "<Plug>(operator-sandwich-add)<Plug>(operator-sandwich-synchro-count)", "Sandwich" },
	},
	o = {
		-- ["w"] = { "<Nop>", "Sandwich" },
		-- ["W"] = { "<Nop>", "Sandwich" },
		["w"] = { "<Plug>(textobj-sandwich-auto-i)", "Sandwich" },
		["W"] = { "<Plug>(textobj-sandwich-query-i)", "Sandwich" },
		["sw"] = { "<Plug>(textobj-sandwich-auto-i)", "Sandwich" },
		["sW"] = { "<Plug>(textobj-sandwich-query-i)", "Sandwich" },
		["tw"] = { "<Plug>(textobj-sandwich-auto-a)", "Sandwich" },
		["tW"] = { "<Plug>(textobj-sandwich-query-a)", "Sandwich" },
	},
} --}}}
--[[ M.trouble = { --{{{
	-- plugin = true,
	-- toggle comment in both modes
	n = {
		["<C-o>"] = { "<cmd>TroubleToggle quickfix <CR>", "Show Error by LSPs" },
	},
} ]]
--}}}
--[[ M.align = { --{{{
	-- plugin = true,
	n = {
		["ga"] = { "<Plug>(EasyAlign)", "align" },
	},
	x = {
		["ga"] = { "<Plug>(EasyAlign)", "align" },
	},
} --}}} ]]
M.nvimtree = { --{{{
	plugin = true,

	n = {
		-- toggle
		["<C-l>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
		-- focus
		-- ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
	},
} --}}}
M.lsp = { --{{{
	--plugin = true,
	n = {
		-- Standard LSP
		-- safemap("definitionProvider", "n", "gd", cancelable("textDocument/definition"), "[G]oto [D]efinition")
		-- safemap("declarationProvider", "n", "gD", cancelable("textDocument/declaration"), "[G]oto [D]eclaration")
		-- safemap("typeDefinitionProvider", "n", "<leader>D", cancelable("textDocument/typeDefinition"), "Type [D]efinition")
		-- safemap("implementationProvider", "n", "gi", cancelable("textDocument/implementation"), "[G]oto [I]mplementation")
		-- safemap("referencesProvider", "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", "[G]oto [R]eferences")
		-- Only map K if keywordprg is not ':help'
		--["g."] = { "<cmd>Lspsaga lsp_finder<CR>", "lsp" },
		--["lo"] = { "<cmd>Lspsaga code_action<CR>", "lsp" },
		--["gr"] = { "<cmd>Lspsaga rename<CR>", "lsp" },
		--["gd"] = { "<cmd>Lspsaga peek_definition<CR>", "lsp" },

		["gD"] = {
			function()
				vim.lsp.buf.declaration()
			end,
			"lsp declaration",
		},

		["gd"] = {
			function()
				vim.lsp.buf.definition()
			end,
			"lsp definition",
		},

		["B"] = {
			function()
				vim.lsp.buf.hover()
			end,
			"lsp hover",
		},

		["<leader>b"] = {
			function()
				vim.lsp.buf.implementation()
			end,
			"lsp implementation",
		},
		-- ["<C-b>"] = {
		-- 	function()
		-- 		vim.lsp.buf.signature_help()
		-- 	end,
		-- 	"lsp signature_help",
		-- },

		["<C-b"] = {
			function()
				vim.lsp.buf.type_definition()
			end,
			"lsp definition type",
		},

		["gr"] = {
			function()
				require("nvchad_ui.renamer").open()
			end,
			"lsp rename",
		},

		["lo"] = {
			function()
				vim.lsp.buf.code_action()
			end,
			"lsp code_action",
		},

		["mb"] = {
			function()
				vim.lsp.buf.references()
			end,
			"lsp references",
		},

		["mB"] = {
			function()
				vim.diagnostic.open_float()
			end,
			"floating diagnostic",
		},

		["<leader>y"] = {
			function()
				vim.diagnostic.goto_prev()
			end,
			"goto prev",
		},

		["<leader>u"] = {
			function()
				vim.diagnostic.goto_next()
			end,
			"goto_next",
		},

		--[[ ["<leader>q"] = {
		function()
		  vim.diagnostic.setloclist()
		end,
		"diagnostic setloclist",
	  } ]]

		["<C-q>"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"lsp formatting",
		},

		--[[     ["<leader>wa"] = {
		function()
		  vim.lsp.buf.add_workspace_folder()
		end,
		"add workspace folder",
	  },
	  ["<leader>wr"] = {
		function()
		  vim.lsp.buf.remove_workspace_folder()
		end,
		"remove workspace folder",
	  },
	  ["<leader>wl"] = {
		function()
		  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end,
		"list workspace folders",
	  }, ]]
	},
	x = {
		--["lo"] = { "<cmd>Lspsaga code_action<CR>", "lsp" },
		["<C-q>"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"lsp formatting",
		},
	},
} --}}}
M.nvterm = { --{{{
	plugin = true,

	t = {
		-- toggle in terminal mode
		[":"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"toggle floating term",
		},

		["<A-h>"] = {
			function()
				require("nvterm.terminal").toggle("horizontal")
			end,
			"toggle horizontal term",
		},

		["<A-v>"] = {
			function()
				require("nvterm.terminal").toggle("vertical")
			end,
			"toggle vertical term",
		},
	},

	n = {
		-- toggle in normal mode
		[":"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"toggle floating term",
		},

		["<A-h>"] = {
			function()
				require("nvterm.terminal").toggle("horizontal")
			end,
			"toggle horizontal term",
		},

		["<A-v>"] = {
			function()
				require("nvterm.terminal").toggle("vertical")
			end,
			"toggle vertical term",
		},
		-- new
		["mu"] = {
			function()
				require("nvterm.terminal").new("horizontal")
			end,
			"new horizontal term",
		},

		["my"] = {
			function()
				require("nvterm.terminal").new("vertical")
			end,
			"new vertical term",
		},
	},
} --}}}
-- M.telescope = { --{{{
-- 	plugin = true,
-- 	n = {
-- 		["lf"] = { "<cmd> Telescope find_files <CR>", "find files" },
-- 		["la"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
-- 		["lw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
-- 		["lb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
-- 		["lt"] = { "<cmd> Telescope help_tags <CR>", "help page" },
-- 		["lO"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
-- 		["lk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },
-- 		["lm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
-- 		["lM"] = { "<cmd> Telescope git_status <CR>", "git status" },
-- 		["lp"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },
-- 		["lc"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
-- 	},
-- } --}}}
-- M.refactoring = { --{{{
-- 	plugin = true,
-- 	n = {
-- 		["qw"] = { "<Cmd>lua require('refactoring').refactor('Extract Block')<CR>", "extract block" },
-- 		["qW"] = { "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", "block to file" },
-- 		["qp"] = { "<Cmd>lua require('refactoring').debug.print_var({ normal = true })<CR>", "print debug" },
-- 		["qP"] = { ":lua require('refactoring').debug.cleanup()<CR>", "remove print debug" },
-- 	},
-- 	x = {
-- 		["qq"] = { "<Cmd>lua require('refactoring').select_refactor()", "print debug" },
-- 		["qw"] = { "<Cmd>lua require('refactoring').refactor('Extract Block')<CR>", "extract block" },
-- 		["qW"] = { "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", "block to file" },
-- 		["qf"] = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", "block to file" },
-- 		["qF"] = {
-- 			"<Esc><Cmd>lua require('<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>').refactor('Extract Function')<CR>",
-- 			"function to file",
-- 		},
-- 		["qg"] = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", "block to file" },
-- 		["qG"] = {
-- 			"<Esc><Cmd>lua require('<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>').refactor('Extract Function')<CR>",
-- 			"function to file",
-- 		},
-- 		["qp"] = { "<Cmd>lua require('refactoring').debug.print_var({ normal = true })<CR>", "print debug" },
-- 	},
-- } --}}}

M.comment = { --{{{
	plugin = true,
	-- toggle comment in both modes
	n = {
		["ll"] = {
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			"toggle comment",
		},
		["lb"] = {
			function()
				require("Comment.api").toggle.blockwise.current()
			end,
			"toggle comment",
		},
		["li"] = {
			function()
				require("Comment.api").insert.linewise.eol()
			end,
			"toggle comment",
		},
		["ln"] = {
			function()
				require("Comment.api").insert.linewise.below()
			end,
			"toggle comment",
		},
		["le"] = {
			function()
				require("Comment.api").insert.linewise.above()
			end,
			"toggle comment",
		},
		["lB"] = {
			function()
				require("Comment.api").insert.blockwise.eol()
			end,
			"toggle comment",
		},
		["lN"] = {
			function()
				require("Comment.api").insert.blockwise.below()
			end,
			"toggle comment",
		},
		["lE"] = {
			function()
				require("Comment.api").insert.blockwise.above()
			end,
			"toggle comment",
		},
	},
	x = {
		["l"] = { "<Plug>(comment_toggle_linewise_visual)", "simple", opts = { nowait = true } },
		["<C-l>"] = { "<Plug>(easyoperator-line-select)", "hoge", opts = { nowait = true } },
		["t"] = { "<Plug>(comment_toggle_blockwise_visual)", "foo", opts = { nowait = true } },
		-- ["ll"] = { "<Plug>(comment_toggle_linewise_visual)", "toggle comment", opts = { noremap = true } },
	},
} --}}}
M.tabufline = { --{{{
	plugin = true,
	n = {
		-- cycle through buffers
		["<leader>f"] = {
			function()
				require("nvchad_ui.tabufline").tabuflineNext()
			end,
			"goto next buffer with f",
		},

		["<leader>p"] = {
			function()
				require("nvchad_ui.tabufline").tabuflinePrev()
			end,
			"goto prev buffer",
		},

		-- pick buffers via numbers
		["<Bslash>"] = { "<cmd> TbufPick <CR>", "Pick buffer" },

		-- close buffer + hide terminal buffer
		["qq"] = {
			function()
				require("nvchad_ui.tabufline").close_buffer()
			end,
			"close buffer",
		},
	},
} --}}}
M.yanky = { --{{{
	plugin = true,
	n = {
		["v"] = { "<Plug>(YankyPutAfter)", "yanky" },
		["V"] = { "<Plug>(YankyPutBefore)", "yanky" },
		["<C-v>"] = { "<Plug>(YankyCycleForward)", "yanky" },
		["<C-c>"] = { "<Plug>(YankyCycleBackward)", "yanky" },
		["gv"] = { "<Plug>(YankyGPutAfter)", "yanky" },
		["gV"] = { "<Plug>(YankyGPutBefore)", "yanky" },
	},
	x = {
		["v"] = { "<Plug>(YankyPutAfter)", "yanky" },
		["V"] = { "<Plug>(YankyPutBefore)", "yanky" },
		["<C-v>"] = { "<Plug>(YankyCycleForward)", "yanky" },
		["<C-c>"] = { "<Plug>(YankyCycleBackward)", "yanky" },
		["gv"] = { "<Plug>(YankyGPutAfter)", "yanky" },
		["gV"] = { "<Plug>(YankyGPutBefore)", "yanky" },
	},
} --}}}
M.marks = { --{{{
	plugin = true,
	n = {
		["<C-m>"] = { "<Plug>(Marks-toggle)", "mask toggle" },
		-- ["V"] = { "<Plug>(YankyPutBefore)", "yanky" },
		-- ["<C-v>"] = { "<Plug>(YankyCycleForward)", "yanky" },
		-- ["<C-c>"] = { "<Plug>(YankyCycleBackward)", "yanky" },
		-- ["gv"] = { "<Plug>(YankyGPutAfter)", "yanky" },
		-- ["gV"] = { "<Plug>(YankyGPutBefore)", "yanky" },
	},
} --}}}
M.dail = { --{{{
	plugin = true,
	n = {
		["<C-z>"] = { "require('dial.map').inc_normal()", "increment", opts = { noremap = true } },
		["<C-a>"] = { "require('dial.map').dec_normal()", "decrement", opts = { noremap = true } },
	},
	x = {
		["<C-z>"] = { "require('dial.map').inc_visual()", "increment" },
		["<C-a>"] = { "require('dial.map').dec_visual()", "decrement" },
	},
} --}}}
-- M.gitsigns = { --{{{
-- 	plugin = true,
--
-- 	n = {
-- 		-- Navigation through hunks
-- 		-- Actions
-- 		["gz"] = {
-- 			function()
-- 				require("gitsigns").reset_hunk()
-- 			end,
-- 			"Reset hunk",
-- 		},
--
-- 		["g;"] = {
-- 			function()
-- 				require("gitsigns").preview_hunk()
-- 			end,
-- 			"Preview hunk",
-- 		},
-- 		["gu"] = {
-- 			function()
-- 				require("gitsigns").next_hunk()
-- 			end,
-- 			"Next hunk",
-- 		},
-- 		["gy"] = {
-- 			function()
-- 				require("gitsigns").prev_hunk()
-- 			end,
-- 			"Previous hunk",
-- 		},
-- 		["gl"] = {
-- 			function()
-- 				package.loaded.gitsigns.blame_line()
-- 			end,
-- 			"Blame line",
-- 		},
-- 		-- dg
-- 		["gx"] = {
-- 			function()
-- 				require("gitsigns").toggle_deleted()
-- 			end,
-- 			"Toggle deleted",
-- 		},
-- 	},
-- } --}}}
M.dap = { --{{{
	-- plugin = true,
	n = {
		["<C-d>"] = { "<Nop>", "tooggle breakpoint" },
		-- ["<C-d>"] = { "<Nop>", "tooggle breakpoint", opt = { noremap = true, silent = true } },
		-- ["<C-d>"] = { "<C-d>", "tooggle breakpoint" },
		["<C-d>b"] = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "tooggle breakpoint" },
		["<C-d>c"] = { "<cmd>lua require('dap').continue()<CR>", "tooggle breakpoint" },
		["<C-d>o"] = { "<cmd>lua require('dap').step_over()<CR>", "tooggle breakpoint" },
		["<C-d>i"] = { "<cmd>lua require('dap').step_info()<CR>", "tooggle breakpoint" },
		["<C-d>h"] = { "<cmd>lua require('dap.ui.widgets').hover()<CR>" },
		["<C-d>r"] = { "<cmd>lua require('dap').repl.open()<CR>" },
		["<C-d>u"] = { "<cmd>lua require('dapui').toggle()<CR>" },
		-- ["<C-d>h"] = { "<Cmd>lua require'telescope'.extensions.dap.commands{}<CR>" },
		["<C-d>v"] = { "<Cmd>lua require'telescope'.extensions.dap.variables{}<CR>" },
		["<C-d>t"] = { "<Cmd>lua require'dap'.run_last()<CR>" },

		-- vim.api.nvim_set_keymap('n', '<F5>', ':DapContinue<CR>', { silent = true })
		-- vim.api.nvim_set_keymap('n', '<F10>', ':DapStepOver<CR>', { silent = true })
		-- vim.api.nvim_set_keymap('n', '<F11>', ':DapStepInto<CR>', { silent = true })
		-- vim.api.nvim_set_keymap('n', '<F12>', ':DapStepOut<CR>', { silent = true })
		-- vim.api.nvim_set_keymap('n', '<leader>b', ':DapToggleBreakpoint<CR>', { silent = true })
		-- vim.api.nvim_set_keymap('n', '<leader>B', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Breakpoint condition: "))<CR>', { silent = true })
		-- vim.api.nvim_set_keymap('n', '<leader>lp', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', { silent = true })
		-- vim.api.nvim_set_keymap('n', '<leader>dr', ':lua require("dap").repl.open()<CR>', { silent = true })
		-- vim.api.nvim_set_keymap('n', '<leader>dl', ':lua require("dap").run_last()<CR>', { silent = true })
	},
}

M.general = { --{{{
	n = { --{{{
		-- n only
		[";"] = { ":", "enter cmdline", opts = { nowait = true } },
		[":"] = { ";", "Plugin Leader", opts = { nowait = true } },
		-- ["<CR>"] = { "<C-f>", "Move Screen Down", opts = { nowait = true } },
		-- ["<S-CR>"] = { "<C-b>", "Move Screen Up", opts = { nowait = true } },
		-- ["<C-CR>"] = { "<C-d>", "Move half-Screen Down", opts = { nowait = true } },
		["<leader><leader>"] = { "<Cmd>w <CR> ", "Save File", opts = { nowait = true } },
		["<"] = { "<<", "Shift leftwards", opts = { nowait = true } },
		[">"] = { ">>", "Shift leftwards", opts = { nowait = true } },
		-- common
		[","] = { "/", "Search forward", opts = { nowait = true } },
		["g,"] = { "?", "Search backward", opts = { nowait = true } },
		["<C-,>"] = { "<C-o>", "Older cursor position in jump list", opts = { nowait = true } },
		["<C-.>"] = { "<C-i>", "newer cursor position in jump list", opts = { nowait = true } },
		["<leader>,"] = { "g;", "Older position in change list", opts = { nowait = true } },
		["<leader>."] = { "g.", "newer position in change list", opts = { nowait = true } },
	}, --}}}
	v = { --{{{
		[";"] = { ":", "enter cmdline", opts = { nowait = true } },
		[":"] = { ";", "Plugin Leader", opts = { nowait = true } },

		["<leader><leader>"] = { "<ESC>", "Esc", opts = { nowait = true } },
		["<"] = { "<gv", "Shift leftwards multi line", opts = { nowait = true } },
		[">"] = { ">gv", "Shift leftwards multi line", opts = { nowait = true } },
	}, --}}}
	i = { --{{{
		["<C-s>"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
		["<C-,>"] = { "<C-i>", "Inset Indent", opts = { nowait = true } },
		["<C-.>"] = { "<C-o>ciw", "Remove forward chank", opts = { nowait = true } },
		["<C-q>"] = { "<ESC>==i", "Fix Indent", opts = { nowait = true } },
	}, --}}}
	o = { --{{{
		["{"] = { "i{", "block", opts = { nowait = true } },
		["("] = { "i(", "block", opts = { nowait = true } },
		["["] = { "i[", "block", opts = { nowait = true } },
		["}"] = { "a{", "block", opts = { nowait = true } },
		[")"] = { "a(", "block", opts = { nowait = true } },
		["'"] = { "i'", "block", opts = { nowait = true } },
		['"'] = { 'i"', "block", opts = { nowait = true } },
		["-"] = { "i-", "block", opts = { nowait = true } },
		["_"] = { "i_", "block", opts = { nowait = true } },
		["2_"] = { "i__", "block", opts = { nowait = true } },
		["s_"] = { "i__", "block", opts = { nowait = true } },
		["t2_"] = { "a__", "block", opts = { nowait = true } },
		["t_"] = { "a_", "block", opts = { nowait = true } },
		["b"] = { "i(", "block", opts = { nowait = true } },
		["sb"] = { "i(", "block", opts = { nowait = true } },
		["tb"] = { "a(", "block", opts = { nowait = true } },
		["B"] = { "i[", "block", opts = { nowait = true } },
		["sB"] = { "i[", "block", opts = { nowait = true } },
		["tB"] = { "a[", "block", opts = { nowait = true } },
		["k"] = { "i{", "block", opts = { nowait = true } },
		["ik"] = { "i{", "block", opts = { nowait = true } },
		["tk"] = { "a{", "block", opts = { nowait = true } },
		["K"] = { "i<", "block", opts = { nowait = true } },
		["iK"] = { "i<", "block", opts = { nowait = true } },
		["tK"] = { "a<", "block", opts = { nowait = true } },
	}, --}}}
} --}}}

-- more keybinds!
--[[
vim.keymap.set("n", "<leader>jc", "<cmd>lua require'dap'.continue()<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>js", "<cmd>lua require'dap'.step_over()<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>jsi", "<cmd>lua require'dap'.step_into()<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>jso", "<cmd>lua require'dap'.step_out()<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>jb", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>jui", ":lua require('dapui').toggle()<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>jro", "<cmd>lua require'dap'.repl.open()<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>jcc", "<cmd>lua require'telescope'.extensions.dap.commands{}<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>jlb", "<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>jv", "<cmd>lua require'telescope'.extensions.dap.variables{}<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>jf", "<cmd>lua require'telescope'.extensions.dap.frames{}<CR>", {silent = true, noremap = true})
-- Notes & Todo
vim.keymap.set('n', '<leader>tv', ":lua require('util.scratches').open_scratch_file()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>t', ":lua require('util.scratches').open_scratch_file_floating()<CR>", {noremap = true, silent = true})
--]]

return M

-- vim: ts=2 et sw=2 fdm=marker
