radius = File.open('radius.in','r'){|file| file.read}
rad = radius.to_f
diam = rad*2
lenght = rad * Math::PI * 2
area = Math::PI * rad**2
File.open('radius.out','w'){|file| file.puts "#{ '%.3f' % diam} #{ '%.3f' % lenght} #{ '%.3f' % area}"}