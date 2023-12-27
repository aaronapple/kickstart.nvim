-- Tidalcycles snippets for LuaSnip
local ls = require'luasnip'
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local snippets = {
	s("d1", { t("d1 $ "), i(1) }),
	s("d2", { t("d2 $ "), i(1) }),
	s("d3", { t("d3 $ "), i(1) }),
	s("d4", { t("d4 $ "), i(1) }),
	s("d5", { t("d5 $ "), i(1) }),
	s("d6", { t("d6 $ "), i(1) }),
	s("once", { t("once $ "), i(1) }),
    s({trig = "drawLine", dscr='visualize pattern: drawLine "pattern"'},
        { t("drawLine "), i(1, "pattern") }),
    s("setcps", { t("setcps("), i(1), t(")") }),
    s({trig = "sound", dscr='sound "bd bd"'}, { t('s "'), i(1), t('"') }),
    s("silence", { t("silence") }),
    s("hush", { t("hush") }),
    s("panic", { t("panic") }),
    s("sine", { t("sine") }),
    s("cosine", { t("cosine") }),
    s("square", { t("square") }),
    s("tri", { t("tri") }),
    s("saw", { t("saw") }),
    s("isaw", { t("isaw") }),
    s("perlin", { t("perlin") }),
    s({trig="smooth", dscr='continuous interpolation between numbers in a pattern:\nsmooth "0 1 0.5 1"'},
        { t('smooth "'), i(1), t('"') }),
    s("rand", { t("rand") }),
    s({trig="irand", dscr="random integers: irand 8"},
        { t("irand "), i(1) }),
    s({trig="range", dscr="scale values: range min max"},
        { t("range "), i(1, "min"), t(" "), i(2, "max"), t(" $ "), i(3,"func") }),
    s("slow", {t("slow "), i(1, "int"), t(" $ "), i(2, "func")}),
    s("fast", {t("fast "), i(1, "int"), t(" $ "), i(2, "func")}),
}
return snippets