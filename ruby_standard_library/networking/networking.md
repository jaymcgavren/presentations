!SLIDE subsection
#Networking

!SLIDE bullets
#open-uri

* Open a URL like it was a file

!SLIDE transition=scrollUp
    @@@ruby
    require 'open-uri'
    puts open("http://www.yahoo.com/").readlines

!SLIDE transition=scrollUp
    <!DOCTYPE html>
    <html lang="en-US" class="y-fp-bg y-fp-pg-grad  bkt701">
    <!-- m2 template 0 -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

        <title>Yahoo!</title>
        ...

!SLIDE bullets
#Net::HTTP

* Inspect headers
* POST form data
* HTTPS
* Much more

!SLIDE transition=scrollUp
    @@@ruby
    require 'net/http'
    response = Net::HTTP.start('www.google.com') do |http|
      http.get '/'
    end
    puts response.header['set-cookie']

!SLIDE transition=scrollUp
   
    PREF=ID=857ab0688d6dfdd2:FF=0:TM=1298869554:L
    M=1298869554:S=pbnfqRB3ngHR9QmM; expires=Wed,
    27-Feb-2013 05:05:54 GMT; path=/;
    domain=.google.com,
    NID=44=R_QSpR1KWEgGGFhwQTEuC-11IZTg3Gjgb5gg_F
    sQbE6prTHre2-iLdgrORxyLuyx1fGY5laff-ugwa0bazt
    ajJbZ-W3ALixQU18haj3EkrJ75U75FJlZBK65XQlcmRAc
    ; expires=Tue, 30-Aug-2011 05:05:54 GMT;
    path=/; domain=.google.com; HttpOnly

!SLIDE bullets
#More Net::* Libraries

* Net::FTP
* Net::IMAP
* Net::POP
* Net::SMTP
* Net::Telnet

!SLIDE bullets
#DRb

* Network-enable ANY Ruby object!

!SLIDE transition=scrollUp
#Service
    @@@ruby
    require 'drb'
    require 'animal'
    $SAFE = 1 # Always set $SAFE level!
    cat = Animal.new("meow")
    url = "druby://0.0.0.0:9000"
    DRb.start_service(url, cat)
    DRb.thread.join

!SLIDE transition=scrollUp
#Client
    @@@ruby
    require 'drb'
    DRb.start_service
    url = "druby://0.0.0.0:9000"
    animal = DRbObject.new(nil, url)
    animal.speak

!SLIDE transition=scrollUp
#Output from the service:
     
    meow