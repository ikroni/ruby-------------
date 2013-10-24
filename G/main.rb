string = File.open('twoc.in'){|file| file.read}
mas = string.split(' ')
out = ""
x1 = mas[0].to_f
y1 = mas[1].to_f
x2 = mas[2].to_f
y2 = mas[3].to_f
r1 = mas[4].to_f
r2 = mas[5].to_f
dist_x = x1 - x2
dist_y = y1 -y2
l = Math.sqrt(dist_x**2 + dist_y**2)
lr = r1 +r2
(out +="Tangent: outside") if lr == l
#puts l                                                       
(out +="Tangent: ") if l == (r1 - r2).abs
(out +="Too far") if l > lr
(out += "2 inside 1") if r2 < r1 and lr > l and l != (r1 - r2).abs
(out += "1 inside 2") if r2 > r1 and lr > l and l != (r1 - r2).abs
(out += "2 in 1") if r2 < r1 and lr > l and l == (r1 - r2).abs
(out += "1 in 2") if r2 > r1 and lr > l and l == (r1 - r2).abs
(out += "Intersect") if lr > l and (l > (r1 - r2).abs)
File.open('twoc.out','w'){|file| file.puts out}