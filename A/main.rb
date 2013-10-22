vector = File.open('vector.in','r'){|file| file.read}
a = vector.split(" ")
b = 0.00
a.each{|cord| b = cord.to_f**2 + b }
b = Math.sqrt(b) 

File.open('vector.out','w'){|file| file.puts '%.2f' % b}