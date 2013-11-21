class Queue
  def initialize
    @initialized = true
    @tik = 0
    @col_tik = 0
    @col_broke = 0
    @store = []
    @store_hist = []
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
