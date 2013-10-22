line = File.open('line.in','r'){|file| file.read}
string = line.split(' ')
cord = []
string.each{|sim| cord << sim.to_i}
#puts cord
a = cord[1] - cord[3]
#puts a
b = -(cord[0] - cord[2])
#puts b
c = -(a*cord[0] + b*cord[1])
#puts c
File.open('line.out','w'){|file| file.puts "#{a} #{b} #{c}"}