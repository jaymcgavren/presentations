!SLIDE subsection
#Text


!SLIDE
#CSV

!SLIDE transition=scrollUp
    @@@ruby
    data = <<-EOD
    "Thomas, Dave",Programming Ruby,29.95
    "Godin, Seth",The Dip,19.99
    etc,etc,etc
    EOD

!SLIDE transition=scrollUp
    @@@ruby
    data.split("\n").each do |line| 
      puts CSV.parse(line).inspect
    end
    
!SLIDE transition=scrollUp

    [["Thomas, Dave", "Programming Ruby", "29.95"]]
    [["Godin, Seth", "The Dip", "19.99"]]
    [["etc", "etc", "etc"]]


!SLIDE
#erb

!SLIDE transition=scrollUp
    @@@ruby
    items = ['each', 'will', 
      'be', 'a', 'point']

    template = <<-EOD
      <ul>
        <% items.each do |item| %>
          <li><%= item %></li>
        <% end %>
      </ul>
    EOD

!SLIDE transition=scrollUp
    @@@ruby
    require 'erb'

    erb = ERB.new(template)
    erb.run(binding)

!SLIDE transition=scrollUp
    <ul>

        <li>each</li>

        <li>will</li>

        <li>be</li>

        <li>a</li>

        <li>point</li>

    </ul>


!SLIDE
#YAML

!SLIDE transition=scrollUp
    @@@ruby
    array = ['an', 'array', 
      ['of', 'arrays']]
    hash = {
      :a => 'hash',
      :of => {
        :hashes => {:of => 'hashes'}
      }
    }

!SLIDE transition=scrollUp
    @@@ruby
    require 'yaml'

    puts YAML.dump(array)
    puts YAML.dump(hash)
    
!SLIDE transition=scrollUp
    @@@ruby
    data = <<-EOD
    --- !ruby/object:Net::HTTP 
    address: jay.mcgavren.com
    port: 80
    started: false
    use_ssl: false
    EOD

!SLIDE transition=scrollUp
    @@@ruby
    require 'net/http'
    require 'yaml'

    puts YAML.load(data).get('/blog/')
    
!SLIDE transition=scrollUp

    #<Net::HTTPOK:0x1011b7928>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head profile="http://gmpg.org/xfn/11">
            <title>Jay McGavren&#8217;s Journal </title>
            <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

!SLIDE bullets
#REXML

* Caveat: Nokogiri is faster!

!SLIDE transition=scrollUp
    @@@ruby
    require 'rexml/document'

    xml = REXML::Document.new(<<EOD)
    <?xml version="1.0" encoding="UTF-8"?><!DOCT...
    EOD

!SLIDE transition=scrollUp
    @@@ruby
    xml.elements.each('//key') do |key|
      print "#{key.text}: "
      if key.next_sibling
        print "#{key.next_sibling.text}\n"
      end
    end

!SLIDE transition=scrollUp
    data: 
    Apple URL pasteboard type: qss-http://www.google.com/search?hl=en&q=***&num=100
    properties: 
    QSObjectIconName: http://docs.blacktree.com/doku.php?id=quicksilver:web_search_list
    QSObjectName: Google Search
    QSObjectType: Apple URL pasteboard type
    data: 
    Apple URL pasteboard type: qss-http://www.google.com/codesearch?q=***
    properties: 
    QSObjectIconName: http://docs.blacktree.com/doku.php?id=quicksilver:web_search_list
    QSObjectName: Google Code Search
    QSObjectType: Apple URL pasteboard type
    
!SLIDE transition=scrollUp
    @@@ruby
    indent_level = 2
    xml.write($stdout, indent_level)
    
!SLIDE transition=scrollUp
    <?xml version='1.0' encoding='UTF-8'?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN">
    <plist version='1.0'>
      <array>
        <dict>
          <key>
            data
          </key>
          <dict>
            <key>
              Apple URL pasteboard type
            </key>
            <string>
              qss-http://www.google.com/search?hl=en&amp;q=***&amp;num=100
            </string>
          </dict>
          ...
