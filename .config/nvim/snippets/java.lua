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

local param_ls
param_ls = function()
	return sn(nil, {
		c(1, {
			-- important!! Having the sn(...) as the first choice will cause infinite recursion.
			t({""}),
			-- The same dynamicNode as in the snippet (also note: self reference).
			sn(nil, {t({"","* @param "}), i(1), d(2, param_ls, {})}),
		}),
	});
end

ls.add_snippets(nil, {
  java = {
    s("main", fmt([[
    public static void main(String args[]) {{
      {}
    }}
    ]], i(0))),
    s("class", {c(1, {
      t"",
      t"public ",
      t"private ",
      t"protected "

    }), f(function (args, snip)
        return "class " .. snip.env.TM_FILENAME_BASE
    end, {})}),

    s({trig = "sout", autotrig = true}, {
      c(1, {
        sn(nil, { t"System.out.print(" , i(1), t");"}),
        sn(nil, { t"System.out.println(" , i(1), t");"}),
        sn(nil, { t"System.out.printf(" , i(1), t");"}),
        sn(nil, { t"System.err.println(" , i(1), t");"}),
      })
    }),
    s("for",
    c(1, {
      fmt([[
      for({} {} = {}; {} < {}; {}{}) {{
        {}
      }}
      ]], {i(1, "int"), i(2, "i"), i(3, "0"), rep(2), i(4, "max"), rep(2), i(5, "++"), i(0)}),
      fmt([[
      for({} {}: {}) {{
        {}
      }}
      ]], {i(1, "object"), i(2, "var"), i(3, "iterable"), i(0)})
    })
    ),

    s("javadocs", {
      t{"/**", "* "},
      i(1), t{"", "<p>"}, t({"", "* @param "}), i(2), d(3, param_ls, {}),
      t{"", "* @return "}, i(4), t{""},
      t("*/"),
      i(0)
    }),
  }
})
