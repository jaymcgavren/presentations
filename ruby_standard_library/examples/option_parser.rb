require 'optparse'
require 'win32ole'
player = WIN32OLE.new(
  'musicPlayer.Application'
)
opt = OptionParser.new

opt.separator("Program help:")
opt.on("-h", "--help", TrueClass, "Display help.") do
  puts opt.help
  exit
end

opt.separator("Playback controls:")
opt.on("--play", TrueClass, "Play track.") do
  player.play
end
opt.on("--volume number", Integer, "Set volume.") do |value|
  puts "Setting volume to #{value}"
  player.volume = value
end

opt.parse(ARGV)