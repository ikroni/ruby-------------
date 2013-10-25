string = File.open('triangle.in','r'){|f| f.read}
mas = string.split(' ')
p = mas[0].to_f
q = mas[1].to_f
S = p * q / 2
dots = []
dots_for_out =[]
for i in 0..2
  dots[i] = Array.new(2)
  dots[i][0],dots[i][1] = 0.000000,0.000000 if i == 0
  dots[i][0],dots[i][1] = 0.000000,q if i == 1
  dots[i][0],dots[i][1] = p,Random.rand(0..10)*q/10 if i == 2
  dots_for_out << "#{'%.6f' % dots[i][0]} #{'%.6f' % dots[i][1]}"
end
File.open('triangle.out','w'){|f| f.puts S}
File.open('triangle.out','a'){|f| f.puts dots_for_out}
    