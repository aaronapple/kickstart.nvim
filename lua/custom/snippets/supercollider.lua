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
    t { '    var env = Env.adsr(\\a.kr(0.001),\\d.kr(0.2),\\s.kr(0.5),\\r.kr(0.1),1,\\crv.kr(-4)).kr(2, gate:\\gate.kr(1));', '' },
    t { '    sig = sig * env * \\amp.kr(1);', '' },
    t { '    Out.ar(\\out.kr(0), Pan2.ar(sig, \\pan.kr(0)));', '' },
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
