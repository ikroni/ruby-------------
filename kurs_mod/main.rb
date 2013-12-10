require_relative "classes/timer"
require_relative "classes/queue"
require_relative "classes/ticket"
i = 0
c = Timer.new
a = Queue.new

#puts "Inintialized? #{a.initialized?}"
#puts "a.tik? #{a.tik?}"
#puts "a.col_tik? #{a.col_tik?}"
#puts "a.empty? #{a.empty?}"
#puts "a.length #{a.length}"
#puts ""
#puts "Number - Tickets in queue - Tickets entered - Chanel in work - Time now"
while c.end_time > c.now do
  #puts "c.now #{c.now.to_f} c.time_for_log? #{c.time_for_log?.to_f}"
  if c.now.to_f > c.time_for_log?.to_f
    i+=1
    chanel = c.chanel_state? ? "General" : "Reserv"
    #puts "#{i} - #{a.tik?} - #{a.col_tik?} - #{chanel} - #{'%.6f' % c.now.to_f}"
    c.time_for_log
  end
  if c.now >= c.time_next_ticket? 
    b = Ticket.new
    b.time_enter(c.now)
    a.enqueue(b)
    c.time_next_ticket
  end

  (c.chanel_broke if c.now >= c.time_broke_chanel?) unless c.time_broke_chanel? == 0
  (c.chanel_restore if c.now >= c.time_restore_chanel?) unless c.time_restore_chanel? == 0

  if not a.empty? and c.time_work_ticket? == 0
    c.time_work_ticket
    c.ticket_by_reserv_chanel if not c.chanel_state?
  end
  
  if c.time_work_ticket? != 0
    if c.now >= c.time_work_ticket? 
      a.deq
      c.time_work_ticket_zero
    end
  end
end
STDOUT.reopen(File.open('log.txt', 'a+'))
#puts a.store_hist?
dt = a.time_max? - a.time_min?
dt_step = dt / 10
k = [0,0,0,0,0,0,0,0,0,0]
a.store_hist?.each do |s| 
  #puts s*60
  i = a.time_min?
  l = 0
  while i < a.time_max?
    i+=dt_step
    k[l] += 1 if s < i and (s + dt_step) > i
    l+=1
  end
end
puts "Result modeling:"
puts "Work time 60 minut"
#puts "Tickets accepted #{a.col_tik?}"
#puts "Tickets accepted by reserv channel #{c.ticket_by_reserv_chanel?}"
max_t = '%.2f' %(a.time_max? * 60)
min_t = '%.2f' %(a.time_min?*60) 
puts "Max time to transite ticket #{max_t}"
puts "Min time to transite ticket #{min_t}"
puts "Chanel was broked #{c.col_broke?}"
puts "Ticket canceled #{c.ticket_canceled?}"
puts "Time load reserv channel #{c.time_load_reserv_channel?}"
puts "Frequency chanel broke #{c.col_broke?} at 1 houers"
rchl_t = c.time_load_reserv_channel? / 36 
puts "Reserv chanel load #{rchl_t} %"
k.each do |s| puts s end
 