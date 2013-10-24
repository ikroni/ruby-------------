string = File.open('trianglep.in','r'){|file| file.read}
mas = string.split(/\n/)
col = mas[0].to_i
tri = Array.new(col)
dot = Array.new(col)
rez = Array.new(col)
k=0
i=1
while i < mas.length
  temp = mas[i].split(' ')
  if i%2 == 1
    tri[k] = Array.new(6)
    for j in 0..5
      tri[k][j] = temp[j].to_f
    end
  else
    dot[k] = Array.new(2)
    for j in 0..1
      dot[k][j] = temp[j].to_f
    end
    k+=1
  end
  i+=1
end
i=0
while i<col
  f = (tri[i][0] - dot[i][0])*(tri[i][3]-tri[i][1]) - (tri[i][2]-tri[i][0])*(tri[i][1] - dot[i][1])
  s = (tri[i][2] - dot[i][0])*(tri[i][5]-tri[i][3]) - (tri[i][4]-tri[i][2])*(tri[i][3] - dot[i][1])
  t = (tri[i][4] - dot[i][0])*(tri[i][1]-tri[i][5]) - (tri[i][0]-tri[i][4])*(tri[i][5] - dot[i][1])
  #puts "#{f} #{s} #{t}"
  if (f >= 0 and s >= 0 and t >= 0) or (f <= 0 and s <= 0 and t <= 0)
    rez[i] = "YES"
  else
    rez[i] = "NO"
  end
  i+=1
end
File.open('trianglep.out','w'){|file| file.puts rez}