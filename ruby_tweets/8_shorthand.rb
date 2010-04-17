def method_missing *m;s=m.shift;method(methods.find{|n|n=~/^#{s}/})[*m];end
# class Object;def method_missing(*m);shorthand = m.shift, me, methods;end;end
# class Object;def method_missing(*m);p m.shift, methods, *m;end;end
# class Object;def method_missing(*m);s=m.shift;p methods.find{|n|n=~/^#{s}/}, *m;end;end
# def method_missing(*m);s=m.shift;p methods.find{|n|n=~/^#{s}/},*m;end
# def m s;method methods.find{|n|n=~/^#{s}/};end

# puts 'a'.dafdsadfs
# puts 'hello'.inc('foo')

"TSUjzREHTONazYBUrzREKCAh".rev.sp(/z/).rev.map{|o|o.sw}.jo(' ')