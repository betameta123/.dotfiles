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
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local rep = require("luasnip.extras").rep

-------------------------------------------------------------------------------

local sympy = function(_, snip)
  local node = {}
  local command = "sympySnippet"
  local tmpfile = "/home/kyle/tmp/latex.txt"
  os.execute(command.." '".. snip.captures[1].."' > ".. tmpfile)
  local file = io.open(tmpfile)
  if not file then return "" end
  local formula = file:read('*l')
  table.insert(node, t{formula})
  file:close()
  return formula
end

function is_math()
  return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end

local rec_ls
rec_ls = function()
	return sn(nil, {
		c(1, {
			-- important!! Having the sn(...) as the first choice will cause infinite recursion.
			t({""}),
			-- The same dynamic Node as in the snippet (also note: self reference).
			sn(nil, {t({"", "\t\\item "}), i(1), d(2, rec_ls, {})}),
		}),
	});
end

local vec_gen = function (_, snip)
  local node = {}
  local ins_index = 1
  table.insert(node, t(""))
  for _=1,snip.captures[1] do
    table.insert(node, t"\\draw[->, red] (")
    -- table.insert(node, t(j))
    -- table.insert(node, t(")"))
    table.insert(node, i(ins_index, "Tail"))
    ins_index = ins_index + 1
    table.insert(node, t") -- (")
    table.insert(node, i(ins_index, "Tip"))
    ins_index = ins_index + 1
    table.insert(node, t") node [xshift=")
    table.insert(node, i(ins_index, "8"))
    ins_index = ins_index + 1
    table.insert(node, t", vnode] {$v$}")
    table.insert(node, t{"",""})
  end
  return sn(nil, node)
end

table_node= function(args)
	local tabs = {}
	local count
	table = args[1][1]:gsub("%s",""):gsub("|","")
	count = table:len()
	for j=1, count do
		local iNode
		iNode = i(j)
		tabs[2*j-1] = iNode
		if j~=count then
			tabs[2*j] = t" & "
		end
	end
	return sn(nil, tabs)
end

rec_table = function ()
	return sn(nil, {
		c(1, {
			t({""}),
			sn(nil, {t{"\\\\",""} ,d(1,table_node, {ai[1]}), d(2, rec_table, {ai[1]})})
		}),
	});
end
------------------------------------------------------------------------------
-- Snippets

