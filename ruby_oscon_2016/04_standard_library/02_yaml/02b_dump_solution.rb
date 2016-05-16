require "yaml"

class Song
  attr_accessor :title, :artist
end

song = Song.new
song.title = "I Am the Highway"
song.artist = "Audioslave"

puts YAML.dump(song)
