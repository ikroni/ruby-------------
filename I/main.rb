string = File.open('maxdist.in','r'){|file| file.read}
mas = string.split(/\n/)
cities = mas[0].to_i
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
  road[k] = Array.new(2)
  road[k][0] = temp[0].to_i
  road[k][1] = temp[1].to_i
  i+=1
  k+=1
end
puts "Cities:"
puts city
puts "Roads:"
puts road

D=[]

for k in 0..city.legth-1
  for i in 0..city.length-1
    for j in 0..city.length-1
      D << Math.sqrt((citi[k][0]-city[i][0])**2+(citi[k][1]-city[i][1])**2)) if 
    end
  end
end
File.open('maxdist.out','w'){|f| f.puts D}
