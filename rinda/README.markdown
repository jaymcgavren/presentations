Rinda
=====

Rinda lets you set up a "distributed blackboard", a bucket that network clients can write objects to and take objects from.  That's it - the rest is up to your imagination.

## Rinda Documentation

http://www.ruby-doc.org/stdlib/libdoc/rinda/rdoc/index.html

Or:

    ri DRb.start_service
  
    ri Rinda::TupleSpaceProxy
  
## Example

    require 'rinda/rinda'
    MY_URI = "druby://127.0.0.1:9999"
    DRb.start_service 
    space = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, MY_URI))
    space.write(["foo", "bar"])
    key, value = space.take([/foo/, nil])

## Sample Scripts

!http://github.com/jaymcgavren/presentations/raw/master/rinda/rinda_test.png!

Run test_server.rb, then any combination of clients and agents.

Make sure to pass druby://HOST.IP.ADDRESS:PORT as the first command line to each script.  druby://127.0.0.1:9999 is fine if you're only talking to the local host, but if you want to connect to 192.168.0.888 remotely, you *must* specify druby://192.168.0.888:9999 both on the client and 192.168.0.888 itself.  (dRuby seems to want the actual IP, not "localhost" or "127.0.0.1".)