string = File.open('pack.in','r'){|f| f.read}
mas = string.split(' ')
a = mas[0].to_f
b = mas[1].to_f
#a = Math.sqrt(l**2+(b/2)**2)
l =Math.sqrt(a**2 - (b/2)**2)
alfa = Math.acos(b/(2*a))
sungl = 2*a*b*Math.cos(alfa)
S = l*b/2 
p = (a + b/2)
r= S/p
File.open('pack.out','w'){|f| f.puts '%.4f' % r}
