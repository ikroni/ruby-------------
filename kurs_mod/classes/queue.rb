class Queue
  def initialize
    @initialized = true
    @tik = 0
    @col_tik = 0
    @col_broke = 0
    @store = []
    @store_hist = []
    @time_max = 0
    @time_min = Float::MAX
    @time_work
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

  def deq
    b = self.peek
    b.time_finish(Time.now)
    @time_work = b.time_finish? - b.time_enter? 
    @time_max = @time_work if @time_max < @time_work
    @time_min = @time_work if @time_min > @time_work
    @store_hist << @time_work
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

  def store_hist?
    @store_hist
  end

  def time_max?
    @time_max
  end

  def time_min?
    @time_min
  end
end
