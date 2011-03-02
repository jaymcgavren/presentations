# Text

## CSV

examples/csv.rb

## erb

examples/erb.rb

## YAML

examples/yaml.rb
examples/yaml_load.rb

## REXML

examples/rexml.rb

# Files/IO

## FileUtils

Do file operations on ANY OS.

    require 'fileutils'
    FileUtils.mkdir_p(path)
    FileUtils.cp_r(path, target)
    FileUtils.rm_rf(path)
    FileUtils.mv(path, target)

## Find

Traverse directory trees

examples/find.rb

## PStore/YAML::Store

    require 'yaml/store'
    module Storage
      STORAGE_FILE = File.join(ENV['HOME'], 'ruby', 'storage.txt')
      Storage = {}
      def save(key, value)
        storage.transaction {storage[key] = value}
      end
      def load(key)
        storage.transaction(true) {value = storage[key]}
      end
      def delete(key)
        storage.transaction {storage.delete(key)}
      end
      def list
        storage.transaction {return storage.roots}
      end
      private
        def storage
          Storage[object_id] ||= YAML::Store.new(STORAGE_FILE)
        end
    end

# Networking

## open-uri

examples/open_uri.rb

    require 'open-uri'
    puts open("http://www.yahoo.com/").readlines

## Net::HTTP

    require 'net/http'
    response = Net::HTTP.start('www.google.com') do |http|
      http.get '/'
    end
    puts response.header

## Net::*

Net::FTP
Net::IMAP
Net::POP
Net::SMTP
Net::Telnet

## Socket

    TCPSocket, UDPSocket

    def open_socket
      @socket = UDPSocket.open
      @socket.bind(nil, @options[:listen_port])
    end
    def listen
      data, sender_info = @socket.recvfrom(MAX_PACKET_SIZE)
      receive(data, sender_info[3])
    end
    def close_socket
      @socket.close
    end

# Other

## Win32OLE

    WIN32OLE.new('iTunes.Application').Play

## Ruby OSA on OS X

## Design Patterns

### Singleton

### Observable

## Logger

    log.debug "Log in."
    if ! server.login(login, password)
      log.error("Could not log in")
    end

## Test::Unit

Just like JUnit.

RSpec is better: 

      sudo gem install rspec

    class TestVector < Test::Unit::TestCase
      def test_addition
        vector = Vector.new(1, 45) + Vector.new(1, 45) #Same angle.
        #Speed should be sum of added vectors' speeds.
        assert_in_delta(2, vector.speed, 0.001)
        #Angle should remain the same.
        assert_in_delta(45, vector.pitch, 0.001)
      end
      #...
    end

assert_equal
assert_not_equal
assert_in_delta
assert_kind_of
assert_nil
assert_same
assert_raise
assert_nothing_raised

## OptionParser

See also GetoptLong

    opt = OptionParser.new

    opt.separator("Program help:")
    opt.on("-h", "--help", TrueClass, "Display program help.") do
      puts opt.help
      exit
    end

    opt.separator("Playback controls:")
    opt.on("-p", "--play-pause", TrueClass, "If currently paused, begin playing.  If currently playing, pause playback.") {|value| config['play-pause'] = value}
    opt.on("--pause", TrueClass, "Pause playback.") {|value| config['pause'] = value}
    opt.on("--play", TrueClass, "Play the current track.") {|value| config['play'] = value}


# Reference

James Britt - http://www.ruby-doc.org/stdlib/

Dave Thomas et al. - Programming Ruby

# Thanks

David Koontz - What's Different About Ruby?

devfu.com - Obnoxious ninjas

Copyright 2009-2011, [Jay McGavren](http://jay.mcgavren.com).

This presentation uses Scott Chacon's [Showoff](http://github.com/schacon/showoff).  Pre-rendered HTML version available [here](http://jay.mcgavren.com/files/presentations/ruby_standard_library).

<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.