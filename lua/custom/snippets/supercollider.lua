local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
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
    i(2, 'name'),
    t { ',', '' },
    t { '        \\dur, ' },
    i(3, '1'),
    t { ',', '' },
    t { '    )', '' },
    t { ').quant_(1);', '' },
    t { ');' },
  }),
}
