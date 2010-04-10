# ruby -e "i=0;loop{puts ' '*(29*(Math.sin(i)/2+1))+'|'*(29*(Math.cos(i)/2+1)); i+=0.1}" #ruby

i=0;
loop {
  #sin() and cos() range -1 to 1
  left_width = Math.sin(i) / 2 + 1
  wave_width = Math.cos(i) / 2 + 1
  print ' ' * (29*left_width)
  print '|' * (29*wave_width)
  print "\n"
  i += 0.1
}