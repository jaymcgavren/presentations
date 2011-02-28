require 'find'

Find.find('/') do |path|
  if FileTest.directory?(path)
    puts path
  end
end
