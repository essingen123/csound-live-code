;; Select this code and press ctrl-e to evaluate
;; https://github.com/kunstmusik/csound-live-code/blob/master/doc/intro.md
;; reset_clock()

/* 
  Remix :) 
  Algorave - Happy Algosix!
  Steven Yi<stevenyi@gmail.com>
  http://www.kunstmusik.com
  _ Greetings from Rochester, NY, USA! _ 
  Using: 
  
  * csound - http://csound.com
  * csound-live-code - https://github.com/kunstmusik/csound-live-code | http://live.csound.com
  * BeatViz - https://github.com/kunstmusik/BeatViz
  * vim with csound-vim, csound-repl plugins
  * tmux
  * Win10, MSYS2
*/

set_tempo(124)
set_scale("min")

/* P1 callback instrument 
   for csound-live-code framework, called back every tick (16th note)
   p3 is duration of tick
   p4 is current tick number
*/
  

instr S1
  asig = vco2(ampdbfs(-22), p4) 
  asig += vco2(ampdbfs(-22), p4 * 1.01, 10) 
  asig += vco2(ampdbfs(-22), p4 * 2, 10) 
  asig = zdf_ladder(asig, expon(10000, p3, 400), 5)
  asig = declick(asig) * p5
	outc(asig, asig)
endin

instr S2
  asig = foscili(p5, p4, 1, 1, expon(1, p3, 0.25))
  asig = declick(asig) * expsegr(1, p3, 1, 0.1, 0.001) * 0.35
 outc(asig, asig)
endin

instr P2
  ibeat = p4

  if(hexbeat("888a888f", ibeat) == 1) then
    ipch = xosci(phs(32), array(0, 5, 0, 4, 0, 7, 0, 11))
    ipch += xosc(phs(64), array(0, 0, 2, 3))
    ipch += xosc(phs(128), array(0, 0, 0, 2))
    
    schedule("S2", 0, p3, 
      in_scale(-1, ipch),
      fade_in(6, 128) * ampdbfs(-28))
    schedule("S2", 0, p3, 
      in_scale(-1, ipch + 2),
      fade_in(6, 128) * ampdbfs(-28))
    schedule("S2", 0, p3, 
      in_scale(-1, ipch + 4),
      fade_in(6, 128) * ampdbfs(-28))
    schedule("S2", 0, p3, 
      in_scale(-1, ipch + 6),
      fade_in(6, 128) * ampdbfs(-28))
    schedule("S2", 0, p3, 
      in_scale(-1, ipch + 8),
      fade_in(6, 128) * ampdbfs(-28))
  endif
  
  hexplay("0808080a",
      "Clap", p3,
      in_scale(-1, 0),
      fade_in(11, 128) * ampdbfs(-22))

  hexplay("8",
      "BD", p3,
      in_scale(-1, 0),
      fade_in(9, 128) * ampdbfs(-9)) 

endin

instr P1 

  
  hexplay("0a", 
      "Noi", p3,
      in_scale(1, 0),
      fade_in(128, 128) * ampdbfs(-52))

 /*
  hexplay("8282", 
      "Noi", p3,
      in_scale(1, 0),
      fade_in(128, 128) * ampdbfs(-22))
*/

  
  
  hexplay("8",
      "BD", p3,
      in_scale(-1, 0),
      ampdbfs(-2.6))
  
  
  hexplay("c0020000c002000a", 
     "FM3", p3,
      in_scale(-2, 0),
      fade_in(11, 128) * ampdbfs(-12))

  hexplay("8a8a", 
      "Sub2", p3,
      in_scale(-1, 4),
      fade_in(10, 128) * ampdbfs(-22))


  hexplay("4242", 
      "Sub2", p3,
      in_scale(-1, 2),
      fade_in(9, 128) * ampdbfs(-12))


  hexplay("4242", 
      "Sub2", p3,
      in_scale(-1, 0),
      fade_in(8, 128) * ampdbfs(-22))

  hexplay("09a", 
      "Sub5", p3,
      in_scale(-2, 0),
      fade_in(256, 32) * ampdbfs(-12))

  hexplay("104a", 
      "Sub3", p3,
      in_scale(1, 1),
      fade_in(12, 128) * ampdbfs(-27))

  hexplay("48a2", 
      "Plk", p3,
      in_scale(-1, 0),
      fade_in(128, 64) * ampdbfs(-21))

  hexplay("f", 
      "CHH", p3,
      in_scale(-1, 0),
      fade_in(32, 64) * ampdbfs(-12))

  
  hexplay("08", 
      "SD", p3,
      in_scale(-1, 0),
      fade_in(11, 128) * ampdbfs(-22))



endin









