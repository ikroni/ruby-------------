string = File.open('triangles.in','r'){|file| file.read}
mas = string.split(/\n/)
col = mas[0].to_i
i = 1
a = Array.new(mas.length-1)
while i < mas.length
  temp = mas[i].split(' ')
  a[i-1] = Array.new(2)
  a[i-1][0] = temp[0].to_f
  a[i-1][1] = temp[1].to_f
  i+=1
end
#puts a
#b = a.sort_by{|elem| elem[0]}
#puts ""
#puts b.first
#puts b.last
#center_x = b.first[0] + (b.first[0].abs + b.last[0].abs)/2
#puts "Center x"
#puts center_x
#b = a.sort_by{|elem| elem[1]}
#center_y = b.first[1] + (b.first[1].abs + b.last[1].abs)/2
#puts "Center y"
#puts center_y
ln = []
k = 0
for i in 0..col-1
  for j in i+1..col-1
    for m in j+1..col-1
      ln[k] = Array.new(4)
      ln[k][0] = i 
      ln[k][1] = j
      ln[k][2] = m
      ln[k][3] = Math.sqrt((a[i][0]-a[j][0])**2+(a[i][1]-a[j][1])**2) + Math.sqrt((a[j][0]-a[m][0])**2+(a[j][1]-a[m][1])**2) + Math.sqrt((a[m][0]-a[i][0])**2+(a[m][1]-a[i][1])**2) 
      k+=1
    end
  end
end
dot = ln.sort_by{|elem| elem[3]}.first
File.open('triangles.out','w'){|file| file.puts "#{'%.0f' % (dot[0]+1)} #{'%.0f' % (dot[1]+1)} #{'%.0f' % (dot[2]+1)}"}
