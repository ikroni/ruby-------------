timer = Class.new do
  def initialize
    @initialized = true
    @start_time = Time.now
    @end_time = @start_time + 60
    @random = '%.2f' % rand
    @time_next_ticket = @start_time + (5 + 8 * @random.to_f)/60
    @time_work_ticket = 0
  end

  def initialized?
    @initialized || false
  end

  def now
    Time.now
  end

  def end_time
    @end_time
  end

  def time_next_ticket?
    @time_next_ticket
  end
  
  def time_next_ticket
    @random = '%.2f' % rand
    @time_next_ticket = self.now + (5 + 8 * @random.to_f)/60
  end

  def time_work_ticket?
    @time_work_ticket
  end

  def time_work_ticket
    @random = '%.2f' % rand
    @time_work_ticket = self.now + (4 + 6 * @random.to_f)/60
  end

  def time_work_ticket_zero
    @time_work_ticket = 0
  end
end

ticket = Class.new do
  def initialize
    @initialized = true
    @tik = 0
    @state_tik = 0
  end

  def initialized?
    @initialized || false
  end


end

queue = Class.new do
  def initialize
    @initialized = true
    @tik = 0
    @col_tik = 0
    @store = []
  end

  def initialized?
    @initialized || false
  end

  def tik?
    @tik
  end

  def col_tik?
    @col_tik
  end

  def enqueue(a)
    @store << a
    @tik+=1
    @col_tik+=1
  end

  def dequeue
    @store.shift
    @tik-=1
  end

  def peek
    @store.first
  end
  
  def length
    @store.length
  end

  def empty?
    @store.empty?
  end
end

c = timer.new
a = queue.new
puts "Inintialized? #{a.initialized?}"
puts "a.tik? #{a.tik?}"
puts "a.col_tik? #{a.col_tik?}"
puts "a.empty? #{a.empty?}"
puts "a.length #{a.length}"
puts ""
while c.end_time > c.now do
  if c.now >= c.time_next_ticket? 
    b = ticket.new
    a.enqueue(b)
    puts "a.tik? #{a.tik?}"
    puts "a.col_tik? #{a.col_tik?}"
    puts "a.empty? #{a.empty?}"
    puts "a.length #{a.length}"
    puts ""
    c.time_next_ticket
  end
  c.time_work_ticket unless a.empty?
  if c.time_work_ticket? != 0
    if c.now >= c.time_work_ticket? 
      a.dequeue
      c.time_work_ticket_zero
    end
  end
end