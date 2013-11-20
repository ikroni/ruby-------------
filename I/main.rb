string = File.open('maxdist.in','r'){|file| file.read}
mas = string.split(/\n/)
cities = mas[0].to_i
D = Array.new(cities)
for i in 0..cities
  D[i] = Array.new(cities)
  for j in 0..cities
    D[i][j] = 0.0 if i == j
    D[i][j] = Float::MAX if i != j
  end
end
i = 1
city = Array.new(cities)
k = 0
while i < cities+1
  temp = mas[i].split(' ')
  city[k] = Array.new(2)
  city[k][0] = temp[0].to_i
  city[k][1] = temp[1].to_i
  i+=1
  k+=1
end

roads = mas[i].to_i
k = 0
road = Array.new(roads)

while i < mas.length-1
  temp = mas[i+1].split(' ')
  road[k] = Array.new(3)
  road[k][0] = temp[0].to_f
  road[k][1] = temp[1].to_f
  x,y = temp[0].to_i - 1,temp[1].to_i - 1
  D[x-1][y-1] = Math.sqrt((city[x][0]-city[y][0])**2+(city[x][1]-city[y][1])**2).to_f
  D[y-1][x-1] = Math.sqrt((city[x][0]-city[y][0])**2+(city[x][1]-city[y][1])**2).to_f
  i+=1
  k+=1
end

for k in 0..city.length-1
  for i in 0..city.length-1
    for j in 0..city.length-1
      D[i][j] = [ D[i][j], D[i][k]+D[k][j] ].min
    end
  end
end

max = 0.0
for i in 0..city.length
  for j in 0..city.length
      max = D[i][j] if D[i][j] > max and D[i][j] < Float::MAX
  end
end
res = '%.7f' % max unless max == 0.0
res_st = "#{res}"
#puts res_st
res_st.chop!
res_st_spl = res_st.split('.')
res_st = res_st_spl[0] if res_st_spl[1] == "000000"
#puts res_st
File.open('maxdist.out','w'){|f| f.puts res_st} unless max == 0.0
File.open('maxdist.out','w'){|f| f.puts '-1'} unless max != 0.0