# echo ";class <<STDOUT;def write(*a);super(*a.map{|o|o.reverse});end;end#pair+=crazy">>config/environments/development.rb

class <<STDOUT
  def write(*a)
    super(
      *a.map{|o|
        o.reverse
      }
    )
  end
end

#All these pass through write()...
p 'pair+=crazy'
printf "\n%03d", 1
puts "Hello, Phoenix Ruby Users Group!"
