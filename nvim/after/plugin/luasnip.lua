local ls = require("luasnip")
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
-- some shorthands...

local types = require("luasnip.util.types")
ls.config.set_config({
	history = true, --keep around last snippet local to jump back
	updateevents = "TextChanged,TextChangedI", --update changes as you type
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
        virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,
})

vim.keymap.set({"i", "s"}, "<c-l>", function ()
 if ls.expand_or_jumpable() then
  ls.expand_or_jump()
 end
end, { silent = true})

vim.keymap.set({"i", "s"}, "<c-h>", function ()
 if ls.jumpable(-1) then
  ls.jump(-1)
 end
end, { silent = true})

vim.keymap.set({"i", "s"}, "<c-s>", function ()
 if ls.choice_active() then
  ls.change_choice(1)
 end
end, { silent = true})

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
