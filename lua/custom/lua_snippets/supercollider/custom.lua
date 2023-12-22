-- SuperCollider snippets for LuaSnip
local ls = require'luasnip'
local s = ls.snippet 
local i = ls.insert_node
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta
local snippets = {
s("synthdpb", fmta([[
(
SynthDef.new(\<>, {
  arg bus=0, freq=440, gate=0, amp=0.2, pan=0;  
  var sig, env;
  env = EnvGen.new(Env.adsr(), gate:0, doneAction:2);
  sig = SinOsc.ar(440);
  sig = sig * env * amp;
  sig = Pan2.ar(sig, pan);
  Out.ar(bus, sig);
}).add;
)
]], {
  -- i(1) is at nodes[1], i(2) at nodes[2].
  i(1, "name")
})),
s("pbproxy", fmta([[
(
~<> = Pbind(
  \instrument, <>,
  \deg, 60,
  \legato, 1,
  \dur, 0.5,
);
)
]], {
  -- i(1) is at nodes[1], i(2) at nodes[2].
  i(1, "name"), i(2, "inst")
})),
}
return snippets
