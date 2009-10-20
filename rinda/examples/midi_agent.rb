require 'rinda/rinda'
require 'rubygems'
require 'midiator'

MY_URI = ARGV[0] || "druby://127.0.0.1:7632"
DRb.start_service
space = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, MY_URI)) 

midi = MIDIator::Interface.new
midi.autodetect_driver

loop do
  key, value = space.take([/Integer/, Integer])
  midi.play value, 0.01
end
