# s=gets(nil).split;i={};x=-1;s.each{|w|(i[w]||=[])<<x+=1};x=0;loop{w=s[x];print (w||exit)+' ';x=i[w][rand(i[w].length)]if rand(9)>7;x+=1}

s=gets(nil).split
i={}
x=-1
s.each{|w|(i[w]||=[])<<x+=1}
x=0
loop{
w=s[x]
print (w||exit)+' '
x=i[w][rand(i[w].length)]if rand(9)>7
x+=1
}
