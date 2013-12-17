class Timer
  def initialize
    @initialized = true
    @start_time = Time.now
    @end_time = @start_time + 60
    @random = '%.2f' % rand
    @time_next_ticket = @start_time + (4 + 8 * @random.to_f)/60
    @time_work_ticket = 0
    @random = '%.2f' % rand
    @time_broke_chanel = @start_time + (165 + 70* @random.to_f)/60
    @time_restore_chanel = 0
    @col_broke_chanel = 0
    @ticket_by_reserv_chanel = 0
    @chanel_state = true
    @time_load_reserv_channel = 0
    @time_for_log = @start_time.to_f + 1.0/60.0
    @ticket_canceled = 0
  end

  def initialized?
    @initialized || false
  end

  def now
    Time.now
  end

  def time_for_log?
    @time_for_log
  end

  def time_for_log
    @time_for_log += 1.0/60.0
  end

  def end_time
    @end_time
  end

  def time_next_ticket?
    @time_next_ticket
  end
  
  def time_next_ticket
    @random = '%.2f' % rand
    @time_next_ticket = self.now + (4 + 8 * @random.to_f)/60
  end

  def time_work_ticket?
    @time_work_ticket
  end

  def time_work_ticket
    @random = '%.2f' % rand
    @time_work_ticket = self.now + (4 + 6 * @random.to_f)/60
    @time_load_reserv_channel += 4 + 6 * @random.to_f if not @chanel_state
  end

  def time_work_ticket_if_chanel_broken
    @random = '%.2f' % rand
    @time_work_ticket = self.now + (2 + 4 + 6 * @random.to_f)/60
    @time_load_reserv_channel += 4 + 6 * @random.to_f
  end

  def time_work_ticket_zero
    @time_work_ticket = 0
  end

  def time_broke_chanel?
    @time_broke_chanel
  end

  def time_broke_chanel
    @random = '%.2f' % rand
    @time_broke_chanel = self.now + (165 + 70 * @random.to_f)/60
  end

  def time_restore_chanel?
    @time_restore_chanel
  end

  def time_restore_chanel
    @random = '%.2f' % rand
    @time_restore_chanel = self.now + (16 + 14 * @random.to_f)/60
  end

  def chanel_broke
    @time_broke_chanel = 0
    self.time_restore_chanel
    if self.time_work_ticket? != 0
      self.time_work_ticket_if_chanel_broken
      @ticket_by_reserv_chanel += 1
      self.ticket_canceled!
    end
    @col_broke_chanel += 1
    @chanel_state = false
    #puts "Chanel broked at #{self.now}, chanel while restore #{self.time_restore_chanel?}"
  end

  def chanel_restore
    #puts "Chanel restored"
    @chanel_state = true
    self.time_broke_chanel
    @time_restore_chanel = 0
    #puts "Chanel restored at #{self.now}, chanel while broke #{self.time_broke_chanel?}"
  end

  def col_broke
    @col_broke_chanel += 1
  end

  def col_broke?
    @col_broke_chanel
  end
  
  def chanel_state?
    @chanel_state
  end

  def ticket_by_reserv_chanel
    @ticket_by_reserv_chanel += 1
  end

  def ticket_by_reserv_chanel?
    @ticket_by_reserv_chanel
  end

  def time_load_reserv_channel?
    @time_load_reserv_channel
  end

  def ticket_canceled?
    @ticket_canceled
  end

  def ticket_canceled!
    @ticket_canceled+=1
  end
end