ls.add_snippets(nil, {
  tex = {
    ---------------------------------------------------------------------------
    -- Headers
    s("name", fmta(
    [[
    \hfill\begin{tabular}{r}
    <>\\
    <>\\
    <>\\
    <>\\
    \end{tabular}\\
    \begin{center}
      \underline{\textbf{<>}}
    \end{center}
    ]], {
      i(1, "Name"),
      i(2, "Date"),
      i(3, "Professor"),
      i(4, "Course Title"),
      i(5, "HW \\#"),
    })),
    s("tableofcontents", fmt(
    [[
    \tableofcontents
    \pagebreak
    ]], {})),

    ---------------------------------------------------------------------------
    -- Sections
    s({trig = "sec::", snippetType='autosnippet'}, {t("\\section{"), i(1), t("}")}),
    s({trig = "ssec::", snippetType='autosnippet'}, {t("\\subsection{"), i(1), t("}")}),
    s({trig="sssec::", snippetType='autosnippet'}, {t("\\subsubsection{"), i(1), t("}")}),
    s({trig="sec*", snippetType='autosnippet'}, {t("\\section*{"), i(1), t("}")}),
    s({trig="ssec*", snippetType='autosnippet'}, {t("\\subsection*{"), i(1), t("}")}),
    s({trig="sssec*", snippetType='autosnippet'}, {t("\\subsubsection*{"), i(1), t("}")}),

    ---------------------------------------------------------------------------
    -- Blocks
    s("begin", fmta([[
    \begin{<>}
      <>
    \end{<>}
    ]], {i(1), i(0), rep(1)})),

    s("item::", {
      t({"\\begin{"}),
      t("itemize"),
      t{"}", ""},
      t({"\t\\item "}), i(1), d(2, rec_ls, {}),
      t({"", "\\end{"}),
      t("itemize"),
      t("}"),
      i(0)
    }),

    s("enum::", {
      t({"\\begin{"}),
      t("enumerate"),
      t{"}", ""},
      t({"\t\\item "}), i(1), d(2, rec_ls, {}),
      t({"", "\\end{"}),
      t("enumerate"),
      t("}"),
      i(0)
    }),

    s({trig = "theo::", snippetType = 'autosnippet'}, fmta([[
    \begin{Theorem}{<>}{<>}
      <>
    \end{Theorem}
    <>
    ]], {i(1), rep(1), i(2), i(0)})),

    s({trig = "def::", snippetType = 'autosnippet'}, fmta([[
    \begin{Definition}{<>}{<>}
      <>
    \end{Definition}
    <>
    ]], {i(1), rep(1), i(2), i(0)})),

    s({trig = "ex::", snippetType = 'autosnippet'}, fmta([[
    \begin{Example}{<>}{<>}
      <>
    \end{Example}
    <>
    ]], {i(1), rep(1), i(2), i(0)})),

    s({trig = "checklist::", snippetType = 'autosnippet'}, fmta([[
    \begin{CheckList}{Task}
      \Task{<>}{<>}
    \end{CheckList}
    <>
    ]], {i(1, "open"), i(2,"Todo"), i(0)})),

    s({trig = "center::", snippetType = 'autosnippet'}, fmta([[
    \begin{center}
      <>
    \end{center}
    <>
    ]], {i(1), i(0)} )),

    s({trig = "codeblock::", snippetType = 'autosnippet'}, fmta([[
    \begin{lstlisting}{language=<>}
      <>
    \end{lstlisting}
    <>
    ]], {
      c(1,
        {
          i(1, "python"),
          i(2, "java"),
          i(3, "c"),
        }),
      i(2), i(0)} )),
    s({trig = "table::", snippetType = 'autosnippet' }, {
      t"\\begin{tabular}{",
      i(1,"0"),
      t{"}",""},
      d(2, table_node, {1}, {}),
      d(3, rec_table, {1}),
      t{"","\\end{tabular}"}
    }),

    s("matrix()", { c(1, { -- causes hanging choice nodes
      sn(nil, { r(1, "matrix")}),
      sn(nil, { t{"\\("}, r(1, "matrix"), t{"\\)"}}),
    }),
    }, {
      stored = {
        matrix = fmta([[
          \begin{<>}
          <>
          \end{<>}
        ]], {
          c(1, {
            t"pmatrix",
            t"vmatrix",
            t"bmatrix",
          }),
          i(2),
          rep(1)
        })
      }
    }),

    ----------------------------------------------------------------------------
    -- Image and graphs
    s("img/", fmta([[
    \graphicspath { {<>} }
    ]], {i(1, "./images/")})),

    s("img:", fmta([[
    \includegraphics[scale=<>]{<>}
    ]], { i(1, "0.5"), i(2, "images/")} )),

    s("graph", c(1, {
      fmta([[
      \begin{tikzpicture}
        \begin{axis}
          addplot3 [
            samples = 20,
            surf,
            fill=<>,
            faceted color = black]{<>}
        \end{axis}
      \end{tikzpicture}
      ]],
      {i(1, "blue"), i(2, "equation")}),
      fmta([[
      \begin{tikzpicture}
        \begin{axis}[
            axis lines = left,
            xlabel = \(<>\),
            ylabel = {\(<>\)},
        ]
        \addplot [
            domain=-<>:<>,
            samples=100,
            color=<>,
        ]
        {<>};
      ]], {
        i(1, "x"),
        i(2, "f(x)"),
        i(3, "-10"),
        i(4, "10"),
        i(5, "5"),
        i(6, "equation"),
      })
    })),

    s({trig = "vecdiag(%d+)", regTrig = true}, {
      d(1, vec_gen)}),

    ---------------------------------------------------------------------------
    -- Symbols
    s({trig = "//", snippetType='autosnippet'}, {t"\\frac{", i(1), t"}{", i(2), t"}"}, {condition = is_math}),
    s({trig = "!=", snippetType='autosnippet'}, t"\\ne", {condition = is_math }),
    s({trig = "<=", snippetType='autosnippet'}, t"\\leq", {condition = is_math}),
    s({trig = ">=", snippetType='autosnippet'}, t"\\geq", {condition = is_math}),
    s({trig = "...", snippetType='autosnippet'}, t"\\dots", {condition = is_math}),
    s({trig = "->", snippetType='autosnippet'}, t"\\rightarrow", {condition = is_math}),
    s({trig = "<-", snippetType='autosnippet'}, t"\\leftarrow", {condition = is_math}),
    s({trig = "<->", snippetType='autosnippet'}, t"\\longleftrightarrow", {condition = is_math}),
    s({trig = "=>", snippetType='autosnippet'}, t"\\implies", {condition = is_math}),
    s({trig = "=>", snippetType='autosnippet'}, t"\\implies", {condition = is_math}),
    s({trig = "!|", snippetType='autosnippet'}, t"\\nmid", {condition = is_math}),
    s({trig = "^", snippetType='autosnippet'}, {t"^{", i(1), t"}", i(0)}, {condition = is_math}),
    s({trig = "_", snippetType='autosnippet'}, {t"_{", i(1), t"}", i(0)}, {condition = is_math}),

    postfix(".bar", {
            l("\\overline{" .. l.POSTFIX_MATCH .. "}", {condition = is_math}),
    }),
    postfix(".hat", {
            l("\\hat{" .. l.POSTFIX_MATCH .. "}", {condition = is_math}),
    }),
    postfix(".vec", {
            l("\\vec{" .. l.POSTFIX_MATCH .. "}", {condition = is_math}),
    }),
    postfix("/", {
    d(1, function (_, parent)
      return sn(nil, {t("\\frac{" .. parent.env.POSTFIX_MATCH .. "}{"), i(1), t("}")}, {condition = is_math})
    end)
    }),

    postfix({trig = ".$"}, {
            l("\\(" .. l.POSTFIX_MATCH .. "\\)"),
    }),
    postfix(".!", {
            l("\\[" .. l.POSTFIX_MATCH .. "\\]"),
    }),

    --------------------------------------------------------------------------
    -- Functions
    s({trig = "sum", snippetType = 'autosnippet'}, fmta([[\sum_{<>=<>}^{<>} <>]], {
      i(1,"n"), i(2,"0"), i(3,"\\infty"), i(4,"a_n")}
      ), {condition = is_math}),

    s({trig = "prod", snippetType = 'autosnippet'}, fmta([[
    \prod_{<>=<>}^{<>} <>
    ]], {
      i(1,"n"), i(2,"0"), i(3,"\\infty"), i(4,"a_n")}
      ), {condition = is_math}),
    s({trig = "lim"}, fmta([[
    \lim_{<> \to <>}
    ]], {i(1, "x"), i(2,"0")}), {condition=is_math}),
    s("int", fmta([[
    \int_{<>}^<> {<> \,<>}
    ]], {i(1, "0"), i(2, "x"), i(3, "f(x)"), i(4, "dx")}), {condition=is_math}),

    ---------------------------------------------------------------------------
    -- Math Environment
    s({trig = "$$", snippetType = 'autosnippet'}, {t"\\(", i(1), t"\\)"}),
    s({trig = "!!", snippetType = 'autosnippet'}, {t"", t"\\[", i(1), t"\\]"}),
    s({trig = "sympy (.*) sympy", regTrig = true}, f(sympy)),
    s({trig = "sympy", priority = 100}, {t"sympy ", i(1), t" sympy"}),
  },
})

