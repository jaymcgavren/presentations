#OS X only.
require 'rinda/rinda'
require 'rbconfig'
MY_URI = ARGV[0] || "druby://127.0.0.1:7632"
DRb.start_service
space = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, MY_URI))

def say(text)
  case Config::CONFIG['host_os']
  when /^win|mswin/
    require 'win32/sapi5'
    Win32::SpVoice.new.Speak(self.to_s)
  when /darwin/
    text.gsub!(/[^\w\s]/, '') #For safety.
    `say #{text}` unless text.nil? or text.length < 1 or text =~ /^\s*$/
  end
end

loop do
  key, value = space.take([/String/, String])
  say(value)
end
