string = File.open('pifagor.in','r'){|f| f.read}
mas = string.split(' ')
ln = []
res = []
mas.each{|m| ln << m.to_f}
for i in 0..ln.length-1
  for j in 0..ln.length-1
    if j!=i
      for k in 0..ln.length-1
        if k!=j and k!=i
          for l in 0..ln.length-1
	    if l!=k and l!=j and l!=i
              for m in 0..ln.length-1
                if m!=l and m!=k and m!=j and m!=i
                  for n in 0..ln.length-1
                    if n!=m and n!=l and n!=k and n!=j and n!=i
                      p = ln[i]/ln[l]
                      if p == ln[j]/ln[m] and p == ln[k]/ln[n]
                        res << "#{'%.0f' % ln[i]} #{'%.0f' % ln[j]} #{'%.0f' % ln[k]} " 
                        res << "#{'%.0f' % ln[l]} #{'%.0f' % ln[m]} #{'%.0f' % ln[n]} "
                      end
                    end
                  end 
                end 
              end
            end 
          end
        end 
      end
    end 
  end
end
File.open('pifagor.out','w'){|f| f.puts "#{res[0]} \n#{res[1]}"}