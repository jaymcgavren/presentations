require 'find'

Find.find(ENV["HOME"]) do |path|
  if FileTest.directory?(path)
    puts path
  end
end
