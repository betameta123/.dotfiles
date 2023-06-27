local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local function alias(args, snip, _, user_args1, user_args2)
    return sn(nil, fmt([[
    ---
    date: {date}
    alias: {falias}
    ---
    {cNode}
    ]], { date = p(os.date, "%Y%m%d"),
      falias = f(function ()
      return snip.env.TM_FILENAME_BASE:gsub("-", " ")
    end, {}),
    -- cNode = t"hello"}))
    cNode = c(1, {
      t(user_args1),
      t(user_args2)
    })}))
end

ls.add_snippets(nil, {
  markdown = {
    s("alias", d(1, alias, {}, {user_args = {"topic: ", "tags: "}} )),

    s({trig = "theo::", snippetType = 'autosnippet'}, fmt([[
    ```ad-note
    title: {}
    ```

    ]], {i(1)})),
    s({trig = "def::", snippetType = 'autosnippet'}, fmt([[
    ```ad-def
    title: {}
    ```
    ]], {i(1)})),

    s({trig = "ex::", snippetType = 'autosnippet'}, fmt([[
    ```ad-example
    title: {}
    ```
    ]], {i(1)})),
  }
})
