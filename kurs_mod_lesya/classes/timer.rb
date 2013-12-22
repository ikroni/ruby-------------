class Timer
  def initialize
    @start_time = Time.now
    @end_time = Time.now + 60
    @random = '%.2f' % rand
    @time_ticket_a = @start_time.to_f + 0.006 + 0.006 * @random.to_f
    @random = '%.2f' % rand
    @time_ticket_b = @start_time.to_f + 0.006 + 0.006 * @random.to_f
    @time_trans_a_to_b = 0
    @time_trans_b_to_a = 0
    @time_trans_sputnik = 0
  end

  def now?
    Time.now
  end

  def end?
    @end_time
  end

  def time_ticket_a?
    @time_ticket_a
  end

  def time_ticket_a(a)
    @time_ticket_a = a
  end

  def time_ticket_b?
    @time_ticket_b
  end

  def time_ticket_b(a)
    @time_ticket_b = a
  end

  def time_trans_a_to_b?
    @time_trans_a_to_b
  end

  def time_trans_a_to_b(a)
    @time_trans_a_to_b = a
  end

  def time_trans_b_to_a?
    @time_trans_b_to_a
  end

  def time_trans_b_to_a(a)  
    @time_trans_b_to_a = a
  end

  def time_trans_sputnik?
    @time_trans_sputnik
  end

  def time_trans_sputnik(a)
    @time_trans_sputnik = a
  end
end