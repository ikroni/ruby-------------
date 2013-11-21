class Queue
  def initialize
    @store = []
  end

  def empty?
    @store.empty?
  end

  def enq(a)
    @store << a
  end

  def deq
    @store.shift
  end

  def length
    @store.length
  end
  
end