require 'rexml/document'

xml = REXML::Document.new(<<EOD)
<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN""http://www.apple.com/DTDs/PropertyList-1.0.dtd"><plist version="1.0"><array><dict><key>data</key><dict><key>Apple URL pasteboard type</key><string>qss-http://www.google.com/search?hl=en&amp;q=***&amp;num=100</string></dict><key>properties</key><dict><key>QSObjectIconName</key><string>http://docs.blacktree.com/doku.php?id=quicksilver:web_search_list</string><key>QSObjectName</key><string>Google Search</string><key>QSObjectType</key><string>Apple URL pasteboard type</string></dict></dict><dict><key>data</key><dict><key>Apple URL pasteboard type</key><string>qss-http://www.google.com/codesearch?q=***</string></dict><key>properties</key><dict><key>QSObjectIconName</key><string>http://docs.blacktree.com/doku.php?id=quicksilver:web_search_list</string><key>QSObjectName</key><string>Google Code Search</string><key>QSObjectType</key><string>Apple URL pasteboard type</string></dict></dict></array></plist>
EOD

xml.elements.each('//key') do |key|
  print "#{key.text}: "
  print "#{key.next_sibling.text}\n" if key.next_sibling
end

xml.write($stdout, 2)
