local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function copy(args)
  return args[1]
end

return {
  s('angel', {
    t { 'a = Angel.new();' },
  }),
  s('chain', {
    t { 'c = Chain.new(' },
    i(1, 'n_children'),
    t { ', ' },
    i(2, 'n_busses'),
    t { ');' },
  }),
  s('synth', {
    t { '(', '' },
    t { 'SynthDef(\\' },
    i(1, 'name'),
    t { ', {', '' },
    t { '    var sig = SinOsc.ar(440);', '' },
    t { '    sig = sig * \\amp.kr(1);', '' },
    t { '    Out.ar(\\out.kr(0), sig);', '' },
    t { '}).add;', '' },
    t { ');' },
  }),
  s('pdef', {
    t { '(', '' },
    t { 'Pdef(\\' },
    i(1, 'name'),
    t { ',', '' },
    t { '    Pbind(', '' },
    t { '        \\instrument, \\' },
    f(copy, 1),
    t { ',', '' },
    t { '        \\dur, 1,', '' },
    t { '    )', '' },
    t { ').quant_(1);', '' },
    t { ');', '' },
    t { 'Pdef(\\' },
    f(copy, 1),
    t { ').play;', '' },
    t { 'Pdef(\\' },
    f(copy, 1),
    t { ').stop;' },
  }),
}
