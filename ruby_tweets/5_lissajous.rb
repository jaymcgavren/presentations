#ruby -rcurses -e"include Curses;i=0;loop{setpos 12*(Math.sin(i)+1),40*(Math.cos(i*0.2)+1);addstr'.';i+=0.01;refresh}" #ruby

require 'curses' 

include Curses
i=0
loop {
  x = Math.sin(i) + 1
  y = Math.cos(i * 0.2) + 1
  setpos 12 * x, 40 * y
  addstr '.'
  i += 0.01
  refresh
}
