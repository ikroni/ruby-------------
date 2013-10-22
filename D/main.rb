string = File.open('sum.in','r'){|file| file.read}
mas = string.split(/\n/)
cords = mas[0].to_i
first = mas[1].split(' ')
second = mas[2].split(' ')
a,b,c = [],[],[] 
first.each{|i| a << i.to_f}
second.each{|i| b << i.to_f}
i = 0
#c << a[0]+b[0]
puts c
loop do
  c << '%.3f' % (a[i] + b[i])
  i+=1
  break if i >= a.length
end
out = c.join(' ')
File.open('sum.out','w'){|file| file.puts out}