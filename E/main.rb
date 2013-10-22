string = File.open('product.in','r'){|file| file.read}
mas = string.split(/\n/)
cords = mas[0].to_i
first = mas[1].split(' ')
second = mas[2].split(' ')
a,b = [],[] 
first.each{|i| a << i.to_f}
second.each{|i| b << i.to_f}
i = 0
c = 0
#puts c
loop do
  c +=  a[i] * b[i]
  i+=1
  break if i >= a.length
end
File.open('product.out','w'){|file| file.puts '%.3f' % c }