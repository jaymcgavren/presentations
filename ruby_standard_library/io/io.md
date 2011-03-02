!SLIDE subsection
#Files/IO


!SLIDE bullets
#FileUtils

* Do file operations on ANY OS.

!SLIDE transition=scrollUp
    @@@ruby

    require 'fileutils'
    
    FileUtils.mkdir('temp')
    FileUtils.cd('temp') do
      FileUtils.mkdir_p('foo/bar/baz/')
      FileUtils.cp_r('foo', 'qux')
      FileUtils.mv('qux', 'quux')
    end
    puts `find temp`
    FileUtils.rm_rf('temp')

!SLIDE transition=scrollUp
    temp
    temp/foo
    temp/foo/bar
    temp/foo/bar/baz
    temp/quux
    temp/quux/bar
    temp/quux/bar/baz
    
!SLIDE bullets
#Find

* Traverse directory trees

!SLIDE transition=scrollUp
    @@@ruby
    require 'find'

    Find.find('/') do |path|
      if FileTest.directory?(path)
        puts path
      end
    end

!SLIDE transition=scrollUp
    /
    /.Spotlight-V100
    /.Trashes
    /.fseventsd
    /.vol
    /Applications
    /Applications/ATacToe.app
    /Applications/ATacToe.app/Contents
    /Applications/ATacToe.app/Contents/MacOS
    ...
    
!SLIDE bullets
#PStore/YAML::Store

* Write any Ruby object to disk
* Then read it back in
* PStore writes nasty binary stuff
* YAML::Store is plain text

!SLIDE transition=scrollUp
    @@@ruby
    
    #animal.rb
    class Animal
      def initialize(says)
        @vocalization = says
      end
      def speak
        puts @vocalization
      end
    end

!SLIDE transition=scrollUp
    @@@ruby
    require 'animal'
    require 'pstore'
    store = PStore.new('storage.bin')
    store.transaction do
      store['cat'] = Animal.new('meow')
      store['dog'] = Animal.new('woof')
    end
    
    puts File.open('storage.bin').readlines

!SLIDE transition=scrollUp
    {"cato: Animal : @vocalization"	meow" dogo;  ; "	woof

!SLIDE transition=scrollUp
    @@@ruby
    require 'animal'
    require 'pstore'
    store = PStore.new('storage.bin')
    store.transaction do
      store.roots.each do |name|
        puts "the #{name} says: '#{store[name]}'"
      end
    end
    
!SLIDE transition=scrollUp
    the cat says:
    meow
    the dog says:
    woof

!SLIDE bullets

* YAML::Store is a drop-in replacement
* This code is almost identical:

!SLIDE transition=scrollUp
    @@@ruby
    require 'animal'
    require 'yaml/store'
    store = YAML::Store.new('storage.txt')
    store.transaction do
      store['cat'] = Animal.new('meow')
      store['dog'] = Animal.new('woof')
    end

    puts File.open('storage.txt').readlines

!SLIDE bullets transition=scrollUp

* But the output is prettier:

!SLIDE transition=scrollUp
    --- 
    cat: !ruby/object:Animal 
      vocalization: meow
    dog: !ruby/object:Animal 
      vocalization: woof

