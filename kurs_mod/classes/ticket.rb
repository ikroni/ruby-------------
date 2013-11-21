class Ticket
  def initialize
    @initialized = true
    @tik = 0
    @state_tik = 0
  end

  def initialized?
    @initialized || false
  end
end