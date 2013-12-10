class Ticket
  def initialize
    @initialized = true
    @tik = 0
    @state_tik = 0
    @time_enter = 0.0
    @time_finish = 0.0
  end

  def initialized?
    @initialized || false
  end

  def time_enter?
    @time_enter
  end

  def time_enter(a)
    @time_enter += a.to_f
  end

  def time_finish?
    @time_finish
  end

  def time_finish(a)
    @time_finish += a.to_f
  end
end